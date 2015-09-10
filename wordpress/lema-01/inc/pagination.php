<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 27/08/2015
 */
?>

<div class="post-nav">
    <?php
    $prev_post = get_previous_post();
    if (!empty($prev_post)):
        ?>    
    <span class="nav-prev"><a href="<?php echo get_permalink($prev_post->ID); ?>"><?php echo $prev_post->post_title; ?></a></span>
    <?php endif; ?>
    | 
    <?php
    $next_post = get_next_post();
    if (!empty($next_post)):
        ?> 
    <span class="nav-next"><a href="<?php echo get_permalink($next_post->ID); ?>"><?php echo get_the_title($next_post->ID); ?></a></span>
    <?php endif; ?>     
</div>


