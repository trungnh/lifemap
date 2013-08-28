<!-- left menu -->
<?php
$context = sfContext::getInstance();
$module = $context->getActionStack()->getLastEntry()->getModuleName();
$options = array(
    'is_secure' => opToolkit::isSecurePage(),
    'type'      => sfConfig::get('sf_nav_type', sfConfig::get('mod_'.$module.'_default_nav', 'default')),
    'culture'   => $context->getUser()->getCulture(),
);
if ('default' != $options['type']) {
    $options['nav_id'] = sfConfig::get('sf_nav_id', $context->getRequest()->getParameter('id'));
}
?>

<?php if (isset($sideMenuGadgets)): ?>
    <?php foreach ($sideMenuGadgets as $gadget): ?>
        <?php if ($gadget->isEnabled()): ?>
            <?php
            $options['gadget'] = $gadget;
            include_component($gadget->getComponentModule(), $gadget->getComponentAction(), $options); ?>
        <?php endif; ?>
    <?php endforeach; ?>
<?php endif; ?>
<!-- left menu -->