$(document).ready( function() {
  $("#new_review :checkbox").change( function(event) {
    event.preventDefault();
    if($(this).prop("checked")) {
      $(this).closest(".row").find("textarea").prop("disabled", false);
    } else {
      $(this).closest(".row").find("textarea").prop("disabled", true);
      $(this).closest(".row").find("textarea").val("");
    }
  });
});

