<?php include_customizes($id, 'before') ?>
<?php 
$loginUser = $sf_user->getMember();
?>
<?php
$class = '';
if ($name) $class .= ' '.$name;
if (!empty($options['class'])) $class .= ' '.$options['class'];
?>
<?php if (empty($options['single'])): ?>
<div id="<?php echo $id ?>" class="dparts<?php echo $class ?>">
  <div class="friend_col">
    <?php else: ?>
    <div id="<?php echo $id ?>" class="parts<?php echo $class ?>">
      <?php endif; ?>

      <?php if (isset($options['title'])): ?>
      <div class="heading_top">
        <h3 id="profile-title" ><?php echo link_to($options->getRaw('title'),'@member_profile?id='.$options['object']->getId().'&name='.$options['object'],array('class'=>'underline'))?></h3>
        <?php if( $sf_request->getParameter('id') == null || $loginUser->getId() == $sf_request->getParameter('id')): ?>
        <h3 id="edit-profile-link" ><a class="underline" href="<?php echo url_for('@member_editProfile') ?>"><?php echo __('Edit my profile') ?></a></h3>
        <?php endif; ?>
      </div>
      <?php endif; ?>

      <?php if (isset($options['partsInfo'])): ?>
      <div class="partsInfo">
        <div class="body">
            <?php echo $options->getRaw('partsInfo') ?>
        </div>
      </div>
      <?php endif; ?>

      <?php echo $sf_data->getRaw('op_content') ?>

    </div><!-- parts -->
    <?php if (empty($options['single'])): ?>
  </div><!-- dparts -->
  <?php endif; ?>

<?php include_customizes($id, 'after') ?>
