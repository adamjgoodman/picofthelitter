
$(document).on('turbolinks:load', function() {
  var container = document.querySelector('.grid');
  // initialize Masonry after all images have loaded
  imagesLoaded( '.grid', function() {
      var msnry = new Masonry( container, {
          itemSelector: '.grid-item',
          columnWidth: 20,
          fitWidth: true
      });
  });
})