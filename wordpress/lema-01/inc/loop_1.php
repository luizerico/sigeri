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
    ?>
    <div class="post-nav">
        <span class="nav-prev"><?php next_posts_link('Older Posts...'); ?></span>
        |
        <span class="nav-next"><?php previous_posts_link('Newer Posts...'); ?></span> 
    </div>
    <?php
else:
    echo "No Content Found!!!";
endif;
