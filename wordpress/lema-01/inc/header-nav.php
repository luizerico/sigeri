<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 17/08/2015
 */
?>
<nav class="site-nav">
    <div class="div-site-nav">
        <?php
        wp_nav_menu(array('theme_location' => 'primary',
            'menu_class' => ''));
        ?>
    </div>
</nav> 