$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  //ZM: how would you re write this knowing what we know now. 
  $("#show_signup").click(function(){
    $.get("/signup_partial", function(data){
      $("#loginForm").replaceWith(data);
    });
  });

});
