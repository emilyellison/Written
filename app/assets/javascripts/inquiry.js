$(document).ready(function() {
  
  if ($('.pen .inquiries .index').length) {
    
    $('form').hide();
    
    $('.reply').click( function(e) {
      e.preventDefault();
      var this_form = $(this).parent().parent().next().next().next();
      this_form.fadeIn();
    });
    
    $('.submit').click( function() {
      $(this).val('Please wait...');
    });
    
  }
  
});