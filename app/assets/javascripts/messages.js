
select_user = function() { 
   $( ".friend" ).click(function() {
     var user_id = $(this).data("user");
     var temp =  this;
     var classname = "";
     $.ajax({
         type: "POST",
         url: "/messages/getAjax",
         data: { id: user_id },
         dataType: "json",
         async: false,
         success: function (data) {
            $("#chats tr").remove();
            data.forEach(function(entry) {
               if(entry.user_sent_id != $("#current_user").val()) { classname = "active " }
               else { classname = "text-right" }
               $('#chats').append('<tr class="chat ' + classname + '"><td><b>' + entry.user.rolable.name +'</b><span class="message_id">' +entry.id + '</span><br/> ' + entry.body + '</td></tr>');
               $("#last_id").val(entry.id);
            });
            $( ".friend" ).parent().removeClass('success');
            $(temp).parent().addClass('success');
            $(temp).children('.badge').remove();
         }
      });
   });
   $(".friend:first").parent().addClass('success');
};



send_message = function(){
 $( "#send_message" ).click(function() {
     var user_id = $($('.success')[0].children[0]).data('user');
     var message_data = {user_received_id: user_id, user_sent_id : null, read: false, deleted: false, date: null, body: $(chat_message).val()};
     var json = JSON.stringify(message_data );
     $.ajax({
         type: "POST",
         url: "/messages",
         data: { 'message' : message_data },
         dataType: "json",
         async: false,
         success: function (data) {

         }
      });
   });
};

startTimer = function() {
   window.setInterval(update_client, 10000);
};


update_client = function(){
   console.log("tset");
   $.ajax({
      type: "POST",
      url: "/messages/checkAjax",
      data: { message_id : $("#last_id").val()},
      dataType: "json",
      async: false,
      success: function (data) {
        if(data.length > 0)
        {
            $(".friend").children('.badge').remove();
            var classname = "";
            data.forEach(function(entry) {
               //console.log(entry.data("user"));

               var user_id = $("#current_user").val();
               var selected_id = $($('.success')[0].children[0]).data('user');
               if(entry.user_sent_id == selected_id ||  entry.user_received_id == selected_id)
               {
                  if(entry.user_sent_id != $("#current_user").val()) { classname = "active" }
                  else { classname = "text-right" }
                   $('#chats').append('<tr class="chat ' + classname + '"><td><b>' + entry.user.rolable.name +'</b><span class="message_id">' +entry.id + '</span><br/> ' + entry.body + '</td></tr>');
               }
               else
               {
                  $(".friend").each(function(index){
                     if( ($(".friend").children('.badge').length < 1) && (entry.user_sent_id == $(this).data('user') ||  entry.user_received_id == $(this).data('user')))
                     {
                        console.log("hhhiiiif");
                        $(this).append('<span class="badge pull-right">new</span>');
                     }
                  });
               }
               $("#last_id").val(entry.id);
            });
        }
      }
   });
}


send_message_reset = function() {
   $('#send_message').click(function() {
      $('#send_message').parent().parent().children('#chat_message').val("");
   });
   update_client();
}



$(window).load(function() {
   select_user();
   send_message();
   startTimer();
   send_message_reset();
});
$(document).on('page:load', select_user);
$(document).on('page:load', send_message);
$(document).on('page:load', startTimer);
$(document).on('page:load', send_message_reset);


   

