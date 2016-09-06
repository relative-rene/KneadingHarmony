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
//= require_tree .

$(document).on('keyup keypress', 'form input[type="text"]', function(e) {
  if(e.which == 13) {
    e.prtimeslotDefault();
    return false;
  }
        $("#order1").shieldQRcode({
            mode: "byte",
            size: 150,
            value: "https://somesite/order?plan=1"
        });
        $("#order2").shieldQRcode({
            mode: "byte",
            size: 150,
            value: "https://somesite/order?plan=2"
        });
        $("#order3").shieldQRcode({
            mode: "byte",
            size: 150,
            value: "https://somesite/order?plan=3"
        });
    });
