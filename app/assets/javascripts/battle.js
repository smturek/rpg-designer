$(document).ready(function() {

  $(document).on('ajax:success', 'form.edit_battle', function (e, response) {
    var $hero = $('[data-character=hero]').find('.fa.fa-male.fa-5x');
    var $monster = $('[data-character=monster]').find('.fa.fa-bug.fa-5x');

    $hero.animate({'right': '-550px'}, function () {
      if (response.monster.current_health <= 0) {
        $hero.animate({'right': '0px'}, function () {
          $('[data-health=current][data-role=monster]').html(response.monster.current_health);
          window.location = response.redirect;
          console.log(response);
        });
      }
      else {
        $('[data-health=current][data-role=monster]').html(response.monster.current_health);
        $hero.animate({'right': '0px'}, function () {
          $monster.animate({'left': '-550px'}, function () {
            if (response.hero.current_health <= 0) {
              $monster.animate({'left': '0'}, function () {
                window.location = response.redirect;
                console.log(response);
              });
            }
            else {
              $('[data-health=current][data-role=hero]').html(response.hero.current_health);
              $monster.animate({'left': '0'});
            }
          });
        });
      }
    });
  });

});
