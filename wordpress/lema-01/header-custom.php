<!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <meta charset="<?php bloginfo('charset') ?>">
        <meta name="viewport" content="width=device-width">
        <title><?php bloginfo('name'); ?></title>
        <?php wp_head(); ?>        
    </head>
    <body>
        <div class="site-container">
            <!-- Site Header -->
            <header class="site-header">
                <div class="header-top"> Social <?php get_search_form(); ?>
                </div>
                <div class="header-bottom">
                    <div class="header-pre">
                        <span class="header-title">
                            <a  href="<?php echo home_url(); ?>"><?php bloginfo('name'); ?></a>
                        </span>
                        <span class="header-subtitle"><?php bloginfo('description'); ?></span>                 
                    </div>    
                    <nav class="header-post">
                        <div class="menu-nav">
                            <?php
                            wp_nav_menu(array('theme_location' => 'primary',
                                'menu_class' => ''));
                            ?>
                        </div>
                    </nav> 
                </div>
                <div class="header-slider">
                    -------
                </div>

            </header>

            <!-- Site Header -->

            <div>

