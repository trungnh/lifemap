<?php foreach ($forms as $form) : ?>
    <?php $link_to = url_for(sprintf('member/login' . '?%s=%s', opAuthForm::AUTH_MODE_FIELD_NAME, $form->getAuthMode())); ?>
    <div id="userMenu" class="fr">
        <form method="post" action="<?php echo $link_to; ?>">
            <div id="login-problem" class="clear">
                <p class="login-choice"><a id="login-confirm-button" class="header-nav">Đăng nhập</a></p>
                <p class="login-choice">
                    <input type="hidden" id="authMailAddress_is_remember_me" name="authMailAddress[is_remember_me]" value="1">
                    <?php if ($form->getAuthAdapter()->getAuthConfig('help_login_error_action')) : ?>
                        <?php echo link_to(__('Can not access your account?'), $form->getAuthAdapter()->getAuthConfig('help_login_error_action'), array('class' => 'header-nav')); ?>
                    <?php endif; ?>
                </p>
                <p class="login-choice"><?php
                if ($form->getAuthAdapter()->getAuthConfig('invite_mode') == 2
                        && opToolkit::isEnabledRegistration('pc')
                        && $form->getAuthAdapter()->getAuthConfig('self_invite_action')) :
                        ?>
        <?php echo link_to(__('Register'), $form->getAuthAdapter()->getAuthConfig('self_invite_action'), array('class' => 'header-nav')) ?>
    <?php endif; ?>
                </p>
            </div>
            
            <div id="login-inputs" class="clear">
                <input class="login-input-item" type="text" id="_mail_address" name="authMailAddress[mail_address]" value="Email" onfocus="this.value=''">
                <input class="login-input-item" type="password" id="_password" name="authMailAddress[password]" value="Mật khẩu" onfocus="this.value=''" >
                <input id="login-submit" type="submit" value="Đăng nhập">
            </div>
        </form>
    </div>
<?php endforeach; ?>
<div id="shortcuts" class="fr">
</div>