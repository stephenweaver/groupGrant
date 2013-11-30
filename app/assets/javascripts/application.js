// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-datepicker
//= require skrollr
//= require_tree .

$('.dropdown-toggle').dropdown()



$( document ).ready(function() {
   var a = $('.ellipsis_gg_title div');

   while (a.outerHeight()>$('.ellipsis_gg_title').height()) {
      a.text(function (index, text) {
         return text.replace(/\W*\s(\S)*$/, '...');
      });
   }

   a = $('.ellipsis_gg_about div');
   while (a.outerHeight()>$('.ellipsis_gg_about').height()) {
      a.text(function (index, text) {
         return text.replace(/\W*\s(\S)*$/, '...');
      });
   }


   skrollr.init({
      forceHeight: false
   });

   $('.datepicker').datepicker()
});
