import $ from "jquery";

document.addEventListener("turbolinks:load", function () {

  $(".like-toggle").click(function() {
    var button = $(this);
    $.ajax({
      type: 'POST',
      url: `/user/posts/${button.attr("id")}/like_toggle`,
      success: function(data) {
        toggleButton(button, data);
      }
    });

  });

  function toggleButton(button, data) {
    var buttonIcon = button.children().first();
    if (data.liked == true) {
      buttonIcon.css("color", "#80c0ff");
    } else {
      buttonIcon.css("color", "#ffffff");
    }
    button.next().html(data.likesCount);
  }
});
