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
        swiperFeatures.params.slidesPerView = 3
        swiperFeatures.params.grid.rows = 2
        swiperFeatures.params.grid.fill = "row"
        swiperFeatures.params.centeredSlides = false
        swiperFeatures.update()

        swiperPag.params.slidesPerView = 2;
        swiperPag.params.spaceBetween = 30
        swiperPag.params.pagination.clickable = false
        swiperPag.update()

    } else {

        swiperFeatures.params.slidesPerView = 1
        swiperFeatures.params.grid.rows = 1
        swiperFeatures.params.centeredSlides = true
        swiperFeatures.update()

        swiperPag.params.slidesPerView = 1;
        swiperPag.params.spaceBetween = 0
        swiperPag.params.pagination.clickable = true
        swiperPag.update()
    
    }
}
