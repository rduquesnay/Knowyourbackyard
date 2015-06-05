$(document).ready( function() {
  $("#new_review :checkbox").change( function(event) {
    event.preventDefault();
    console.log("changed");
    if($(this).prop("checked")) {
      $(this).closest(".row").find("textarea").prop("disabled", false);
      console.log("checked");
    } else {
      $(this).closest(".row").find("textarea").prop("disabled", true);
      $(this).closest(".row").find("textarea").val("");
      console.log("unchecked");
    }
  });
});
