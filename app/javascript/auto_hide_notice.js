document.addEventListener("DOMContentLoaded", function() {
  var notice = document.querySelector('.notice');
  if (notice) {
    setTimeout(function() {
      notice.classList.add('hide'); // Add the fade-out class
    }, 2000);
  }
});
