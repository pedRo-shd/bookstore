$(document).ready(function() {
  $('#search_term').autocomplete({
    source: '/busca',
    dataType: 'json',
    minLength: 3,

    change: function(event, ui) {

      if (!ui.item) {
        $('#search_term').val('');
      }
    },

    select: function(event, ui) {
      if (ui.item) {
        window.location.href = '/livro/'+ui.item.id;
      }
    }
  });
});
