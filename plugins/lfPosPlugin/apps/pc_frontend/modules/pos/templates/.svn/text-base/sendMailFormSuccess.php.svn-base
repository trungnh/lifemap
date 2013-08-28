<?php if($sf_user->getMember()):?>
<div class="send-mail" style="height:auto">
    <form id="formail" style="height:auto">
        <div >
            <table>
                <tr>
                    <td class="font-send-mail" colspan="2">
                        <div id="response" style="color:red;height:auto">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="font-send-mail">
                        <label >Đến : </label>
                    </td>
                    <td>
                        <input type="text" name="mailTo" id="mail" class="share-textfeild" />
                    </td>
                </tr>
                <tr>
                    <td class="font-send-mail">
                        <label >Từ : </label>
                    </td>
                    <td>
                        <input type="text" name="mailFrom" id="mail" class="share-textfeild" value="<?php echo $sf_user->getMember()->getConfig('pc_address');?>"/>
                    </td>
                </tr>
                <tr>
                    <td class="font-send-mail">
                        <label >Chủ đề : </label>
                    </td>
                    <td>
                        <input type="text" name="title" id="subject" class="share-textfeild" value="<?php echo $pos->getTitle();?>"/>
                    </td>
                </tr>
                <tr>
                    <td class="font-send-mail">
                        <label >Thông báo : </label>
                    </td>
                    <td>
                        <textarea name="content" id="text"  cols="40" rows="2"></textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div id="map-send-mail" style="width:300px;height:100px;position:relative;">

                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="send-mail-button">
                            <a id="send-mail-button-ajax" class="refresh-button">Sendmail</a>
                        </div>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</div>
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        var map1;
        function initialize2(latX,lngY) {
            var myLatlng = new google.maps.LatLng(latX,lngY);
            var myOptions = {
                zoom: 12,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            map1 = new google.maps.Map(document.getElementById("map-send-mail"), myOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map1
            });
            map1.setCenter(myLatlng);
        }
        initialize2(21,101);

        $('#send-mail-button-ajax').live('click',function(event){
            event.preventDefault();
            var info = $('#formail').serialize();
            var valid = '';
            var isr = ' is required.';
            var mail = $("#mail").val();
            var subject = $("#subject").val();
            var text = $("#text").val();
            if (!mail.match(/^([a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,4}$)/i)) {
                valid += '<br />Email không hợp lệ ';
            }
            if (subject.length<1) {
                valid += '<br />Bạn phải có chủ đề';
            }
            if (text.length<1) {
                valid += '<br /> Nội dung của bạn chưa có';
            }
            if (valid!='') {
                $("#response").fadeIn("slow");
                $("#response").html("Error:"+valid);
            }
            else {
                $("#response").css("display", "block");
                $("#response").html("Thư của bạn đang được gửi đi .... ");
                $("#response").fadeIn("slow");
                $.ajax({
                    url: 'pos/sendMail',
                    type: 'post',
                    dataType: 'json',
                    data: info,
                    beforeSend: function() {
                    },
                    success: function(data){
                        if(data==true){
                            $("#response").html("Thư của bạn đã được gửi đi");
                        }
                        else{

                            $("#response").html("Thư của bạn chưa được gửi đi");
                        }
                    }
                });
            }

        });

    });
</script>
<?php endif;?>

