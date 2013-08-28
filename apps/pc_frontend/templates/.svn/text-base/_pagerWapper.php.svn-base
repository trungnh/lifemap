<?php
$total = $pager->getNbResults();
$first = $pager->getFirstIndice();
$last = $pager->getLastIndice();
//$max = $pager->getMaxPerPage();
//$countpage = intval($total / $max + 1);
//$countpage = 7;
//if($pager->getLastPage()-1 < $countpage) $countpage = $pager->getLastPage()-1 ;
$limit = ($pager->getPage()-1) / 7;
$limit = (int)$limit;
$max = $limit * 7 + 7;
$min = $max - 6;
if($max >= $pager->getLastPage()) $max = $pager->getLastPage() -1;
?>
  <?php for($i = $min; $i <= $max; $i++): ?>
            <?php if($i == $pager->getPage()):?>
            <li class="active">
              <?php echo op_link_to_for_pager($i, $sf_data->getRaw('internalUri'), $i) ?>
              <?php //echo link_to($i, $internalUri, $i) ?>
            </li>
            <?php else:?>
            <li>
              <?php echo op_link_to_for_pager($i, $sf_data->getRaw('internalUri'), $i) ?>
              <?php //echo link_to($i, $internalUri, $i) ?>
            </li>
            <?php endif;?>
  <?php endfor; ?>
