<?php
/*
 * Template Name: Simple Blog
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 11/08/2015
 */

get_header();
?> 
<h1> BLOG </h1>
<div class="content">
    <div class="main-content">
        <?php get_template_part('inc/loop'); ?>
    </div>
    <div class="lateral-content">
        <?php get_sidebar('right'); ?>
    </div>
</div>

<?php
get_footer();

