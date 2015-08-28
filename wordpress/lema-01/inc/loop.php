<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 27/08/2015
 */


if (have_posts()) :
    while (have_posts()) :
        the_post();
        ?>

        <article class="post">
            <div class="post-title">
                <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
            </div>
            <div class="post-info"> <?php
                echo the_time() . ' '
                . get_the_author() . ' '
                ?></div>
            <div class="post-featured-image">
                <?php the_post_thumbnail(); ?>
            </div>
            <div class="post-excerpt"> 
                <?php the_excerpt(); ?><div> 
                    <a href="<?php the_permalink(); ?>">Read More...</a>
                </div>
            </div>
        </article>
        <?php
    endwhile;
    get_template_part('inc/pagination');
else:
    echo "No Content Found!!!";
endif;
