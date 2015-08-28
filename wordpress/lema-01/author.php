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
        <?php if (is_author()) : ?>
            <?php
            $curauth = (isset($_GET['author_name'])) ? get_user_by('slug', $author_name) : get_userdata(intval($author));
            $author_url = $curauth->user_url;
            ?>
            <div class="author-bio clearfix">
                <p class="author-avatar"><?php echo get_avatar($curauth->user_email, $size = '48'); ?></p>
                <h2 class="author-name"><?php _e('About', 'lema-01'); ?> <?php echo $curauth->first_name; ?> <?php echo $curauth->last_name; ?></h2>
                <?php if ($author_url != ''): ?><p class="author-url"><a href="<?php echo $author_url; ?>"><?php echo $author_url; ?></a></p><?php endif; //author url ?>
                <div class="author-description">
                    <?php echo $curauth->user_description; ?>
                </div>
                <!-- /.author-description -->
            </div>
            <!-- /.author bio -->

            <h2 class="author-posts-by"><?php _e('Posts by', 'lema-01'); ?> <?php echo $curauth->first_name; ?> <?php echo $curauth->last_name; ?>:</h2>
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


