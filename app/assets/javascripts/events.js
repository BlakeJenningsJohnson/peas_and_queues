// $(document).ready(function(){
 
//  $('#event_submit').click(function (e) {
//     var url = $('form.new_event').attr('action');
//     console.log(url);

//     $.ajax({
//         type: 'POST',
//         url: url,
//         data: {
//             'event[name]': $('#event_name').val(),
//             'event[description]': $('#event_description').val(),
//             'event[date]': $('#event_date').val(),
//             'event[time]': $('#event_time').val(),

//         },
//         success: function (data) {
//             $('#myModal').foundation('reveal', 'close');
//         },
//         error: function(xhr, textStatus, errorThrown) {
//             alert("There was a problem updating this item.");
//         }
//     });
//     e.preventDefault();
//   });

// });