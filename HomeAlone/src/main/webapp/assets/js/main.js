$(document).ready(function () {
    var $list = $(".slideshow");
    var timeID = window.setInterval(slide, 4000);


	$list.on('mouseenter', stopSlide);
    $list.on('mouseleave', startSlide);
    
	function stopSlide() {
		clearInterval(timeID); // 슬라이더 멈춤
	}
	
	function startSlide() {
		timeID = setInterval(slide, 4000); // 슬라이더 재시작
	}
	function slide() {
        $list.animate({ "marginLeft": "-33.45%" }, 2000, function () {
            $(this).css("marginLeft", 0).find("li:first").appendTo($list);
        });
    }

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
            $('#back > img').css("transform", "scale(1.2)");
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
        $('#back').css("display", "block");
        $viewer.animate({ "width": "35%" }, 400);
        $("#back > img").animate({ "opacity": "50%" }, 500);
    }
    function closer() {
        $('#back').css("display", "none");
        $viewer.animate({ "width": "0%" }, 400);
        $("#back> img").animate({ "opacity": "0%" }, 500);
    }

    $("#search_btn").click(function(){
        $("#search").toggleClass("on")

    })
});