//= require rails-ujs
//= require jquery
//= require bootstrap
//= require_tree .

$().ready(function() {
  $('[data-toggle="popover"]').popover({
    content: function() {
      var group = $(this).data('group-id');
      var date = $(this).data('day');

      $('#meal_date').val(date);
      $('#meal_group_id').val(group);

      return $('#new_meal').clone();
    },
    html: true
  });
})
