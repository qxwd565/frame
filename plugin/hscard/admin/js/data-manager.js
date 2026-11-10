/** HScard admin-only: progressively enhanced source input and JSON validation. */
( function () {
  'use strict';

  const root = document.querySelector('.hscard-manager');
  if (!root) return;

  const form = root.querySelector('[data-hscard-source-form]');
  const setKey = root.querySelector('[data-hscard-auto-set]');
  if (setKey) {
    const source = setKey.form.querySelector('[name="source_id"]');
    const help = setKey.form.querySelector('[data-hscard-set-help]');
    let manual = setKey.value;
    function updateSetKey() {
      const repository = source.options[source.selectedIndex].dataset.setId || '';
      if (!setKey.readOnly) manual = setKey.value;
      setKey.value = repository || manual;
      setKey.readOnly = !!repository;
      help.textContent = repository ? '저장소 이름으로 자동 지정됩니다.' : '저장소 연결을 선택하면 ID가 자동으로 입력됩니다.';
    }
    source.addEventListener('change', updateSetKey);
    updateSetKey();
  }
  const repository = form && form.querySelector('[name="source_repository"]');
  if (repository) {
    const preview = form.querySelector('#hscard-repository-url');
    const updateRepository = function () {
      const name = repository.value.trim();
      const valid = /^[A-Za-z0-9_.-]{1,100}$/.test(name) && name !== '.' && name !== '..';
      repository.setCustomValidity(name && !valid ? 'URL 대신 저장소 이름만 입력하세요.' : '');
      preview.textContent = valid ? repository.dataset.repositoryPrefix + name + repository.dataset.repositorySuffix : '';
      preview.hidden = !valid;
    };
    repository.addEventListener('input', updateRepository);
    repository.addEventListener('change', function () { repository.value = repository.value.trim(); updateRepository(); });
    updateRepository();
  }
  /** Perform syntax checks only on explicit request or on save (large files). */
  function validate(textarea, result) {
    try {
      const raw = textarea.value.trim();
      if (!raw) throw new Error('JSON 내용을 입력하세요.');
      const data = JSON.parse(raw);
      if (!data || typeof data !== 'object' || Array.isArray(data) ||
          data.schema !== 1 || typeof data.set !== 'string' ||
          !/^[A-Za-z0-9][A-Za-z0-9 _-]{0,95}$/.test(data.set) ||
          !Array.isArray(data.cards) || data.cards.length < 1 || data.cards.length > 5000) {
        throw new Error('schema: 1, 영문 세트 이름과 카드 1~5,000장이 필요합니다.');
      }
      if (result) {
        result.textContent = '기본 구조가 올바릅니다. 카드별 내용은 저장할 때 검사합니다.';
        result.className = 'hscard-validation is-ok';
      }
      textarea.removeAttribute('aria-invalid');
      return true;
    } catch (error) {
      const message = error && error.message ? error.message : 'JSON 형식을 확인하세요.';
      if (result) {
        result.textContent = message;
        result.className = 'hscard-validation is-error';
      } else {
        window.alert(message);
      }
      textarea.setAttribute('aria-invalid', 'true');
      textarea.focus();
      return false;
    }
  }

  const editor = root.querySelector('[data-hscard-json-form]');
  if (editor) {
    const textarea = editor.querySelector('textarea[name="json_text"]');
    const result = editor.querySelector('[data-hscard-validation]');
    const file = editor.querySelector('input[name="json_file"]');
    const check = editor.querySelector('[data-hscard-validate]');
    if (check) check.addEventListener('click', function () { validate(textarea, result); });
    textarea.addEventListener('input', function () {
      textarea.removeAttribute('aria-invalid');
      result.textContent = '';
      result.className = 'hscard-validation';
    });
    editor.addEventListener('submit', function (event) {
      if (file && file.files && file.files.length) return; // Upload takes precedence; PHP validates it.
      if (!validate(textarea, result)) event.preventDefault();
    });
  }

  root.addEventListener('submit', function (event) {
    const target = event.target;
    if (!target.matches('form[data-hscard-confirm]')) return;
    const message = target.getAttribute('data-hscard-confirm');
    if (message && !window.confirm(message)) event.preventDefault();
  });

  const orderList = root.querySelector('[data-hscard-source-order]');
  if (orderList) {
    const rows = function () { return Array.from(orderList.querySelectorAll(':scope > tr[data-source-id]')); };
    const status = root.querySelector('[data-hscard-order-status]');
    const sortable = window.jQuery && window.jQuery.fn.sortable ? window.jQuery(orderList) : null;
    let saved = rows(), saving = false, statusTimer;
    function refreshControls() {
      const list = rows();
      list.forEach(function (row) {
        row.querySelector('.hscard-sort-handle').disabled = saving;
      });
      if (sortable) sortable.sortable('option', 'disabled', saving || list.length < 2);
    }
    async function saveOrder() {
      const next = rows();
      if (saving || next.every(function (row, i) { return row === saved[i]; })) return;
      const focus = orderList.contains(document.activeElement) ? document.activeElement : null;
      saving = true; refreshControls(); clearTimeout(statusTimer);
      status.textContent = '저장 중…'; status.classList.remove('is-error');
      orderList.setAttribute('aria-busy', 'true');
      const body = new URLSearchParams({action:'hscard_reorder_sources', nonce:orderList.dataset.orderNonce});
      next.forEach(function (row) { body.append('order[]', row.dataset.sourceId); });
      const controller = new AbortController(), timer = setTimeout(function () { controller.abort(); }, 15000);
      try {
        const response = await fetch(orderList.dataset.orderUrl, {method:'POST', credentials:'same-origin', body:body, signal:controller.signal});
        const payload = await response.json().catch(function () { throw new Error('저장 응답을 확인할 수 없습니다. 새로고침 후 다시 시도하세요.'); });
        if (!response.ok || !payload.success) throw new Error(payload.data && payload.data.message || '순서를 저장하지 못했습니다. 다시 시도하세요.');
        saved = next;
        status.textContent = '순서 저장됨';
        statusTimer = setTimeout(function () { status.textContent = ''; }, 2000);
      } catch (error) {
        saved.forEach(function (row) { orderList.appendChild(row); });
        status.textContent = error.name === 'AbortError' ? '저장 응답이 없습니다. 새로고침 후 순서를 확인하세요.' : error.message;
        status.classList.add('is-error');
      } finally {
        clearTimeout(timer); saving = false; orderList.setAttribute('aria-busy', 'false'); refreshControls();
        if (focus && document.activeElement === document.body) focus.focus({preventScroll:true});
      }
    }
    function move(row, direction) {
      if (saving || !row) return;
      const list = rows(), index = list.indexOf(row), other = list[index + direction];
      if (!other) return;
      if (direction < 0) orderList.insertBefore(row, other); else orderList.insertBefore(other, row);
      row.querySelector('.hscard-sort-handle').focus();
      saveOrder();
    }
    if (sortable) sortable.sortable({
      items:'> tr[data-source-id]', handle:'.hscard-sort-handle', axis:'y', tolerance:'pointer',
      cancel:'a,input,textarea,select,option', placeholder:'hscard-sort-placeholder', forcePlaceholderSize:true,
      helper:function (event, row) {
        const clone = row.clone();
        clone.children().each(function (index) { window.jQuery(this).width(row.children().eq(index).width()); });
        return clone;
      },
      update:saveOrder
    });
    let touchedRow = null;
    orderList.addEventListener('touchstart', function (event) {
      const handle = event.target.closest('.hscard-sort-handle');
      if (!handle || saving || event.touches.length !== 1) return;
      touchedRow = handle.closest('[data-source-id]');event.preventDefault();
    }, {passive:false});
    orderList.addEventListener('touchend', function (event) {
      if (!touchedRow || !event.changedTouches.length) return;
      const touch = event.changedTouches[0], target = document.elementFromPoint(touch.clientX,touch.clientY)?.closest('[data-source-id]');
      const row = touchedRow;touchedRow = null;
      if (!target || target === row || target.parentElement !== orderList) return;
      const box = target.getBoundingClientRect();
      orderList.insertBefore(row, touch.clientY < box.top + box.height / 2 ? target : target.nextSibling);
      saveOrder();event.preventDefault();
    }, {passive:false});
    orderList.addEventListener('touchcancel', function () { touchedRow = null; });
    orderList.addEventListener('keydown', function (event) {
      if (!event.target.closest('.hscard-sort-handle') || !['ArrowUp','ArrowDown'].includes(event.key)) return;
      event.preventDefault(); move(event.target.closest('[data-source-id]'), event.key === 'ArrowUp' ? -1 : 1);
    });
    refreshControls();
  }
}() );
