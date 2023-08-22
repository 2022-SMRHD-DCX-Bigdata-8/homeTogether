$(document).ready(function () {
    function autoHypenPhone(str) {
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if (str.length < 4) {
            return str;
        } else if (str.length < 7) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        } else if (str.length < 11) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        } else {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }

    var cellPhone = document.getElementById('cellPhone');
    cellPhone.onkeyup = function (event) {
        event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenPhone(_val);
    }

    $('#post_btn').on("mouseenter", function (e) {
        $(this).css("background-color", "white");
        $(this).css("color", "black");
    })
    $('#post_btn').on("mouseleave", function (e) {
        $(this).css("background-color", "#b2b278");
        $(this).css("color", "white");
    })

    //------------------------------------------------

    $('#back').on("mouseenter", function (e) {
        if ($("#back").css("opacity") != "0%") {
            $('#back > img').css("opacity", "100%");
        }
    })

    $('#back').on("mouseleave", function (e) {
        if ($("#back").css("opacity") != "0%") {
            $('#back > img').css("transform", "scale(1)");
            $('#back > img').css("opacity", "50%");
        }

    })
    $('#back').on("click", function (e) {
        closer();
        /* $("#login_view").css("width", "0px"); */
        /* $(this).css("visibility", "hidden"); */
    })
    $("#goLogin").on("click", function (e) {
        opener();
        /* $("#back").css("visibility", "visible"); */
    })
    //-------------------------------------------------
    var $viewer = $("#login_view");
    function opener() {
        $viewer.animate({ "width": "35%" }, 400);
        $("#back").animate({ "opacity": "50%" }, 500);
        $('#back > img').css("opacity", "50%");
    }
    function closer() {
        $viewer.animate({ "width": "0%" }, 400);
        $("#back").animate({ "opacity": "0%" }, 500);
    }
    $("#review_num > a").click(function (e) {
        var target = $(e.target);
        $("#review_num > a").removeClass("on");
        target.toggleClass("on");
    })
    $("#QnA_num > a").click(function (e) {
        var target = $(e.target);
        $("#QnA_num > a").removeClass("on");
        target.toggleClass("on");
    })
    //-------------------------------------------------------
    
    $("#review_prev > a").click(function () {
        var aTags = $("#review_num").children();
        var len = aTags.length;
        for (var i = 0; i < len; i++) {
            if (aTags.eq(i).hasClass("on")) {
                aTags.eq(i).removeClass("on");
                if (i > 0) {
                    aTags.eq(i - 1).toggleClass("on");
                }
                if (i == 0) {
                    aTags.eq(0).addClass("on");
                }
                break;
            }
        }
    })
    $("#review_append > a").click(function () {
        var aTags = $("#review_num").children();
        var len = aTags.length;
        for (var i = 0; i < len; i++) {
            if (aTags.eq(i).hasClass("on")) {
                aTags.eq(i).removeClass("on");
                if (len > i) {
                    aTags.eq(i + 1).toggleClass("on");
                }
                if (len-1 == i) {
                    aTags.eq(i).addClass("on");
                }
                break;
            }
        }
    })
    $("#QnA_prev > a").click(function () {
        var aTags = $("#QnA_num").children();
        var len = aTags.length;
        for (var i = 0; i < len; i++) {
            if (aTags.eq(i).hasClass("on")) {
                aTags.eq(i).removeClass("on");
                if (i > 0) {
                    aTags.eq(i - 1).toggleClass("on");
                }
                if (i == 0) {
                    aTags.eq(0).addClass("on");
                }
                break;
            }
        }
    })
    $("#QnA_append > a").click(function () {
        var aTags = $("#QnA_num").children();
        var len = aTags.length;
        for (var i = 0; i < len; i++) {
            if (aTags.eq(i).hasClass("on")) {
                aTags.eq(i).removeClass("on");
                if (len > i) {
                    aTags.eq(i + 1).toggleClass("on");
                }
                if (len-1 == i) {
                    aTags.eq(i).addClass("on");
                }
                break;
            }
        }
    })
    //-----------------------------------------------------------
    $("#QnA_append > a").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
    })
    $("#QnA_prev > a").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
    })
    $("#review_append > a").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
    })
    $("#review_prev > a").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
    })
    $("#QnA_num > a").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
    })
    $("#review_num > a").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
    })
    //---------------------------------------------------------------
    $("#top_img > a").click(function(){
        $('html, body').animate({scrollTop: 0 }, 'slow');
    })
    $("#down_img > a").click(function(){
        $('html, body').animate({scrollTop: $(document).height() }, 'slow');
    })
})