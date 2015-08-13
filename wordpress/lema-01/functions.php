<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 11/08/2015
 */

function lema01_resources() {
    wp_enqueue_style('style', get_stylesheet_uri());
}

function lema01_show_submenu() {
    
}

function lema01_alert() {
    echo '<script> alert("TESTE");</script>';
}

// Get top ancestor
function get_top_ancestor_id() {
    global $post;

    if ($post->post_parent) {
        $ancestors = array_reverse(get_post_ancestors($post->ID));
        return $ancestors[0];
    }
    return $post->ID;
}

function has_childrens() {
    global $post;
    return count(get_pages('child_of=' . $post->ID));
}

add_action('wp_enqueue_scripts', 'lema01_resources');
add_action('wp_enqueue_scripts', 'lema01_show_submenu');
//add_action('wp_enqueue_scripts', 'lema01_alert');

register_nav_menus(array(
    'primary' => __('Primary Menu'),
    'secondary' => __('Secondary Menu'),
    'footer' => __('Footer Menu'),
));

/* Widget Init Sample */

function lema01_widgets_init() {
    register_sidebar(array(
        'name' => __('Left Sidebar', 'lema01'),
        'id' => 'sidebar-left',
        'description' => __('Add widgets here to appear in your sidebar.', 'lema01'),
        'before_widget' => '<aside id="%1$s" class="widget %2$s">',
        'after_widget' => '</aside>',
        'before_title' => '<h2 class="widget-title">',
        'after_title' => '</h2>',
    ));
    register_sidebar(array(
        'name' => __('Right Sidebar', 'lema01'),
        'id' => 'sidebar-right',
        'description' => __('Add widgets here to appear in your sidebar.', 'lema01'),
        'before_widget' => '<aside id="%1$s" class="widget %2$s">',
        'after_widget' => '</aside>',
        'before_title' => '<h2 class="widget-title">',
        'after_title' => '</h2>',
    ));
}

add_action('widgets_init', 'lema01_widgets_init');

/* Sample Template Code */

require get_template_directory() . '/widgets.php';

add_action('widgets_init', function() {
    register_widget('LE01_Widget');
});


/* Featured Images */

add_theme_support('post-thumbnails');


/* Admin Menus */

/** Step 2 (from text above). */
add_action('admin_menu', 'my_plugin_menu');

/** Step 1. 
 * https://codex.wordpress.org/Adding_Administration_Menus
 */
function my_plugin_menu() {
    /* add_theme_page('My Plugin Options', 'Top Menu', 'manage_options', 'my-topmenu-identifier', 'my_plugin_options'); */

    add_menu_page('My Plugin Options', 'Top Menu', 'manage_options', 'my-topmenu-identifier', 'my_plugin_options');
    add_submenu_page('my-topmenu-identifier', 'My Plugin Options', 'Sub Menu', 'manage_options', 'my-submenu-identifier', 'my_sub_plugin_options');
}

/** Step 3. */
function my_plugin_options() {
    if (!current_user_can('manage_options')) {
        wp_die(__('You do not have sufficient permissions to access this page.'));
    }
    echo '<div class="wrap">';
    echo '<p>Here is where the form would go if I actually had options.</p>';
    echo '</div>';
}

function my_sub_plugin_options() {
    if (!current_user_can('manage_options')) {
        wp_die(__('You do not have sufficient permissions to access this page.'));
    }
    echo '<div class="wrap">';
    echo '<p>Here is where the form would go if I actually had options.</p>';
    echo '</div>';
}

// Hook for adding admin menus
add_action('admin_menu', 'mt_add_pages');

// action function for above hook
function mt_add_pages() {
    // Add a new submenu under Settings:
    add_options_page(__('Test Settings', 'menu-test'), __('Test Settings', 'menu-test'), 'manage_options', 'testsettings', 'mt_settings_page');

    // Add a new submenu under Tools:
    add_management_page(__('Test Tools', 'menu-test'), __('Test Tools', 'menu-test'), 'manage_options', 'testtools', 'mt_tools_page');

    // Add a new top-level menu (ill-advised):
    add_menu_page(__('Test Toplevel', 'menu-test'), __('Test Toplevel', 'menu-test'), 'manage_options', 'mt-top-level-handle', 'mt_toplevel_page');

    // Add a submenu to the custom top-level menu:
    add_submenu_page('mt-top-level-handle', __('Test Sublevel', 'menu-test'), __('Test Sublevel', 'menu-test'), 'manage_options', 'sub-page', 'mt_sublevel_page');

    // Add a second submenu to the custom top-level menu:
    add_submenu_page('mt-top-level-handle', __('Test Sublevel 2', 'menu-test'), __('Test Sublevel 2', 'menu-test'), 'manage_options', 'sub-page2', 'mt_sublevel_page2');
}

