import 'slick-carousel';
import 'slick-carousel/slick/slick.scss';
import 'slick-carousel/slick/slick-theme.scss';

const carousel = document.querySelector('.multiple-items');
if (carousel) {
  $(document).ready(function(){
    $('.multiple-items').slick({
      dots: false,
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 3,
      prevArrow: '<i class="fas fa-chevron-left slick-custom-previous"></i>',
      nextArrow: '<i class="fas fa-chevron-right slick-custom-next"></i>',
    });
  });
}

