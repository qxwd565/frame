/** HScard admin-only: progressively enhanced source input and JSON validation. */
( function () {
  'use strict';

  const root = document.querySelector('.hscard-manager');
  if (!root) return;

  const form = root.querySelector('[data-hscard-source-form]');
  const choices = form && form.querySelector('[data-hscard-methods]');
  if (choices) {
    const radios = Array.from(choices.querySelectorAll('input[name="hscard_add_method"]'));
    const panels = Array.from(form.querySelectorAll('[data-hscard-mode-panel]'));
    const updateMode = function () {
      const selected = radios.find(function (radio) { return radio.checked; });
      const mode = selected ? selected.value : 'url';
      panels.forEach(function (panel) {
        const active = panel.getAttribute('data-hscard-mode-panel') === mode;
        panel.hidden = !active;
        panel.querySelectorAll('input,textarea,select').forEach(function (input) {
          input.disabled = !active;
          input.required = active;
        });
      });
    };
    radios.forEach(function (radio) { radio.addEventListener('change', updateMode); });
    updateMode();
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

  if (form && choices) {
    const directText = form.querySelector('textarea[name="json_text"]');
    const feedback = form.querySelector('[data-hscard-validation]');
    if (directText && feedback) directText.addEventListener('input', function () {
      directText.removeAttribute('aria-invalid');
      feedback.textContent = '';
      feedback.className = 'hscard-validation';
    });
    form.addEventListener('submit', function (event) {
      const selected = choices.querySelector('input[name="hscard_add_method"]:checked');
      if (!selected || selected.value !== 'text') return;
      const textarea = form.querySelector('textarea[name="json_text"]');
      if (!validate(textarea, form.querySelector('[data-hscard-validation]'))) event.preventDefault();
    });
  }

  root.addEventListener('submit', function (event) {
    const target = event.target;
    if (!target.matches('form[data-hscard-confirm]')) return;
    const message = target.getAttribute('data-hscard-confirm');
    if (message && !window.confirm(message)) event.preventDefault();
  });

  const menus = Array.from(root.querySelectorAll('details.hscard-row-more'));
  menus.forEach(function (menu) {
    menu.querySelector('summary').addEventListener('click', function () {
      if (menu.open) return;
      menus.forEach(function (other) { if (other !== menu) other.open = false; });
    });
  });
  root.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') menus.forEach(function (menu) { menu.open = false; });
  });
}() );
