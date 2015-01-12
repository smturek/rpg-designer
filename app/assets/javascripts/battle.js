$(document).ready(function() {

  $(document).on('ajax:success', 'form.edit_battle', function (e, response) {
    console.log(response);
    $('[data-health=current][data-role=hero]')
    .html(JSON.stringify(response["hero"]["current_health"]));
    $('[data-health=current][data-role=monster]')
    .html(JSON.stringify(response["monster"]["current_health"]));
  });

  $('form.edit_battle').on('submit', function() {
    var $hero = $('[data-character=hero]').find('.fa.fa-male.fa-5x');
    var $monster = $('[data-character=monster]').find('.fa.fa-bug.fa-5x');

    var hero_left = function () {
      $hero.animate({'right': '0px'}, monster_left);
    };

    var monster_left = function () {
      $monster.animate({'left': '-550px'}, monster_right);
    }

    var monster_right = function () {
      $monster.animate({'left': '0px'});
    };

    $hero.animate({'right': '-550px'}, hero_left);



});

});
