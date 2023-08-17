$(document).ready(function () {
    var $list = $(".slideshow");
    var $hero_header = $("#hero_header");
    var timeID = window.setInterval(slide, 3000);

    function slide() {
        $list.animate({ "marginLeft": "-33.33333%" }, 2000, function () {
            $(this).css("marginLeft", 0).find("li:first").appendTo($list);
        });
    }

    $hero_header.hover(
        function () {
            clearInterval(timeID);
        },
        function () {
            timeID = window.setInterval(slide, 2000);
        }
    );

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

    $('#post_btn').on("mouseenter", function () {
        $(this).css("background-color", "white");
        $(this).css("color", "black");
    })
    $('#post_btn').on("mouseleave", function () {
        $(this).css("background-color", "#b2b278");
        $(this).css("color", "white");
    })

    //------------------------------------------------

    $('#back').on("mouseenter", function () {
        if ($("#back").css("opacity") != "0%") {
            $('#back > img').css("transform", "scale(1.2)");
            $('#back > img').css("opacity", "100%");
        }
    })

    $('#back').on("mouseleave", function () {
        if ($("#back").css("opacity") != "0%") {
            $('#back > img').css("transform", "scale(1)");
            $('#back > img').css("opacity", "50%");
        }

    })
    $('#back').on("click", function () {
        closer();
    })
    $("#goLogin").on("click", function () {
        opener();
    })
    //-------------------------------------------------
    var $viewer = $("#login_view");
    function opener() {
        $viewer.animate({ "width": "35%" }, 1000);
        $("#back").animate({ "opacity": "50%" }, 500);
        $('#back > img').css("opacity", "50%");
    }
    function closer() {
        $viewer.animate({ "width": "0%" }, 1000);
        $("#back").animate({ "opacity": "0%" }, 500);
    }

});