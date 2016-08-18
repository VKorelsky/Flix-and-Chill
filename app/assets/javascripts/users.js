// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready( function(){
  $('#activity-history').on("click", function() {
    $(this).toggleClass("active");
    $('#future-activity').toggleClass("active");
  });

  $('#future-activity').on("click", function() {
    $(this).toggleClass("active");
    $('#activity-history').toggleClass("active");
  });
});
