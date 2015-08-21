<?php
/*
 * Template Name: Full Width
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

if (have_posts()) :
    while (have_posts()) :
        the_post();
        ?>
        <article class="post page">
                <?php if (has_childrens() > 0) : { ?>

                    <span class="parent-child">
                        <?php
                        $args = array(
                            'child_of' => get_top_ancestor_id(),
                            'title_li' => '',
                        );
                        wp_list_pages($args);
                        ?>
                    </span>
            <?php } endif; ?>

            <div class="thetitle"><?php the_title(); ?></div>
            <div class="postinfo"> <?php the_time(); ?> - <?php the_author; ?></div>
            <div class="thumbimage"><?php the_post_thumbnail(); ?> </div>
            <div class="theexcerpt"> 
        <?php the_excerpt(); ?> 
                <a href="<?php the_permalink(); ?>">Read More...</a>
            </div>
            <div class="thecontent"> <?php the_content(); ?> </div>
        </article>
        <?php
    endwhile;
else:
    echo "No Content Found!!!";
endif;



get_footer();

