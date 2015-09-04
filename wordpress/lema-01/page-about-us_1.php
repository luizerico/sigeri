<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 11/08/2015
 */

get_header();

if (have_posts()) :
    while (have_posts()) :
        the_post();
        ?>
        <article class="post page">
            <div class="thetitle title-column"><?php the_title(); ?></div>
            <div class="thecontent content-column"> <?php the_content(); ?> </div>
        </article>
        <?php
    endwhile;
else:
    echo "No Content Found!!!";
endif;

get_footer();
?>
