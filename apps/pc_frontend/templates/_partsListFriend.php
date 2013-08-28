<?php if (count($options->list)): ?>
  <?php
  $options->setDefault('type', 'full');
  $options->setDefault('size', '40x40');
  $options->setDefault('crownIds', array());
  $options->setDefault('use_op_link_to_member', false);
  ?>
  <?php for ($i = 0; $i<count($options->list); $i++): ?>
<div class="friendsList clearfix">
      <?php if ($options->type === 'full' || $options->type === 'only_image'): ?>
        <div class="margin_avatar">
                  <?php if (!empty($options->list[$i])): ?>
                    <?php if ($options->use_op_link_to_member): ?>
                      <?php echo op_link_to_member($options->list[$i], array('link_target' => op_image_tag_sf_image($options->list[$i]->getImageFileName(), array('size' => $options->size,'class'=>'bor_img','alt' => 'member')))) ?>
                    <?php else: ?>
                      <?php echo link_to(op_image_tag_sf_image($options->list[$i]->getImageFileName(), array('size' => $options->size,'class'=>'bor_img','alt' => 'member')), $options->link_to.$options->list[$i]->getId()) ?>
                    <?php endif; ?>
                  <?php endif; ?>
        </div>
      <?php endif; ?>
      <?php if ($options->type === 'full' || $options->type === 'only_name'): ?>
        <div class="friends_name">
                  <?php if (!empty($options->list[$i])): ?>
                    <?php if ($options->use_op_link_to_member): ?>
                      <?php echo op_link_to_member($options->list[$i], array('link_target' => $options->list[$i]->getNameAndCount())) ?>
                    <?php else: ?>
                      <?php echo link_to($options->list[$i]->getNameAndCount(), $options->link_to.$options->list[$i]->getId()) ?>
                    <?php endif; ?>
                  <?php endif; ?>
                  <?php if (in_array($options->list[$i]->getId(), $options->getRaw('crownIds'))): ?>
                  <?php echo op_image_tag('icon_crown.gif', array('alt' => 'admin')) ?>
                    <?php endif; ?>
        </div>
      <?php endif; ?>
</div>
  <?php endfor; ?>
<?php endif; ?>