// mt_settings_page() displays the page content for the Test settings submenu
//function mt_settings_page() {
//    echo "<h2>" . __('Test Settings', 'menu-test') . "</h2>";
//}

// mt_tools_page() displays the page content for the Test Tools submenu
function mt_tools_page() {
    echo "<h2>" . __('Test Tools', 'menu-test') . "</h2>";
}

// mt_toplevel_page() displays the page content for the custom Test Toplevel menu
function mt_toplevel_page() {
    echo "<h2>" . __('Test Toplevel', 'menu-test') . "</h2>";
}

// mt_sublevel_page() displays the page content for the first submenu
// of the custom Test Toplevel menu
function mt_sublevel_page() {
    echo "<h2>" . __('Test Sublevel', 'menu-test') . "</h2>";
}

// mt_sublevel_page2() displays the page content for the second submenu
// of the custom Test Toplevel menu
function mt_sublevel_page2() {
    echo "<h2>" . __('Test Sublevel2', 'menu-test') . "</h2>";
}

// mt_settings_page() displays the page content for the Test settings submenu
function mt_settings_page() {

    //must check that the user has the required capability 
    if (!current_user_can('manage_options')) {
        wp_die(__('You do not have sufficient permissions to access this page.'));
    }

    // variables for the field and option names 
    $opt_name = 'mt_favorite_color';
    $bck_color = 'mt_bck_color';
    $fgd_color = 'mt_fgd_color';
    
    $hidden_field_name = 'mt_submit_hidden';
    $data_field_name = 'mt_favorite_color';
    $data_bck_name = 'mt_bck_color';
    $data_fgd_name = 'mt_fgd_color';

    // Read in existing option value from database
    $opt_val = get_option($opt_name); 
    $bck_val = get_option($bck_color);
    $fgd_val = get_option($fgd_color);

    // See if the user has posted us some information
    // If they did, this hidden field will be set to 'Y'
    if (isset($_POST[$hidden_field_name]) && $_POST[$hidden_field_name] == 'Y') {
        // Read their posted value
        $opt_val = $_POST[$data_field_name];
        $bck_val = $_POST[$data_bck_name];
        $fgd_val = $_POST[$data_fgd_name];

        // Save the posted value in the database
        update_option($opt_name, $opt_val);
        update_option($bck_color, $bck_val);
        update_option($fgd_color, $fgd_val);

        // Put a "settings saved" message on the screen
        ?>
        <div class="updated"><p><strong><?php _e('settings saved.', 'menu-test'); ?></strong></p></div>
        <?php
    }

    // Now display the settings editing screen

    echo '<div class="wrap">';

    // header

    echo "<h2>" . __('Menu Test Plugin Settings', 'menu-test') . "</h2>";

    // settings form
    ?>

    <form name="form1" method="post" action="">
        <input type="hidden" name="<?php echo $hidden_field_name; ?>" value="Y">

        <p><?php _e("Favorite Color:", 'menu-test'); ?> 
            <input type="text" name="<?php echo $data_field_name; ?>" value="<?php echo $opt_val; ?>" size="20">
        </p><hr />
        <p><?php _e("Background Color:", 'menu-test'); ?> 
            <input type="text" name="<?php echo $data_bck_name; ?>" value="<?php echo $bck_val; ?>" size="20">
        </p><hr />
        <p><?php _e("Foreground Color:", 'menu-test'); ?> 
            <input type="color" name="<?php echo $data_fgd_name; ?>" value="<?php echo $fgd_val; ?>" size="20">
        </p><hr />

        <p class="submit">
            <input type="submit" name="Submit" class="button-primary" value="<?php esc_attr_e('Save Changes') ?>" />
        </p>

    </form>
    </div>

    <?php
}
