var AplombApp = function () {
    "use strict";
    var e = $(window),
        l = $("body"),
        t = $(document),
        c = $(".body-content"),
        n = $("#wrapper"),
        o = $("#sidebar-main"),
        a = $("#status"),
        i = $("#preloader"),
        u = $(".button-menu-mobile"),
        s = $("#btn-fullscreen"),
        r = $("#sidebar-menu a"),
        d = $(".has_sub"),
        m = function () {
            d.each(function () {
                var e = $(this);
                e.hasClass("nav-active") && e.find("> ul").slideUp(300, function () {
                    e.removeClass("nav-active")
                })
            })
        },
        p = function () {
            var e = t.height();
            e > c.height() && c.height(e)
        },
        v = function (e) {
            a.fadeOut(), i.delay(350).fadeOut("slow"), l.delay(350).css({
                overflow: "visible"
            })
        },
        f = function (e) {
            $('[data-toggle="tooltip"]').tooltip(), $('[data-toggle="popover"]').popover(), o.slimscroll({
                height: "auto",
                position: "right",
                size: "8px",
                color: "#9ea5ab"
            }), u.on("click", function (e) {
                return e.preventDefault(), l.toggleClass("fixed-left-void"), n.toggleClass("enlarged"), !1
            }), r.on("click", function (e) {
                var t = $(this).parent(),
                    n = t.find("> ul");
                l.hasClass("sidebar-collapsed") || (n.is(":visible") ? n.slideUp(300, function () {
                    t.removeClass("nav-active"), c.css({
                        height: ""
                    }), p()
                }) : (m(), t.addClass("nav-active"), n.slideDown(300, function () {
                    p()
                })))
            }), r.each(function () {
                var e = window.location.href.split(/[?#]/)[0];
                this.href == e && ($(this).addClass("active"), $(this).parent().addClass("active"), $(this).parent().parent().prev().addClass("active"), $(this).parent().parent().parent().addClass("active"), $(this).parent().parent().prev().click())
            }), s.on("click", function (e) {
                return e.preventDefault(), document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement ? document.cancelFullScreen ? document.cancelFullScreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitCancelFullScreen && document.webkitCancelFullScreen() : document.documentElement.requestFullscreen ? document.documentElement.requestFullscreen() : document.documentElement.mozRequestFullScreen ? document.documentElement.mozRequestFullScreen() : document.documentElement.webkitRequestFullscreen && document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT), !1
            })
        };
    return {
        init: function () {
            t.ready(f), e.on("load", v)
        }
    }
}();
! function (e) {
    "use strict";
    AplombApp.init()
}(window.jQuery);