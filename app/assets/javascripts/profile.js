$(document).ready(function(){
 
 $('#profile_submit').click(function (e) {
    var url = $('form.edit_user').attr('action');

    $.ajax({
        type: 'PATCH',
        url: url,
        data: {
            'user[email]': $('#user_email').val(),
            'user[phone]': $('#user_phone').val()
        },
        success: function (data) {
            $('#myModal').foundation('reveal', 'close');
        },
        error: function(xhr, textStatus, errorThrown) {
            alert("There was a problem updating this item.");
        }
    });
    e.preventDefault();
  });

});