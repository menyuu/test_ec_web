$(document).on('turbolinks:load', function() {
 $('.slider').slick({
  dots: true,
  arrows: true,
  autoplay: true,
  autoplaySpeed: 4000,
  dots: true,
 });
});

document.addEventListener("turbolinks:before-cache", function(){
	$('.slider.slick-initialized').slick('unslick');
});