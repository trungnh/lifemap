
<div>
    <table cellspacing="0" cellpadding="0" border="0" width="620px">
        <tr>
            <td colspan="2" style="background:#37538C;color:#ffffff;font-weight:bold;font-family:'lucida grande',tahoma,verdana,arial,sans-serif;vertical-align:middle;padding:4px 8px;font-size:16px;letter-spacing:-0.03em;text-align:left">
                <a style="color:#ffffff;text-decoration:none" href="lifemap.vn" target="_blank"><span style="color:#ffffff">LifeMap.vn</span>
                </a>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="border-right:1px solid #cccccc;border-bottom:1px solid #3b5998;font-family:'lucida grande',tahoma,verdana,arial,sans-serif;padding:15px;border-left:1px solid #cccccc">
                <table width="100%">
                    <tbody>
                        <tr>
                            <td width="470px" style="font-size:12px" valign="top" align="left">
                                <div style="margin-bottom:15px;font-size:12px">Xin chào <a href="#" title="Ảnh đại diện"><?php echo $nameUser; ?></a>,
                                </div>
                                <br>
                                <div style="margin-bottom:15px"><a href="#" title="Ảnh đại diện"><?php echo $senderName; ?></a> cũng đã bình luận về địa điểm <a href="#" title="Ảnh đại diện"><?php echo $title; ?></a>
                                </div>
                                <br>
                                <?php echo $senderName; ?> đã viết:<?php echo $content?><br>
                                <div style="margin-bottom:15px">
                                vào lúc: <?php echo $created_at?>
                                </div>
                                <div style="margin-bottom:15px;margin:0">Trân trọng cảm ơn !<br>Nhóm Phát Triển LifeMap
                                </div>
                            </td>
                            <td valign="top" width="150" style="padding-left:15px" align="left">
                                <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                                    <tbody>
                                        <tr>
                                            <td style="padding:10px;background-color:#fff9d7;border-left:1px solid #e2c822;border-right:1px solid #e2c822;border-top:1px solid #e2c822;border-bottom:1px solid #e2c822">
                                                <div style="margin-bottom:15px;font-size:12px">Bấm vào đây để xem tất cả bình luận
                                                </div>
                                                <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                                                    <tbody>
                                                        <tr>
                                                            <td style="border-width:1px;border-style:solid;border-color:#3b6e22 #3b6e22 #2c5115;background-color:#69a74e">
                                                                <table cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="font-size:11px;font-family:'lucida grande',tahoma,verdana,arial,sans-serif;padding:2px 6px 4px;border-top:1px solid #95bf82">                                                                                
                                                                                <?php echo link_to("Xem tất cả bình luận",app_url_for('pc_frontend', $urlPos, true));?>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</div>