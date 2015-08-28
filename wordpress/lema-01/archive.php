<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 11/08/2015
 */

get_header();
?> 
<div class="content">
    <div class="main-content">
        <?php if (is_day()) : ?>
            <h1 class="page-title"><?php printf('Daily Archives: <span>%s</span>', get_the_date()); ?></h1>
        <?php elseif (is_month()) : ?>
            <h1 class="page-title"><?php printf('Monthly Archives: <span>%s</span>', get_the_date(_x('F Y', 'monthly archives date format', 'lema-01'))); ?></h1>
        <?php elseif (is_year()) : ?>
            <h1 class="page-title"><?php printf('Yearly Archives: <span>%s</span>', get_the_date(_x('Y', 'yearly archives date format', 'lema-01'))); ?></h1>
            <?php
        endif;

        get_template_part('inc/loop');
        ?>
    </div>
    <div class="lateral-content">
        <?php get_sidebar('right'); ?>
    </div>
</div>

<?php
get_footer();


