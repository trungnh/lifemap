<?php if($unlogin):?>
<div class="heading_top">Cảm nhận</div>
<div id="comment_box">    
    <p style="color:red;">Bạn cần đăng nhập để có thể chia sẻ thông tin về địa điểm này!</p>
</div>
<?php else:?>
<div class="heading_top">Cảm nhận</div>
<div id="addTipBlock">
    <form action="<?php echo url_for("pos/comments");?>" id="commentForm">
        <div class="addTipImage">
            <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_60x60')),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?>
        </div>
        <div id="addTipForm">
            <h4><strong>Chào <?php echo $member->getName();?></strong>, Hãy chia sẻ cảm nhận về <?php echo $position->getTitle(); ?></h4>
            <div id="addTip">
                <span class="input-holder">
                    <input type="text" class="formStyle" name="input_comment" size="70" id="input_comment" value="Cảm nhận của bạn về địa điểm"/>
                </span>
            </div>
            <div id="addTipOptions">
                <input type="submit" name="share_button" value="Chia sẻ" class="greenButton" id="share_button"/>                
                    <div title="" class="photoAddButtonHolder">
                        <div class="icon" id="upload"></div>
                    </div>                
            </div>
        </div>
        <input type="hidden" name="pos_id" value="<?php echo $posId?>" id="pos_id"/>
    </form>
</div>

<?php endif;?>
<div id="comment_list">

</div>