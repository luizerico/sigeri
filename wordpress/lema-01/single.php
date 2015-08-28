<?php
/**
 * The Template for displaying all single posts
 *
 * @package WordPress
 * @subpackage Twenty_Fourteen
 * @since Twenty Fourteen 1.0
 */
get_header();
?> 
<div class="content">
    <div class="main-content">
        <?php
        while (have_posts()) : the_post();
            ?>
            <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                <?php
                // Page thumbnail and title.
                //lema-01_post_thumbnail();
                the_title('<header class="entry-header"><h1 class="entry-title">', '</h1></header><!-- .entry-header -->');
                ?>

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
                </div><!-- .entry-content -->
            </article><!-- #post-## -->
            <?php
            // Previous/next post navigation.
            // lema-01_post_nav();
            // If comments are open or we have at least one comment, load up the comment template.
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


