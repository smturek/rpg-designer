$('.battle-edit').ready(function() {

  $('.monster').on('click', 'button', function() {
    $(this).closest('.monster').find('.fa-bug').hide();
  });

  $('.monster').on('mouseenter', function() {
    $(this).css(color, "red");
  });

});
