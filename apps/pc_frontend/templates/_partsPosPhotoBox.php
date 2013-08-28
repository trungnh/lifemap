

<?php if (isset($options['form'])) : ?>
<div class="block">
<?php echo $options['form']->renderFormTag(url_for('pos/uploadImage?id=1')) ?>
<p>
<?php echo $options['form']['file'] ?>
<?php echo $options['form']->renderHiddenFields(); ?>
</p>
<p><input type="submit" class="input_submit" value="<?php echo __('Upload') ?>" /></p>
</form>
<ul>
<li><?php echo __('You can upload 3 photos.') ?></li>
<li><?php echo __('Please make it to GIF･JPEG･PNG within %max_size% bytes.', array('%max_size%' =>  $op_config['image_max_filesize'])) ?></li>
<li><?php echo __('Photograph that hits violation of copyright and portrait right and violence and obscene photograph and other members are seen and revolted a press ban. Please publish by the self-responsibility.') ?></li>
</ul>
</div>
<?php endif; ?>
