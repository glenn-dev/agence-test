$(document).ready(function(){
  $('#relatorio').click(function() {
    let selected = [];
    $('#users_checkbox input:checked').each(function() {
      selected.push($(this).attr('name'));
    });
    let start_date = $('#start_date').val()
    let end_date = $('#end_date').val()
    $.get("relatorio", {users: selected.join(), date1: start_date, date2: end_date});
  });
})
