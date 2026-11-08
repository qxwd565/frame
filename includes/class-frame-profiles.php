<?php
/** Date-sensitive frame selection for the native renderer. @package HScard */
namespace HScard;

if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Frame_Profiles {
	const CURRENT = 'current';
	const HISTORICAL = 'historical';

	/**
	 * Resolve the frame resource profile for a KST calendar date.
	 * Only a verified, installed asset profile may be selected.
	 *
	 * @param string $date YYYY-MM-DD.
	 * @return string Available frame profile identifier.
	 */
	public static function for_date( $date ) {
		$date = (string) $date;
		if ( ! preg_match( '/^([0-9]{4})-([0-9]{2})-([0-9]{2})$/', $date, $parts ) || ! checkdate( (int) $parts[2], (int) $parts[3], (int) $parts[1] ) ) {
			return self::CURRENT;
		}
		return self::HISTORICAL;
	}
}
