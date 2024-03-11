<?php
class Common {
    public static function formatNumber($number,$decimalplaces) {
        return number_format((float)$number, $decimalplaces, '.', '');
    }
}
?>