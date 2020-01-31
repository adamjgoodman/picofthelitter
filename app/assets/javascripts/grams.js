$(document).on('turbolinks:load', function() {
  var elem = document.querySelector('.grid');
  var msnry = new Masonry( elem, {
    // options
    itemSelector: '.grid-item',
    columnWidth: 20,
    fitWidth: true
  });
})
