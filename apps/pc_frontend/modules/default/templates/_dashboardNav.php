<?php if ($navs): ?>
<ul>
<?php foreach ($navs as $nav):?>
<?php if (op_is_accessable_url($nav->uri)):?>
    <?php if ($nav->uri == $position): ?>
        <li id="dashboardnav_<?php echo op_url_to_id($nav->uri) ?>"><?php echo link_to($nav->caption, $nav->uri,array("class"=>"dashboard_link_active")) ?></li>
    <?php else: ?>
        <li id="dashboardnav_<?php echo op_url_to_id($nav->uri) ?>"><?php echo link_to($nav->caption, $nav->uri) ?></li>
    <?php endif; ?>
<?php endif; ?>
<?php endforeach; ?>
</ul>
<?php endif; ?>
