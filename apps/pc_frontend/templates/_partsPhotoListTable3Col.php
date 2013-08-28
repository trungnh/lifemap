<?php if (count($options->list)): ?>
    <?php
    $options->setDefault('col', 1);
    $options->setDefault('type', 'full');
    $options->setDefault('crownIds', array());
    $options->setDefault('header', 'true');
    ?>

    <?php if (isset($options['body'])): ?>
<div style="margin: 0px 12px 0px 12px;">
            <?php echo $options->getRaw('body'); ?>
</div>
    <?php endif ?>

    <?php if(isset($options['pager']))
        op_include_pager_navigation($options->pager
            , $options->getRaw('link_to_pager')
            , array('use_current_query_string'=>$options->getRaw('use_current_query_string'),
            'pager_header'=>$options->getRaw('pager_header')))
            ?>

<table class="list-main-a cols3" width="100%" cellspacing="0" cellpadding="0" border="0">
        <?php $row = ceil(count($options->list) / $options->col) ?>
        <?php
        $pageNum  = $sf_request->getParameter('page')
            ? $sf_request->getParameter('page')
            : 1;
        $pageSize = $options['pager']
            ? $options['pager']->getMaxPerPage()
            : 21;
        ?>
        <?php for ($i = $j = 1; $row >= $i; $i++): ?>
            <?php if ($options->type === 'full' || $options->type === 'only_image'): ?>
    <tr>
                    <?php for ($j = ($i * $options->col) - $options->col; ($i * $options->col) > $j; $j++): ?>
                        <?php if (!empty($options->list[$j]) || isset($options->list[$j])): ?>
                            <?php
                            $num = $pageSize*($pageNum-1)+($j+1);
                            $item = $options['list'][$j];
                            $t = $j%$options->col;
                            if ($t == 0) {
                                $sclass = 'begin';
                            } elseif ($t == ($options->col-1)) {
                                $sclass = 'end';
                            } else {
                                $sclass = 'midd';
                            }
                            $count = $j+1;
                            ?>
        <td width="33%">
           <?php if($i % 2 <> 0): ?> <div class ="comm_block01 bg_le clearfix" >
            <?php else: ?> <div class ="comm_block01 bg_chan clearfix" >
            <?php endif;?>
            <div class="photo_frame_05 fl">
                
                                        <?php if(isset($item['image_absolute']) && $item['image_absolute']):?>
                                              <?php ?>
                                            <?php if(isset($item['link'])):?>
                                             <?php ?>
                                                <?php echo link_to('<img class="border-internal" src="'.image_path($item['image']).'">',$item['link'])?>
                                            <?php else:?>
                                                <?php echo '<img class="border-internal" src="'.image_path($item['image']).'">'?>
                                            <?php endif;?>
                                        <?php else:?>
                                            <?php if(isset($item['link'])):?>
                                                <?php  echo link_to(image_tag_sf_image($item['image'],  array('size' => '106x94', 'format' => 'jpg','no_image'=>'no_image', 'class' => 'border-internal', 'crop' => true)),  $item['link'])?>
                                            <?php else:?>
                                                <?php  echo image_tag_sf_image($item['image'], array('size' => '106x94', 'format' => 'jpg','no_image'=>'no_image', 'class' => 'border-internal', 'crop' => true))?>
                                            <?php endif;?>
                                        <?php endif;?>
              
                                    <?php if (isset($item['checkbox'])):?>
                                        <?php echo html_entity_decode($item['checkbox']);?>
                                    <?php endif?>
                                 
            </div>
                <div class="comm_description">
                    <h4 class="font-size-title">
                       <?php  echo link_to( html_entity_decode($item['name']),$item['link']) ?>
                    </h4>
                <span class="small_text"><?php echo html_entity_decode($item['header'])?>&nbsp&nbsp&nbsp<a href=""><?php echo html_entity_decode($item['totalMembers'])?></a> &nbsp&nbsp&nbsp <?php echo link_to( html_entity_decode($item['totalEvents']),$item['linkEvent'])?> &nbsp&nbsp&nbsp<?php echo link_to( html_entity_decode($item['totalTopics']),$item['linkTopic']) ?></span>
                <br></br>
                <span><?php echo html_entity_decode($item['Description'])?></span>
                </div>
            </div>
           <!--  <div class="table-num2"><?php //echo $num;?></div> -->
        </td>
                        <?php else: ?>
        <td class="end">&nbsp;</td>
                        <?php endif; ?>
                    <?php endfor; ?>
    </tr>
            <?php endif; ?>
        <?php endfor; ?>
</table>
    <?php if (isset($options['footer'])): ?>
<div style="margin: 0px 12px 0px 12px;">
            <?php echo $options->getRaw('footer'); ?>
</div>
    <?php endif ?>
    <?php if (isset($options['action'])): ?>
<div style="text-align:center; display: block; width: 600">
    <div class="clear space5"></div>
    <div align="center">
        <input class="link-cmt" type="submit" value="<?php echo $options->getRaw('action');?>">
    </div>
</div>
    <?php endif ?>
        <?php endif; ?>