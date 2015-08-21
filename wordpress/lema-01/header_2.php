<!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <meta charset="<?php bloginfo('charset') ?>">
        <meta name="viewport" content="width=device-width">
        <title><?php bloginfo('name'); ?></title>
        <?php wp_head(); ?>
        <style>
            .site-header {
                <?php
                if (has_header_image()) {
                    echo "background: url('" . get_header_image() . "') no-repeat top center;";
                }
                ?> }
            nav.site-nav {
                <?php
                $menu_position = get_theme_mod('menu_position');
                if ($menu_position === 'bottom') {
                    echo "bottom: 0px;" ; 
                } elseif ($menu_position === 'below') {
                    echo "bottom: -30px;" ;
                } elseif ($menu_position === 'below') {
                    echo "top: 0px;" ;
                }
                ?>
            } 

        </style> 
    </head>
    <body <?php body_class(); ?>>
        <div class="site-container">

            <!-- Site Header -->
            <header class="site-header">   
                <div class="site-header-title">
                    <h1>
                        <a href="<?php echo home_url(); ?>"><?php bloginfo('name'); ?></a>
                    </h1>
                    <h4><?php bloginfo('description'); ?></h4>                 
                </div>    
                <nav class="site-nav">
                    <div class="menu-nav">
                        <?php
                        wp_nav_menu(array('theme_location' => 'primary',
                            'menu_class' => ''));
                        ?>
                    </div>
                </nav> 

            </header>

            <!-- Site Header -->

            <div>

