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
<div class="content">
    <div class="main-content">

        <?php
        while (have_posts()) : the_post();
            ?>
            <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                <div class="entry-info">
                    <?php echo get_avatar($curauth->user_email, $size = '48'); ?>
                    <small>Written by  
                        <?php the_author_posts_link(); ?> 
                        on <?php the_time('F jS, Y') ?> 
                        under <?php the_category(', ') ?>                        
                    </small>                    
                </div>
                <?php
                // Page thumbnail and title.
                //lema-01_post_thumbnail();
                the_title('<header class="entry-header">', '</header><!-- .entry-header -->');
                ?>
                <div class="post-featured-image">
                    <?php the_post_thumbnail(); ?>
                </div>

                <div class="entry-content">

                    <?php
                    the_content();
                    wp_link_pages(array(
                        'before' => '<div class="page-links"><span class="page-links-title">' . __('Pages:', 'lema-01') . '</span>',
                        'after' => '</div>',
                        'link_before' => '<span>',
                        'link_after' => '</span>',
                    ));

                    edit_post_link(__('Edit', 'lema-01'), '<span class="edit-link">', '</span>');
                    ?>

                    <div class="post-tags">
                        <p><?php the_tags('<ul><li>', '</li><li>', '</li></ul>' ); ?></p>
                    </div>
                </div><!-- .entry-content -->
            </article><!-- #post-## -->

            <?php
            get_template_part('inc/pagination');

            if (comments_open() || get_comments_number()) {
                comments_template();
            }
        endwhile;
        ?>
    </div>
    <div class="lateral-content">
        <?php get_sidebar('right'); ?>
    </div>
</div>

<?php
get_footer();


