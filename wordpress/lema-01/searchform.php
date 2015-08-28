<?php

/* 
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 26/08/2015
 */
?>
<form role="search" method="get" class="search-form" action="<?php echo home_url( '/' ); ?>">
    
<!--        <span class="screen-reader-text"><?php echo _x( 'Search for:', 'label' ) ?></span>-->
        <input type="search" class="search-field"
            placeholder="<?php echo esc_attr_x( 'Search …', 'placeholder' ) ?>"
            value="<?php echo get_search_query() ?>" name="s"
            title="<?php echo esc_attr_x( 'Search for:', 'label' ) ?>" />
    
    
    <input type="submit" class="search-submit"
        value="<?php echo esc_attr_x( ' ', 'submit button' ) ?>" />
</form>
<span class="search-form"> </span>
