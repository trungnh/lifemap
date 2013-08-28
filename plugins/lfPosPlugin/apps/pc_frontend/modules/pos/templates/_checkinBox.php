<?php if($posId):?>
<div class="narrowColumn">
    <div id="actionBar" class="box">
        <div class="actionContainer translate">
            <div class="list-control" >
                <div class="translate saveButton link add-link" title="">
                    <div class="icon-favorite-left">
                        
                    </div>
                    <span class="buttonRight">
                        <?php if($followMember == null):?>
                          <a id="follow_button"  title="Bạn muốn quan tâm tới địa điểm này?" href="<?php echo url_for('@pos_follow?id='.$posId);?>">Quan tâm</a>
                        <?php else:?>
                          <a  title="Bạn đang quan tâm tới địa điểm" href="#">Quan tâm</a>
                        <?php endif;?>
                    </span>
                </div>
                <div class="translate doneButton link done-link undone" title="">
                    <div class="icon-checkin-left">
                        
                    </div>
                    <span class="buttonRight">
                        <?php if($status == null):?>
                          <a id="checkin_button" title = "Đánh dấu bạn đang ở đây" href="<?php echo url_for('@pos_check-in?id='.$posId);?>">Ở đây</a>
                        <?php else:?>
                          <?php if($status == 1):?>
                            <a title ="Bạn đang ở đây" href="#">Ở đây</a>
                          <?php endif?>
                          <?php if($status == 0):?>
                              <a title ="Bạn đã ở đây" href="#">Ở đây</a>
                          <?php endif?>
                          <?php if($status == 2):?>
                              <a id="checkin_button" title = "Đánh dấu bạn đang ở đây" href="<?php echo url_for('@pos_check-in?id='.$posId);?>">Ở đây</a>
                          <?php endif;?>
                        <?php endif;?>
                    </span>
                </div>
            </div>
        </div>
    </div>    
</div>
<?php endif;?>