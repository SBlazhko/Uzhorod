$(document).ready(function(){

//edit profile with AJAX
$(".edit_user").on("ajax:success", function(e, data, status, xhr) {
      var update = JSON.parse(xhr.responseText);
      $(".edit_user").append('<h3>' + update.text.fontcolor("green") + '</h3>');

    }).on("ajax:error", function(e, xhr, status, error) {
      $("#new_comment").append("<p>ERROR</p>");
    });
});
