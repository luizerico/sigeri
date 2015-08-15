<!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <meta charset="<?php bloginfo('charset') ?>">
        <meta name="viewport" content="width=device-width">
        <title><?php bloginfo('name'); ?></title>
        <?php wp_head(); ?>
        <style>
            .site-header {
                <?php if(get_theme_mod('header_image')){ ?>
                background: url('<?php echo wp_get_attachment_url(get_theme_mod('header_image'));?>') no-repeat bottom center;                 
                <?php } else { ?>
                background-color: <?php echo get_theme_mod('header_color');?>;
                <?php }?>
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
                    <div class="div-site-nav">
                        <?php
                        wp_nav_menu(array('theme_location' => 'primary',
                            'menu_class' => ''));
                        ?>
                    </div>
                </nav>
                
            </header>
            <!-- Site Header -->

            <div>

