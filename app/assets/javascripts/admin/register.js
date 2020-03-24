$(function() {
  $('#login-form-link').click(function(e) {
    $('#register-form-link').trigger('reset');
    $("#login-form").delay(100).fadeIn(100);
    $("#register-form").fadeOut(100);
    $('#register-form-link').removeClass('active');
    $(this).addClass('active');
    $('#error_explanation').html('');
    e.preventDefault();
  });
  $('#register-form-link').click(function(e) {
    $("#login-form").trigger('reset');
    $("#register-form").delay(100).fadeIn(100);
    $("#login-form").fadeOut(100);
    $('#login-form-link').removeClass('active');
    $(this).addClass('active');
    $('#error_explanation').html('');
    e.preventDefault();
  });

});
