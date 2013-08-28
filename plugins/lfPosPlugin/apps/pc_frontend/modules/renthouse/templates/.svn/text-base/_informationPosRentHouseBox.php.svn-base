<div class="pos_top">
    <h1><?php echo $position->getTitle();?></h1>
</div>
<div>
    <?php if($sf_user->getMemberId()):?>
        <?php if($followMember): ?>
            <?php if($followMember->getStatus() == 0):?>
    <span class="fr">Theo dõi</span>
            <?php else:?>
    <span class="fr">Đang theo dõi</span>
            <?php endif;?>
        <?php else: ?>
    <span class="fr" id="follow"> <a id="follow_button" href="<?php echo url_for('pos/follow/?id='.$position->getId())?>" title="Đăng ký theo dõi địa điểm này">Theo dõi</a></span>
        <?php endif;?>
    <?php endif;?>
</div>
<div style="clear:both"></div>
<div id="comm_search" class="pos_info_body">
    <div class="pos_info_map">
        <div class="pos_info">
            <p>
                <span class="attribute">Địa chỉ :</span>
                <span class="value"><?php echo $position->getAddress();?></span>
            </p>
            <?php if($posAttribute):?>
            <p class="attribue">
                <span class="attribue-price">Giá: <?php echo $posAttribute->getPrice().' '.$posAttribute->getUnit_price()?></span>
                    <?php if($posAttribute->getStatus() == 1):?>
                <span class="attribue-status fr" id="status_on">Còn phòng</span>
                    <?php else: ?>
                <span class="attribue-status fr" id="status_on">Hết phòng</span>
                    <?php endif;?>
            </p>
            <p>
                <span class="attribute">Diện tích: </span>
                <span class="value"><?php echo $posAttribute->getArea().' '.$posAttribute->getUnit_Area();?></span>
            </p>
            <p>
                <span class="attribute">Số phòng: </span>
                <span class="value"><?php echo $posAttribute->getNum_room().' phòng';?></span>
            </p>
            <p>
                <span class="attribute">Hướng nhà: </span>
                <span class="value"><?php echo $posAttribute->getDirection();?></span>
            </p>
            <p>
                <span class="attribute">Liên hệ: </span>
                <span class="value"><?php echo $posAttribute->getContactName();?></span>
            </p>
            <p>
                <span class="attribute">Email: </span>
                <span class="value"><?php echo $posAttribute->getContactEmail();?></span>
            </p>
            <p>
                <span class="attribute">Điện thoại: </span>
                <span class="value"><?php echo $posAttribute->getContactTel();?></span>
            </p>
                <?php if($test):?>
            <div class="status-rent-house">
                <p>Trạng thái cập nhật</p>
                <form action="statusRentHouse" id="frm-status-rent-house">
                            <?php if($posAttribute->getStatus() == 1):?>
                    <div  id="status-info-box" >
                        <ul>
                            <li class="status-info">
                                <input type="radio" name="chk_status" class ="chk_status" value="1" checked="checked"/> Còn phòng
                            </li>
                            <li class="status-info">
                                <input type="radio" name="chk_status" class="chk_staus" value="0" /> Hết phòng
                            </li>
                            <li class="status-info">
                                <input type="submit" name="update_status_button" value="Cập nhật" id="update_status_button"/>
                            </li>
                        </ul>
                    </div>
                            <?php else: ?>
                    <div  id="status-info-box" >
                        <ul>
                            <li class="status-info">
                                <input type="radio" name="chk_status" class ="chk_status" value="1" /> Còn phòng
                            </li>
                            <li class="status-info">
                                <input type="radio" name="chk_status" class="chk_staus" value="0" checked="checked" /> Hết phòng
                            </li>
                            <li class="status-info">
                                <input type="submit" name="update_status_button" value="Cập nhật" id="update_status_button"/>
                            </li>
                        </ul>
                    </div>
                            <?php endif?>

                    <div class="clear"></div>
                    <input type="hidden" name="pos_rent_house" value="<?php echo $posAttribute->getId()?>" id="pos_rent_house"/>
                </form>
            </div>
                <?php endif?>
            <?php endif;?>
            <a href="<?php echo 'http://'.$position->getWebsite()?>"><?php echo $position->getWebsite()?></a><br/>
        </div>
        <input type="hidden" id="pos_lat" value="<?php echo $position->getLat();?>"/>
        <input type="hidden" id="pos_lng" value="<?php echo $position->getLng();?>"/>
        <div id="pos_map"></div>
        <div class="clear"></div>
        <div class="description">
            <p class="attribute">Nội dung: </p>
            <?php echo html_entity_decode($position->getDescription());?>
        </div>
    </div>
    <div class="pos_info_tags">
        <div class="pos_info_badAlert" id="warn_box">
            <span class="attribute">Loại: </span><?php if($posCategory):?>
            <a href="<?php echo '../?q='.$posCategory->getName()?>"><?php echo $posCategory->getName();?></a>
            <?php endif;?>
            <?php if($posSubCategory):?>
            <a href="<?php echo '../?q='.$posSubCategory->getName()?>"><?php echo $posSubCategory->getName();?></a>
            <?php endif;?>
            <a class='ajax' href="<?php echo url_for('@pos_warn?id='.$position->getId()) ?>" style="float:right">
                Cảnh báo xấu</a>
        </div>
        <div class="tags">
            <div class="info_tags" id="tagList">
                <span class="attribute"> Tag: </span><?php foreach($tags as $tag):?>
                <a href="<?php echo '../?q='.$tag?>"><?php echo ucfirst($tag)?></a>
                <?php endforeach;?>
            </div>
            <div class="insert_tag">
                <a class='ajax' href="<?php echo url_for('@pos_add_tag?id='.$position->getId()) ?>">
                    Thêm tags</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
