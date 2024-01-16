
$(document).on('load', function () {
    
    // initialization of carousel
    $.HSCore.components.HSCarousel.init('.js-carousel');

    // initialization of header
    $.HSCore.components.HSHeader.init($('#js-header'));
    $.HSCore.helpers.HSHamburgers.init('.hamburger');

    // initialization of go to section
    $.HSCore.components.HSGoTo.init('.js-go-to');

    // initialization of progressbar
    var horizontalProgressBars = $.HSCore.components.HSProgressBar.init('.js-hr-progress-bar', {
        direction: 'horizontal',
        indicatorSelector: '.js-hr-progress-bar-indicator'
    });

    // initialization of chart pie
    var items = $.HSCore.components.HSChartPie.init('.js-pie');

});

$(window).on('load', function () {
    // initialization of HSScrollNav
    $.HSCore.components.HSScrollNav.init($('#js-scroll-nav'), {
        duration: 700
    });
});
