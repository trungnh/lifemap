<?php slot('submenu') ?>
<?php include_partial('submenu') ?>
<?php end_slot(); ?>

<h2><?php echo 'Tài khoản quản lý' ?></h2>

<p><?php echo 'Thiết lập tài khoản quản lý' ?></p>
<p><?php echo link_to(__('Thêm tài khoản'), 'admin/addUser') ?></p>

<table>
<tr>
<th><?php echo __('ID') ?></th>
<th><?php echo __('Name') ?></th>
<th><?php echo __('Trạng thái') ?></th>
</tr>
<?php foreach ($users as $user) : ?>
<tr>
<th><?php echo $user->getId() ?></th>
<td><?php echo $user->getUsername() ?></td>
<td><?php if ($user->getId() != 1 && $user->getId() != $sf_user->getId()) : ?>
<?php echo link_to('Xóa admin', 'admin/deleteUser?id='.$user->getId()) ?>
<?php endif; ?></td>
</tr>
<?php endforeach; ?>
</table>
