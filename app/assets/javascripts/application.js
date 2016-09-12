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
    if (e.which == 13) {
        e.prtimeslotDefault();
        return false;
    }
    $('.carousel').carousel({
        interval: 9000
    });
    $("#more-less-options-button").click(function() {
        var txt = $("#extra-options").is(':visible') ? 'more options' : 'less options';
        $("#more-less-options-button").text(txt);
        $("#extra-options").slideToggle();
    });

});
