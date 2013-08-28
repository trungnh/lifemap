<?php
$options->setDefault('is_total', true);
$options->setDefault('link_options' ,array());

$options->setDefault('prev_text', __('Previous', array(), 'pager'));
$options->setDefault('next_text', __('Next', array(), 'pager'));
?>
<?php if ($options['is_total'] || $pager->haveToPaginate()): ?>
<div class="wrapper-pagination clearfix">
    <div class="fr">
        <ul class="pagination clearfix">
            <?php if ($pager->getPreviousPage() != $pager->getPage()): ?>
            <li class="previous">
              <?php echo op_link_to_for_pager('<img height="9" width="6" src="http://banbecdn.net/images/buttons/previous-btn.gif" alt=" ">', $sf_data->getRaw('internalUri'), $pager->getPreviousPage(), $options->getRaw('link_options')) ?>
            </li>            
            <?php endif; ?>
            <?php if($pager->getMaxPerPage() < $pager->getNbResults()): ?>
              <?php op_include_pager_wapper($pager,$sf_data->getRaw('internalUri')) ?>
            <?php endif;?>
            <?php if ($pager->getNextPage() != $pager->getPage()): ?>
            <li class="next">
              <?php echo op_link_to_for_pager('<img height="9" width="6" src="http://banbecdn.net/images/buttons/next-btn.gif" alt=" ">', $sf_data->getRaw('internalUri'), $pager->getNextPage(), $options->getRaw('link_options')) ?>
            </li>
            <?php endif; ?>
        </ul>
    </div>
 </div>
<?php endif; ?>