<?php if($followFriendList !=null):?>
<?php if($followFriendList->count() >0):?>
    <div id="venueMayor" class="box translate">
            <div>
                <h5 id="text-friend"><?php echo $followFriendList->count();?> người bạn của bạn đã quan tâm tới <?php echo $pos->getTitle();?></h5>
            </div>
            <div>
                <ul class="clearfix">
                        <?php foreach($followFriendList as $friend):?>
                    <li id="li-list-frinds">
                        <div class="photo_db_list">
                                    <?php echo link_to(image_tag_sf_image($friend->getMember()->getImageFileName(),array('size'=>'40x40','class'=>'pading-img-newmember bor_img')),'@member_profile?id='.$friend->getMember()->getId(),array('target'=>'_blank','title'=>$friend->getMember()->getName()))?>
                        </div>
                    </li>
                        <?php endforeach;?>
                </ul>
            </div>
    </div>
<?php endif;?>
<?php endif;?>
