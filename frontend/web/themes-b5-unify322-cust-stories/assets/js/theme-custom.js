// File for your custom JavaScript
(function () {
    // INITIALIZATION OF NAVBAR
    // =======================================================
    new HSHeader('#header').init()


    // INITIALIZATION OF MEGA MENU
    // =======================================================
    const megaMenu = new HSMegaMenu('.js-mega-menu', {
        desktop: {
            position: 'left'
        }
    })


    // INITIALIZATION OF GO TO
    // =======================================================
    new HSGoTo('.js-go-to')


    // INITIALIZATION OF SWIPER
    // =======================================================
    var swiper = new Swiper('.js-swiper-clients-1', {
        slidesPerView: 2,
        autoplay: true,
        loop: true,
        breakpoints: {
            380: {
                slidesPerView: 3,
                spaceBetween: 15,
            },
            768: {
                slidesPerView: 4,
                spaceBetween: 15,
            },
            1024: {
                slidesPerView: 5,
                spaceBetween: 15,
            },
        },
    });

    // Clients 2
    var swiper = new Swiper('.js-swiper-clients-2', {
        slidesPerView: 2,
        autoplay: true,
        loop: true,
        breakpoints: {
            380: {
                slidesPerView: 3,
                spaceBetween: 15,
            },
            768: {
                slidesPerView: 4,
                spaceBetween: 15,
            },
            1024: {
                slidesPerView: 5,
                spaceBetween: 15,
            },
        },
    });
})()