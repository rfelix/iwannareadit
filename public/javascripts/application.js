// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
   $('.flash').delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
   });
});
