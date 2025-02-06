document.addEventListener("DOMContentLoaded", function() {
  var notice = document.querySelector('.notice');
  if (notice) {
    setTimeout(function() {
      notice.classList.add('hide');
    }, 2000);
  }
});
