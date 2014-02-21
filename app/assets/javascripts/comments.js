$(document).ready(function(){

$("#submit_comment").click(function(e){
  
  
//   $.post(
//     "demo_test.asp",function(data,status){
//     alert("Data: " + data + "\nStatus: " + status);
//   });
// });

    $.ajax({
      type: 'POST',
      url: url,
      data: {
        'comment[content]': $('#comment_content').val(),
      }
    })
