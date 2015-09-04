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
        <?php if (is_category() || is_tag() || is_tax()): ?>
            <h1 class="page-title"><?php single_cat_title(); ?></h1>

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


