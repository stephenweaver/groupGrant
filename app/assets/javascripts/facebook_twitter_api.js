// Facebook API setup
window.fbAsyncInit = function() {
FB.init({
appId      : '603004516422329',
status     : true,
xfbml      : true
});
};

facebook = function () {(function(d, s, id){
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) {return;}
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/en_US/all.js";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
};

// Twitter API setup
twitter = function() {!function(d,s,id)
{
var js,fjs=d.getElementsByTagName(s)[0];

if(!d.getElementById(id))
{
js=d.createElement(s);
js.id=id;
js.src="https://platform.twitter.com/widgets.js";
fjs.parentNode.insertBefore(js,fjs);
}
}
(document,"script","twitter-wjs");
};

// Load the buttons
$(document).ready(function(){
var href = location.pathname;
var tweet = "<a href=\'http://www.groupGrant.com" + href;
    tweet = tweet + "\' class=\'twitter-share-button\' data-lang=\'en\' data-count=\'none\'>Tweet</a>";
var share = "<div class=\'fb-share-button\' data-href=\'http://www.groupGrant.com" + href + "\'data-width=\'100\' data-type=\'button\'></div>";

$("#tweets").html(tweet);
$("#sharePage").html(share);
});


$(window).load(function() {
   twitter();
   facebook();
});

$(document).on('page:load', facebook);
$(document).on('page:load', twitter);
