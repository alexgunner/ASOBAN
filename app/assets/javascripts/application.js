// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.easing/jquery.easing
//= require FitText.js.js
//= require WOW/wow
//= require countto
//= require theme/custom
//= require owlcarousel/owl-carousel/owl.carousel
//= require underscore
//= require gmaps/google
//= require gmaps_contact
//= require turbolinks
//= require_tree .

var onLoadAndResizeExecutions = function(){
  try {
    $('button').addClass('btn btn-default');
    var topHeaderPaddingLeft = parseInt($('.navbar-nav').css('padding-left').replace('px', '')) - 15;
    var topHeaderPaddingRight = parseInt($('.navbar-nav').css('padding-right').replace('px', '')) - 30;
    $('.top-header').css('padding-left', topHeaderPaddingLeft);
    $('.top-header').css('padding-right', topHeaderPaddingRight);
    $('.main-news-container').css('padding-bottom', $(window).innerHeight()/3);
    $('.main-news-container').css('padding-top', $('#mainNav').innerHeight());
    $('.show-hide-pdf').click(function(){
      var content = $(this).parent().parent().parent().parent().find('.inline-pdf-content');
      if($(content).css('display') == 'none'){
        $(content).slideIn(300);
        $(this).text('Ocultar Documento');
      }
      else {
        $(content).slideOut(300);
        $(this).text('Ver Documento');
      }
    });
  } catch (e) {
    console.log(e);
  }
};

$(document).on('turbolinks:load', function(){
  onLoadAndResizeExecutions();
  themeScript(jQuery);
  $('.publication-button-text').click(function(){
    var publication_summary = $(this).parent().parent().parent().parent();
    var publication_content = publication_summary.find('.publication-content');
    var height = publication_summary.css('max-height');
    if($(publication_content).css('opacity') == '0'){
      $(publication_content).show();
      $(this).text('Ver Menos');
      if(window.innerWidth < 992) {
        height = $(publication_content).height() + publication_summary.find('.publication-details').height() + 60;
        $(publication_summary).css('max-height', height + 'px');
        $(publication_summary).css('height',  height + 'px');
      }
      $(publication_content).css('opacity', '1');
    }
    else {
      $(this).text('Leer Más');
      $(publication_summary).css('max-height', '270px');
      $(publication_summary).css('height', '270px');
      $(publication_content).css('opacity', '0');
    }
  });
});

$(window).on('resize', function(){
  onLoadAndResizeExecutions();
});
