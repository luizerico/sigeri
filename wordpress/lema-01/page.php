<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 11/08/2015
 */

get_header();

/* Widget Area */
if (is_active_sidebar('sidebar-left')) : ?>
    <div id="widget-area" class="widget-area" role="complementary">
        <?php dynamic_sidebar('sidebar-left'); ?>
    </div><!-- .widget-area -->
<?php
endif;

get_template_part('inc/loop');

get_footer();

