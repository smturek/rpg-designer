$(document).ready(function() {

  $('button').on('click', function() {
    $(this).hide();
  });

  $('.fa.fa-bug.fa-5x').on('click', function() {
    $(this).animate({'left': '-500px'})
    $(this).animate({'left': '0px'})
  });

});
