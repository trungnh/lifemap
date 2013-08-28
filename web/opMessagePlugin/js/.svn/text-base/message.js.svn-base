 window.onload = function() {
  document.getElementById("suggest").focus();
}
$(document).ready(function() { 
  $("a.remove").live('click', function() {
               $(this).parent().remove();
        });

  $(".memberIds").click(function(){
    $("#suggest").focus();
  });
 
  $("#suggest").keyup(function () {
    $.post("suggest", {
      queryString: $(this).val()
      }, function(data){
        var obj = jQuery.parseJSON(data);
        var arr = new Array();
        $('.send_member').each(function() {
            arr.push($(this).val());
        });

        var html = "<ul>";
        for(i = 0; i < obj.length; i++){
              var test = 0;
              for(j = 0; j < arr.length; j++){
                if(obj[i].id == arr[j])
                  test = 1;
              }
              if (test == 0)
                html += "<li title = '"+obj[i].id+"'>"+obj[i].name+"</li>";
        }
        html += "</ul>";
        $('#suggestions').show();
        $('#suggestionsList').html(html);

        $('#suggestionsList li').click(function(){
          var html = "<span class ='send_member' title ='"+ $(this).text()+"'>"+$(this).text();
           html +="<input type='hidden' class='send_member' name='send_member_ids[]' value='"+ $(this).attr('title')+"' />";
           html +="<a class='remove' href='#' title='Xóa "+$(this).text() +"'><img src='../opMessagePlugin/images/delete.gif' height='12px' width='12px' /></a></span>";
          $("#suggest").val('');
          $('#message_name').append(html);
          $('#suggestions').hide();
        });
    });
  });  
});
