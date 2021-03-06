<div id="formAlbumDelete" class="dparts box"><div class="parts">
<div class="partsHeading">
<h3><?php echo __('Delete the album') ?></h3>
</div>
<div class="block">
<p><?php echo __('Do you really delete this album?') ?></p>
<form action="<?php echo url_for('@album_delete?id='.$album->getId()) ?>" method="post">
<div class="operation">
<ul class="moreInfo button">
<li>
<?php echo $form[$form->getCSRFFieldName()] ?>
<input class="input_submit" type="submit" value="<?php echo __('Delete') ?>" />
</li>
</ul>
</div>
</form>
</div>
</div></div>

<?php use_helper('Javascript') ?>
<?php op_include_line('backLink', link_to_function(__('Back to previous page'), 'history.back()')) ?>
