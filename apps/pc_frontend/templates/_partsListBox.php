<?php include_customizes($id, 'firstRow') ?>
<div class="member-info">
<?php foreach ($options['list'] as $key => $value): ?>
  <span class=""><?php echo $key ?></span>
  <span class="member-info-value"><?php echo $options['list']->getRaw($key) ?></span>
<?php endforeach; ?>
</div>

<?php include_customizes($id, 'lastRow') ?>
