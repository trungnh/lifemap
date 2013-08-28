<?php slot('pager') ?>
<?php op_include_pager_navigation($options['pager'], $options['link_to_page'], array('use_current_query_string' => true)); ?>
<?php end_slot(); ?>
<?php include_slot('pager') ?>
<ul>
<?php foreach ($options['pager']->getResults() as $key => $result): ?>
  <li>
    <?php $list = $options->list->getRaw($key); ?>
    <div class="comm_block01 bg_le clearfix">
      <div class="photo_frame_05 fl">
        <?php echo link_to(op_image_tag_sf_image($result->getImageFilename(),
            array('size' => '106x94')), sprintf($options['link_to_detail'], $result->getId())); ?>
      </div>
      <div class="comm_description">          
          <?php
          reset($list);
          echo '<h4>'.link_to(array_shift($list), sprintf($options['link_to_detail'], $result->getId())).'</h4>' ?>
          <?php foreach ($list as $caption => $item) : ?>          
          <?php echo '<h4>'.$caption.': </h4>' ?><?php echo op_truncate($item, 60, '', 3) ?>
          <?php endforeach; ?>
       </div>
    </div>
  </li>
<?php endforeach; ?>
<?php include_slot('pager') ?>
</ul>