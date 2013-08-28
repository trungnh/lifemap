<?php if (isset($topGadgets)): ?>
<?php foreach ($topGadgets as $gadget): ?>
<?php if ($gadget->isEnabled()): ?>
<?php include_component($gadget->getComponentModule(), $gadget->getComponentAction(), array('gadget' => $gadget)); ?>
<?php endif; ?>
<?php endforeach; ?>
<?php endif; ?>