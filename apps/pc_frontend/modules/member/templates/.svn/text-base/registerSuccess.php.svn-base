<?php $has_register_box = false ?>
<?php foreach ($sf_user->getAuthAdapters() as $adapter): ?>
    <?php if ($adapter->isInvitedRegisterable() && $sf_context->getController()->componentExists($adapter->getAuthModuleName(), 'registerBox')): ?>
        <?php
        $has_register_box = true;
        include_component($adapter->getAuthModuleName(), 'registerBox');
        ?>
    <?php endif; ?>
<?php endforeach; ?>

<?php if (!$has_register_box): ?>
    <?php echo op_include_box('noRegisterBoxError', 'Không có tài khoản hiện tại có thể được đăng ký.。') ?>
<?php endif; ?>
