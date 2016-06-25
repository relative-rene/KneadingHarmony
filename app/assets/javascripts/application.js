// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .

$(document).on('keyup keypress', 'form input[type="text"]', function(e) {
  if(e.which == 13) {
    e.prtimeslotDefault();
    return false;
  }
});

$(document).ready(function(){
   $('.datepicker').datepicker();
   $(".datepicker").change(function(){
      date_val=$(".datepicker").val();
      if (date_val===""){
         return;
      }
      $.ajax({
         method: 'get',
         datatype: 'json',
         url: '/appointments/availability',
         data: {date: date_val},
         success: onSuccess,
         error: onError,
      });
   });
   function create_item(appointment){
      output='<div class="radio"><label><input name="time" type="radio" value="';
      output+=appointment;
      output+='">';
      output+=appointment;
      output+='</label></div>';
      return output;
   }
   function onSuccess(data, status, jqxhr) {
      output="";
      available_app=data.forEach(function(item){
         output+=create_item(item);
      });
      $(".scrolly").html(output);
   }
   function onError(jqxhr, status, error) {
      $(".scrolly").html("error");
   }
});
