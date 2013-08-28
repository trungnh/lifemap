<div class="wrapper-e">
    <div class="column-1 clearfix">
        <?php echo op_include_form('requestRegisterURL', $form, array(
        'title' => __('Register')
        )); ?>

        <p class="instruction"><?php echo __('Please input your e-mail address. Invitation for %1% will be sent to your e-mail address.', array('%1%' => $op_config['sns_name'])) ?></p>
    </div>

    <div class="column-2 clearfix">
        <h3 class="aside-title">Lợi ích khi đăng ký thành viên</h3>
        <p>Lifemap cung cấp nhiều chức năng hỗ trợ tuyệt vời tới những thành viên đăng ký trên Lifemap:</p>
        <ul>
            <li>- Đăng thông tin địa điểm mà bạn đang ở tại đó</li>
            <li>- Theo dõi thông tin địa điểm và nhận thông tin mới về địa điểm qua email</li>
            <li>- Thông báo với bạn bè bạn đang ở tại địa điểm với chức năng check-in</li>
            <li>- Viết cảm nhận về địa điểm mình đã đến để chia sẻ với cộng đồng</li>
            <li>- Quản lý thông tin địa điểm bạn đăng và tương tác ngay trên bản đồ</li>
            <li>- Hỗ trợ tìm kiếm địa điểm chính xác hơn qua quá trình bạn và bạn bè tương tác với địa điểm</li>
        </ul>
    </div>
</div>