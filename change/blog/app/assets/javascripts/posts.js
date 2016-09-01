$(document).ready(function(){

$('#com_but').click(function(){
    $('.com_index').slideToggle('slow')
});

$('#new_com_but').click(function(){
    $('.new_com_form').slideToggle('slow')
});

//post new comment with AJAX
$("#new_comment").on("ajax:success", function(e, data, status, xhr) {
    var comment = JSON.parse(xhr.responseText);
      $(".com_index").append('<div class="panel panel-success">' +
                             '<div class="panel-heading">' +
                             '<h5>Ваш коментар :</h5>' +
                             '<div class="panel-body">' +
                             '<h5>' + comment.content + '</h5>' + '</div>' + '</div>' + '</div>');
       $(".new_com_form").toggle();
    }).on("ajax:error", function(e, xhr, status, error) {
      $("#new_comment").append("<p>ERROR</p>");
    });



});



