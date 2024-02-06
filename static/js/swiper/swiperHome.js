const swiper = new Swiper('.swiperNav', {
    navigation: {
         nextEl: '.swiper-button-next',
         prevEl: '.swiper-button-prev',
     },
 });

 const swiperFeatures = new Swiper('.features__swiper', {
    slidesPerView: 1,
    centeredSlides: true,
    spaceBetween: 30,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    grid: {
        rows: 1, // Establecer inicialmente el número de filas
    },

});


const swiperMenu = new Swiper('.menu__items', {
    slidesPerView: 1,
    slidesPerGroup: 1,
    centeredSlides: true,
    spaceBetween: 10,  
    navigation: {
        nextEl: ".menu__button--next",
        prevEl: ".menu__button--prev",
        lockClass: '.swiper-button-lock',
      },
    grid: {
        rows:3,
        fill: "row",
    },

});

const swiperPag = new Swiper('.swiperPag', {
    slidesPerView: 1,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
});

document.onscroll = () => {
    const width = document.body.offsetWidth
    console.log(width)
    if (width >= 1000) {
        swiper.params.slidesPerView = 2
        swiper.params.centeredSlides = true
        swiper.params.spaceBetween = 30
        swiper.update()


        swiperMenu.params.slidesPerView = 2
        swiperMenu.params.slidesPerGroup= 6
        swiperMenu.params.grid.rows = 3
        swiperMenu.params.grid.fill = "row"
        swiperMenu.params.centeredSlides = false
        swiperMenu.update()

        swiperFeatures.params.slidesPerView = 3
        swiperFeatures.params.grid.rows = 2
        swiperFeatures.params.grid.fill = "row"
        swiperFeatures.params.centeredSlides = false
        swiperFeatures.update()

        swiperPag.params.slidesPerView = 3;
        swiperPag.params.spaceBetween = 30
        swiperPag.params.pagination.clickable = false
        swiperPag.update()

    } else {

        swiper.params.slidesPerView = 1;
        swiper.params.centeredSlides = false;
        swiper.params.spaceBetween = 0
        swiper.update()

        swiperFeatures.params.slidesPerView = 1
        swiperFeatures.params.grid.rows = 1
        swiperFeatures.params.centeredSlides = true
        swiperFeatures.update()

        swiperMenu.params.slidesPerView = 1
        swiperMenu.params.slidesPerGroup= 1
        swiperMenu.params.grid.rows = 3
        swiperMenu.params.grid.fill = "row"
        swiperMenu.params.centeredSlides = true
        swiperMenu.update()

        swiperPag.params.slidesPerView = 1;
        swiperPag.params.spaceBetween = 0
        swiperPag.params.pagination.clickable = true
        swiperPag.update()

    }
}