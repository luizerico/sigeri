<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 11/08/2015
 */

/*
 * Template Name: Common Layout
 */

get_header();

if (have_posts()) :
    while (have_posts()) :
        the_post();
        ?>
        <article class="post">
            <div class="thetitle"><?php the_title(); ?></div>
            <div class="thecontent"> <?php the_content(); ?> </div>
        </article>
        <?php
    endwhile;
else:
    echo "No Content Found!!!";
endif;

get_footer();
?>

