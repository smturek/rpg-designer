$(document).ready(function() {

  $('[data-play]').on('click', function() {
    debugger
    $('[data-character=monster]').find('.fa.fa-bug.fa-5x').animate({'left': '-550px'});
    $('[data-character=monster]').find('.fa.fa-bug.fa-5x').animate({'left': '0px'});
    setTimeout(function () {
      $('[data-character=hero]').find('.fa.fa-male.fa-5x').animate({'right': '-550px'});
      $('[data-character=hero]').find('.fa.fa-male.fa-5x').animate({'right': '0px'});
    }, 1000);
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
