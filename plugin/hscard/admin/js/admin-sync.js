( function() {
	'use strict';

	const config = window.hscardSync;
	const button = document.getElementById( 'hscard-sync-button' );
	const output = document.getElementById( 'hscard-sync-progress' );

	if ( ! config || ! button || ! output ) {
		return;
	}

	function stop( message ) {
		output.textContent = message
			? message + ' ' + config.failed
			: config.failed;
		button.disabled = false;
		button.textContent = config.start;
	}

	function step( restart ) {
		const body = new URLSearchParams();
		body.set( 'action', config.action );
		body.set( 'nonce', config.nonce );
		body.set( 'restart', restart ? '1' : '0' );

		window
			.fetch( config.ajaxUrl, {
				method: 'POST',
				credentials: 'same-origin',
				headers: {
					'Content-Type':
						'application/x-www-form-urlencoded; charset=UTF-8',
				},
				body: body.toString(),
			} )
			.then( function( response ) {
				return response.json().catch( function() {
					throw new Error( config.invalidResponse );
				} );
			} )
			.then( function( payload ) {
				if ( ! payload.success ) {
					throw new Error(
						payload.data && payload.data.message
							? payload.data.message
							: '',
					);
				}

				const data = payload.data || {};
				if ( data.status === 'complete' ) {
					output.textContent =
						config.complete +
						' ' +
						data.card_count +
						config.cards +
						' / API ' +
						data.page_count +
						config.pages +
						'.' +
						( data.warning
							? ' ' + config.note + ' ' + data.warning
							: '' );
					button.disabled = false;
					button.textContent = config.start;
					window.setTimeout( function() {
						window.location.reload();
					}, 800 );
					return;
				}

				const completed = Math.max(
					0,
					Number( data.next_page || 1 ) - 1,
				);
				output.textContent =
					config.collecting +
					' ' +
					completed +
					'/' +
					data.page_count +
					config.pages +
					', ' +
					data.saved_count +
					'/' +
					data.card_count +
					config.cards;
				window.setTimeout( function() {
					step( false );
				}, 100 );
			} )
			.catch( function( error ) {
				stop( error && error.message ? error.message : '' );
			} );
	}

	button.addEventListener( 'click', function() {
		button.disabled = true;
		button.textContent = config.working;
		output.textContent = config.working;
		step( true );
	} );
}() );
