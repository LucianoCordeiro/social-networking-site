import $ from "jquery";

document.addEventListener("turbolinks:load", function () {

  $('.comments-toggle').click(function () {
    $(this).closest(".card").next(".comments-list").toggle();
  })
});
