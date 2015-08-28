<!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <meta charset="<?php bloginfo('charset') ?>">
        <meta name="viewport" content="width=device-width">
        <title><?php bloginfo('name'); ?></title>
<!--        <link rel="stylesheet" type="text/css" href="<?php bloginfo('stylesheet_url'); ?>" media="screen" />-->
        <?php wp_head(); ?>        
    </head>
    <body>
        <div class="site-container">
            <!-- Site Header -->
            <header class="site-header">
                <div class="header-top"> 
                    <div class="menu-mobile"> MENU </div>
                    <div class="header-search">
                        <?php get_search_form(); ?>
                    </div>
                </div>
                <div class="header-bottom">
                    <div class="header-pre">
                        <span class="header-title">
                            <a  href="<?php echo home_url(); ?>"><?php bloginfo('name'); ?></a>
                        </span>
                        <span class="header-subtitle"><?php bloginfo('description'); ?></span>                 
                    </div>
                    <div class="header-post">
                        <?php
                        wp_nav_menu(array('theme_location' => 'primary',
                            'menu_class' => 'menu-nav'));
                        ?>
                    </div>

                </div>
                <div class="header-slider">
                    
                </div>

            </header>

            <!-- Site Header -->

            <div>

