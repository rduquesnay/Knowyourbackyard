//Arrow to scroll to top of page

$(document).ready(function() {
  //Check to see if the window is top if not then display button
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $(".scrollToTop").fadeIn();
    } else {
      $(".scrollToTop").fadeOut();
    }
  });

  //Click event to scroll to top
  $(".scrollToTop").click(function() {
    $("html, body").animate({scrollTop : 0},800);
    return false;
  });
});


//Bump scroll to top up when at bottom of page to prevent display conflict with footer

$(document).on("scroll",function() {
  if(($(document).scrollTop() + window.innerHeight)<($(document).innerHeight() - 60)){
    $(".scrollToTop").removeClass("bottom-bump");
  } else {
    $(".scrollToTop").addClass("bottom-bump");
  }
});
