<?php if($member):?>
<div class="fr" id="userMenu">
  <?php // echo link_to(op_image_tag_sf_image($member->getImageFileName(), array('size' => '40x40','class'=>'avatar fr','alt' => 'member')), '@member_profile_mine') ?>
  <p class="fl textAlignRight"><?php echo link_to($member->getName(), '@member_profile_mine', array('id' => 'member-home', 'class' => 'user-menu-item header-nav')) ?>
   <?php echo link_to(__('Settings'), '@member_config', array('id' => 'settings', 'class' => 'user-menu-item header-nav')); ?>
    <?php echo link_to(__('Logout'), '@member_logout', array('id' => 'logout', 'class' => 'user-menu-item header-nav')); ?>
  </p>
</div>
<div class="fr" id="shortcuts">
<?php if ($navs): ?>
  <!--<ul class="clearfix" id="shortcutsContent"> -->
    <?php //foreach ($navs as $nav): ?>
      <?php //if (op_is_accessable_url($nav->uri)): ?>
        <!--<li id="shortcuts<?php// echo op_url_to_id($nav->uri) ?>"><?php //echo link_to($nav->caption, $nav->uri, array('title'=>$nav->caption, 'class'=>'shortcut')) ?></li> -->
      <?php //endif; ?>
    <?php //endforeach; ?> 
  <!-- </ul> -->
<?php endif; ?>
</div>
<?php else:?>
	<div class="fr" id="userMenu">
	  <p class="fl textAlignRight">		
       <a href="<?php echo url_for('@login?height=85&width=250&modal=true') ?>" class="thickbox"><?php echo __('Login') ?></a>
		&nbsp;-&nbsp;
		<?php echo link_to(__('Register'), 'opAuthMailAddress/requestRegisterURL') ?>
	  </p>
	</div>
<?php endif;?>
