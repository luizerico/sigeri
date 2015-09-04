<?php
/*
 * Theme Name: lema-01
 * Author: Luiz Erico <luizerico at gmail.com>
 * URI: http://...
 * Version: 1.0
 * Date: 26/08/2015
 */

if ( function_exists ( dynamic_sidebar('sidebar-right') ) ) :
?>
<div class="sidebar-right">
    <?php
    dynamic_sidebar('sidebar-right');
    ?>
</div>
<?php endif; 