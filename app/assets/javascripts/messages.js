select_user = function() { 
   $( ".friend" ).click(function() {
     var user_id = $(this).data("user");
     var temp =  this;
     var classname = "";
     $.ajax({
         type: "POST",
         url: "/messages/getMessages",
         data: { id: user_id },
         dataType: "html",
         async: false,
         success: function (data) {
            $("#chats tr").remove();
            $('#chats').append(data);
            $( ".friend" ).parent().removeClass('success');
            $(temp).parent().addClass('success');
            $(temp).children('.badge').remove();
            $('#message_table').animate({"scrollTop": $('#message_table')[0].scrollHeight}, "slow");
         }
      });
   });
   $(".friend:first").parent().addClass('success');
   scrollDown();
};



send_message = function(){
 $( "#send_message" ).click(function() {
     var user_id = $($('.success')[0].children[0]).data('user');
     var message_data = {user_received_id: user_id, user_sent_id : null, read: false, deleted: false, body: $(chat_message).val()};
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
     update_client();
   });
};

startTimer = function() {
  if(($("#last_id")).length != 0) {
     window.setInterval(update_client, 10000);
  }

  if($(".friend:first").length > 0)
  {
    $(".friend:first").click();
  }
};


update_client = function(){
   $.ajax({
      type: "POST",
      url: "/messages/checkAjax",
      data: { message_id : $("#last_id").val()},
      dataType: "json",
      async: false,
      success: function (data) {
         console.log("test");
        if(data.length > 0)
        {
            $(".friend").children('.badge').remove();
            var classname = "";
            data.forEach(function(entry) {
               var user_id = $("#current_user").val();
               var selected_id = $($('.success')[0].children[0]).data('user');
               if(entry.user_sent_id == selected_id ||  entry.user_received_id == selected_id)
               {
                  if(entry.user_sent_id != $("#current_user").val()) { classname = "active" }
                  else { classname = "text-right" }
                   $('#chats').append('<tr style="width:100%" class="chat ' + classname + '"><td><b>' + entry.user.rolable.name +'</b><br/> ' + entry.body + '</td></tr>');
               }
               else
               {
                  $(".friend").each(function(index){
                     if( ($(".friend").children('.badge').length < 1) && (entry.user_sent_id == $(this).data('user') ||  entry.user_received_id == $(this).data('user')))
                     {
                        $(this).append('<span class="badge pull-right">new</span>');
                     }
                  });
               }
               if(entry.id > $("#last_id").val())
                {
                    $("#last_id").val(entry.id)
                };
            });
            setTimeout(function (){
              scrollDown();
            }, 500); 
        }
      }
   });


}


send_message_reset = function() {
   $('#send_message').submit(function(e) {
      $('#send_message').parent().parent().children('#chat_message').val("");
      e.preventDefault();
   });
   update_client();
}

// auto_complete_users = function() {
// var user = $( "#current_user" ).val();
// console.log(user);
//   $.ajax({
//          type: "POST",
//          url: "/message/searchUsers",
//          data: {"user":user},
//          dataType: "json",
//          async: false,
//          success: function (data) { 
//           console.log(data);
//           $( "#search" ).autocomplete({
//             source: data
//            });
//          }
//   });
// }





auto_complete_users = function() {
    $( "#show-messages-button" ).click(function() {
      chosen();
   });
};


chosen = function() { 
    setTimeout(function (){
        var config = {
        '.select_new_contact' : {}
      }
      
      for (var selector in config) {
        $(selector).chosen(config[selector]);
      }

      console.log("asdfsd");
    }, 500); 
   };


firstContact = function(){
  console.log("does this work?")
  $('.modal').on('submit','form[data-async]', function(event) {
    console.log("do you even lift")
    var $form = $(this);
    var target = $form.attr('data-target');
    var user_id = $('.select_new_contact').val();
    var message_data = {user_received_id: user_id, user_sent_id : null, read: false, deleted: false, body: $('#newMessage').val()};
    var json = JSON.stringify(message_data );
    $.ajax({
        type: $form.attr('method'),
        url: $form.attr('action'),
        data: { 'message' : message_data },
        dataType: "json",

        success: function(data, status) {
          console.log("1");
            $.each(target.split("|"),function(i,val){
                if(val == "close"){
                    console.log("1");
                    $form.closest(".modal").modal("hide");
                }else if(val == "event"){
                    console.log("2");
                    $form.trigger("ajax-submit");
                }else{
                    console.log("3");
                    $(val).html(data);
                }
            });
            $(document).trigger("add-alerts", {
                message: "Your message has been sent!",
                priority: "success"
              });
        }
    });

    event.preventDefault();
  });
};

scrollDown = function() {
  $('#message_table').animate({"scrollTop": $('#message_table')[0].scrollHeight}, "slow");
}


request_response = function() {
  $(".message_request_form").on("ajax:success", function(e, data, status, xhr) {
      if(data['status'] === true) {
        $(e.target).html('<div style="color:green">A partnership for blank between blank and blank was accepted.</div>');
      }
      else if(data['status'] === false) {
        $(e.target).html('<div style="color:red">A partnership for blank between blank and blank was NOT accepted.</div>');
      }


  });
}


$(window).load(function() {

   select_user();
   send_message();
   startTimer();
   send_message_reset();
   auto_complete_users();
   firstContact();
   chosen();
   request_response();
});
$(document).on('page:load', select_user);
$(document).on('page:load', send_message);
$(document).on('page:load', startTimer);
$(document).on('page:load', send_message_reset);
$(document).on('page:load', auto_complete_users);
$(document).on('page:load', firstContact);
$(document).on('page:load', chosen);
$(document).on('page:load', request_response);

