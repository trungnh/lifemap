<?php include_customizes($id, 'before') ?>

<div id="<?php echo $id ?>" class="loginForm">
  <div class="loginForm-title"><?php echo __('Login')?></div>
  <div class="loginForm-body">   
    <form action="<?php echo $link_to ?>" method="post">                 
      <div class="loginForm-body-content">
        <?php foreach($form as $name => $field):?>
          <?php if($field->renderId() == 'authMailAddress_mail_address' || $field->renderId() == 'authMailAddress_password'):?>
          <div class="flogin rel hrw first">
            <span class="loginForm-content-title"><strong><?php echo $field->renderLabel();?>:</strong></span>
            <?php echo $field->render();?>
          </div>
          <?php endif?>    
      <?php endforeach?>
        <div class="oplogin2">
          <p class="pdmem2 f12 rel">
            <?php foreach($form as $name => $field):?>
              <?php if($field->renderId() == 'authMailAddress_is_remember_me'):?>
                <?php echo $field->render();?>
                <?php echo $field->renderLabel().' | ';?>
              <?php endif?>
            <?php endforeach?>
            <?php if ($form->getAuthAdapter()->getAuthConfig('help_login_error_action')) : ?>
              <?php echo link_to(__('Can not access your account?'), $form->getAuthAdapter()->getAuthConfig('help_login_error_action')); ?>
            <?php endif; ?>
          </p>
          <p class="f12">Chưa có tài khoản,
            <?php if ($form->getAuthAdapter()->getAuthConfig('invite_mode') == 2
                && opToolkit::isEnabledRegistration('pc')
                && $form->getAuthAdapter()->getAuthConfig('self_invite_action')) : ?>
              <?php echo link_to(__('Register'), $form->getAuthAdapter()->getAuthConfig('self_invite_action')) ?>
            <?php endif; ?>
          </p>
        </div>
      </div>
      <div class="loginForm-body-footer">
        <input type="submit" class="input_submit" value="<?php echo __('Login') ?>" />        
      </div>      
    </form>
  </div>
</div>
