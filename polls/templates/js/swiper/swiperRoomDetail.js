const swiper = new Swiper('.swiperNav', {
    navigation: {
         nextEl: '.swiper-button-next',
         prevEl: '.swiper-button-prev',
     },
 });

 document.onscroll = () => {
    const width = document.body.offsetWidth
    console.log(width)
    if (width >= 1000) {
        swiper.params.slidesPerView = 2
        swiper.params.spaceBetween = 30
        swiper.update()


    } else {

        swiper.params.slidesPerView = 1;
        swiper.params.centeredSlides = false;
        swiper.params.spaceBetween = 0
        swiper.update()
    }
}