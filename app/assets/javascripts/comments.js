$(document).ready(function(){
  $("form input[type=submit]").click(function() {

    // var url = $(this).parents("form").attr("action")
    // var form_data = $(this).parents("form").serialize()
    
    var url       = $("#new_comment").attr("action")
    var form_data = {comment: {comment: $("#comment_content").val(), post_id: $("#comment_post_id").val()}}
    
    $.post(url, form_data, function(data, textStatus, xhr) {
      $("#comment_content").val("")
      
      var html = '<div class="panel">' +
                  '<h6>' + data.user.name + '</h6>' +
                  '<div class="row">' +
                  '<div class="large-2 columns small-3"><img alt="Default profile 1 normal" src="' + data.user.avatar + '"></div>' +
                  '<div class="large-10 columns"><p>' + data.comment + '</p></div>' +
                '</div>' +
                '</div>'
      
      $(".comments").append(html)
    }, "json");
    
      
    return false;
  });
});
