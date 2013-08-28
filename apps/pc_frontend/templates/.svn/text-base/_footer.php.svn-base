<div class="clearfix" id="inner-footer">
    <p id="company-copy">
        <?php $snsConfigSettings = sfConfig::get('openpne_sns_config'); ?>

        <?php if (opToolkit::isSecurePage()) : ?>
            <?php echo Doctrine::getTable('SnsConfig')->get('footer_after', $snsConfigSettings['footer_after']['Default']); ?>
        <?php else: ?>
            <?php echo Doctrine::getTable('SnsConfig')->get('footer_before', $snsConfigSettings['footer_before']['Default']); ?>
        <?php endif; ?>
    </p>

    <ul id="footer-link">
        <li><?php echo link_to(__('Privacy policy'), '@privacy_policy', array('target' => '_blank')); ?></li>

        <li><?php echo link_to(__('Terms of service'), '@user_agreement', array('target' => '_blank')); ?></li>

        <li><?php echo link_to(__('Contact to'), '@privacy_policy', array('target' => '_blank')); ?></li>

        <li><?php echo link_to(__('Help'), '@user_agreement', array('target' => '_blank')); ?></li>

            <li><?php echo link_to(__('Advertise'), '@privacy_policy', array('target' => '_blank', 'class' => 'last-footer-item')); ?></li>
    </ul>
</div>