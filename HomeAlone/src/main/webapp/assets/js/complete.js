$(document).ready(function () {
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
        $("#back").animate({ "opacity": "50%" }, 500);
        $('#back > img').css("opacity", "50%");
    }
    function closer() {
        $viewer.animate({ "width": "0%" }, 400);
        $("#back").animate({ "opacity": "0%" }, 500);
    }
})