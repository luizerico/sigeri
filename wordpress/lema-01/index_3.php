<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 11/08/2015
 */

get_header('custom');
?> 
<div class="content">
    <div class="main-content">

        <?php
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
        else:
            echo "No Content Found!!!";
        endif;
        ?>
    </div>
    <div class="lateral-content"></div>
</div>

<?php
get_footer();
?>

