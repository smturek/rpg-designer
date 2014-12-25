$(document).ready(function() {

  $('button').on('click', function() {
    this.$(parent()).find('.fa.fa-bug.fa-5x').hide();
  });

  $('.fa.fa-bug.fa-5x').on('click', function() {
    $(this).animate({'left': '-550px'})
    $(this).animate({'left': '0px'})
  });

  $('.fa.fa-male.fa-5x').on('click', function() {
    $(this).animate({'right': '-550px'})
    $(this).animate({'right': '0px'})
  });

});
