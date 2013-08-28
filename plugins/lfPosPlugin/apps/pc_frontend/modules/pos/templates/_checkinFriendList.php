<?php if($checkinFriendList !=null):?>
  <?php if($checkinFriendList->count() >0):?>
    <div id="venueMayor" class="box translate">
            <div>
                <h5 id="text-friend"><?php echo $checkinFriendList->count();?> người bạn của bạn đã ở đây</h5>
            </div>
            <div>
                <ul class="clearfix">
                        <?php foreach($checkinFriendList as $friend):?>
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
