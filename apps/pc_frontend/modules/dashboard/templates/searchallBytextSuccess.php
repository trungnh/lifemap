<?php if($is_show): ?>
    <?php slot('op_header') ?>
      <?php include_partial('global/header',array('keyword'=>$keyword)) ?>
    <?php end_slot()?>
    <div id="navigation_dashboard">
      <h1><?php echo "Kết quả tìm kiếm với từ khóa \"".$keyword."\""?> </h1>
    </div>
    <?php if (isset($topGadgets)): ?>
    <?php slot('op_top') ?>
    <?php foreach ($topGadgets as $gadget): ?>
    <?php if ($gadget->isEnabled()): ?>
    <?php include_component($gadget->getComponentModule(), $gadget->getComponentAction(), array('gadget' => $gadget)); ?>
    <?php endif; ?>
    <?php endforeach; ?>
    <?php end_slot() ?>
    <?php endif; ?>

    <!-- right menu -->
    <?php if (isset($sideRightMenuGadgets)):?>
    <?php slot('op_siderightmenu') ?>
    <?php foreach ($sideRightMenuGadgets as $gadget): ?>
    <?php if ($gadget->isEnabled()): ?>
    <?php include_component($gadget->getComponentModule(), $gadget->getComponentAction(), array('gadget' => $gadget)); ?>
    <?php endif; ?>
    <?php endforeach; ?>
    <?php end_slot() ?>
    <?php endif; ?>

    <!-- content -->
    <?php if (isset($contentsGadgets)): ?>
    <?php foreach ($contentsGadgets as $gadget): ?>
    <?php if ($gadget->isEnabled()): ?>
    <?php include_component($gadget->getComponentModule(), $gadget->getComponentAction(), array('gadget' => $gadget)); ?>
    <?php endif; ?>
    <?php endforeach; ?>
    <?php endif; ?>

    <!-- bottom -->
    <?php if (isset($bottomGadgets)): ?>
    <?php slot('op_bottom') ?>
    <?php foreach ($bottomGadgets as $gadget): ?>
    <?php if ($gadget->isEnabled()): ?>
    <?php include_component($gadget->getComponentModule(), $gadget->getComponentAction(), array('gadget' => $gadget)); ?>
    <?php endif; ?>
    <?php endforeach; ?>
    <?php end_slot() ?>
    <?php endif; ?>
<?php else:?>
    <div id="navigation_dashboard">
      <h1>Không tìm thấy kết quả nào</h1>
    </div>
<?php endif;?>

