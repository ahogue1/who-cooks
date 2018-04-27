//= require rails-ujs
//= require jquery
//= require bootstrap
//= require cocoon
//= require_tree .

$().ready(function() {
  $('[data-toggle="popover"]').popover({
    content: function() {
      var group = $(this).data('group-id');
      var date = $(this).data('day');

      $('.hidden-form #meal_date').val(date);
      $('.hidden-form #meal_group_id').val(group);

      content = $('#new_meal').clone();

      $.getJSON( "groups/" + group + "/users", function( data ) {
        var users = [];

        $.each( data["users"], function( index, user ) {
          users.push( "<option value='" + user["id"] + "'>" + user["username"] + "</option>" );
        });

        content.find("#meal_user_id").html(users.join(""))

        content.find(".loading-spinner").addClass("hidden");
        content.find("#meal_user_id").removeClass("hidden");
      });

      return content;
    },
    html: true
  });
});
