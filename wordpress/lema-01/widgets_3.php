<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 13/08/2015
 */

/**
 * Adds Foo_Widget widget.
 */
class LE01_Widget extends WP_Widget {

    /**
     * Register widget with WordPress.
     */
    public function __construct() {
        parent::__construct(
                'le01_widget', // Base ID
                'LE01_Widget', // Name
                array('description' => __('A LE01 Widget', 'text_domain'),) // Args
        );
    }

    /**
     * Front-end display of widget.
     *
     * @see WP_Widget::widget()
     *
     * @param array $args     Widget arguments.
     * @param array $instance Saved values from database.
     */
    public function widget($args, $instance) {
        extract($args);
        $title = apply_filters('widget_title', $instance['title']);
        $text01 = apply_filters('widget_text', $instance['text01']);

        echo $before_widget;
        if (!empty($title)) {
            echo $before_title . $title . $after_title;
        }
        echo __('Hello, World!', 'text_domain');
        echo __($text01);
        echo $after_widget;
    }

    /**
     * Back-end widget form.
     *
     * @see WP_Widget::form()
     *
     * @param array $instance Previously saved values from database.
     */
    public function form($instance) {
        if (isset($instance['title'])) {
            $title = $instance['title'];
        } else {
            $title = __('New title', 'text_domain');
        }
        if (isset($instance['text01'])) {
            $text01 = $instance['text01'];
        } else {
            $text01 = __('New Text', 'text_domain');
        }
        ?>
        <p>
            <label for="<?php echo $this->get_field_name('title'); ?>"><?php _e('Title:'); ?></label>
            <input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" 
                   name="<?php echo $this->get_field_name('title'); ?>"
                   type = "text" value = "<?php echo esc_attr($title); ?>"/>
        </p>
        <p>
            <label for="<?php echo $this->get_field_name('text01'); ?>"><?php _e('Text:'); ?></label>
            <input class="widefat" id="<?php echo $this->get_field_id('text01'); ?>" 
                   name="<?php echo $this->get_field_name('text01'); ?>"
                   type = "textarea" value = "<?php echo esc_attr($text01); ?>"/>
        </p>
    <?php
    }

    /**
     * Sanitize widget form values as they are saved.
     *
     * @see WP_Widget::update()
     *
     * @param array $new_instance Values just sent to be saved.
     * @param array $old_instance Previously saved values from database.
     *
     * @return array Updated safe values to be saved.
     */
    public function update($new_instance, $old_instance) {
        $instance = array();
        $instance['title'] = (!empty($new_instance['title']) ) ? strip_tags($new_instance['title']) : '';
        $instance['text01'] = (!empty($new_instance['text01']) ) ? strip_tags($new_instance['text01']) : '';

        return $instance;
    }

}

// class LE01_Widget