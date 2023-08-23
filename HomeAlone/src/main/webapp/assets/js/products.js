$(document).ready(function () {
    $("#categori>li>a").on("mouseenter", function (e) {
        $(this).css("color", "white");
        $(this).css("background-color", "#b2b278");
    });

    $("#categori>li>a").on("mouseleave", function (e) {
        $(this).css("color", "black");
        $(this).css("background-color", "white");
    });
    
    $("#nav > #categori > li > a > span").click(function(e){
        var text = $(e.target).text();
        $(".goods_list_title > h2").text(text);
        $("#nav > #categori > li > a").removeClass("on");
        $(e.target).parent().toggleClass("on");
    })
    

    
    
    /* 폰 입력 js 시작 */
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
    /* 폰 입력 js 끝 */

    /* $("#sort>li").on("click", function (e) {
        if ($("#sort>:last-child").css("visibility") == "hidden") {
            $("#sort>li").css("visibility", "visible");
        } else {
            $("#sort>li:not(:first-child)").css("visibility", "hidden");
        }
    })

    $("#sort>li").on("click", function (e) {
        if ($("#sort>li:not(:first-child)").css("visibility") == "visible") {
            var selected = $(e.target);
            selected.parent().prependTo("#sort");
            $("#sort>:not(:first-child)").css("visibility", "hidden");
            $("#sort>:first-child").css("visibility", "visible");
        }
    }) */
    $("#sort>li").on("click", function (e) {
        if ($("#sort>:last-child").css("visibility") == "hidden") {
            $("#sort>li").css("visibility", "visible");
        } else {
            var selected = $(e.target);
            selected.parent().prependTo("#sort");
            $("#sort>:not(:first-child)").css("visibility", "hidden");
            $("#sort>:first-child").css("visibility", "visible");
        }
    });


    $("#sort>li").mouseenter(function () {
        $(this).css("background-color", "#b2b278");
        $(this).css("color", "white");
    });
    $("#sort>li").mouseleave(function () {
        $(this).css("background-color", "white");
        $(this).css("color", "black");
    });



    $("#filter>li>a").mouseenter(function (e) {
        var target = $(e.target);
        target.css("color", "#b5ae60");
        target.children().css("color", "#b5ae60");
    })
    $("#filter>li>a").mouseleave(function (e) {
        var target2 = $(e.target);
        target2.css("color", "black");
        target2.children().css("color", "black");
    })
    $("#filter>li>a").click(function (e) {
        var target3 = $(e.target);
        $("#filter>li").removeClass("cate");
        target3.parent().toggleClass("cate");
        target3.parent().parent().toggleClass("cate");
    })

    $("#buttons > li > span").click(function(e){
        var target = $(e.target);
        $("#buttons > li").removeClass("click");
        target.parent().toggleClass("click");
    })
    /* $("#goods_lists> li > a > img").mouseenter(function(e){
        var target = $(e.target);
        target.css("")
    }) */

    
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
        $viewer.animate({ "width": "35%" }, 400);
        $("#back >img").animate({ "opacity": "50%" }, 500);
        $('#back').css("display", "block");
    }
    function closer() {
        $viewer.animate({ "width": "0%" }, 400);
        $("#back > img").animate({ "opacity": "0%" }, 500);
        $('#back').css("display", "none");
    }
	
	$("#search_btn").click(function(){
        $("#search").toggleClass("on")
    })
	checkToggleClass();
});

function checkToggleClass(){
   var title_text = $(".goods_list_title > h2").text();
   var list_text = $("#nav > #categori > li > a > span");
   var aTags = $("#nav > #categori > li > a");
   var len = $("#nav > #categori > li > a > span").lenth;
   list_text.each(function(index, element){
      var text = $(element).text();
      if(text === title_text){
         aTags.eq(index).toggleClass("on");
      }
   });
   
}

