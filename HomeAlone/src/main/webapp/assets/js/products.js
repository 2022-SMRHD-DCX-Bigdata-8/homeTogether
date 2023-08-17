$(document).ready(function () {
    $("#categori>li>a").on("mouseenter", function (e) {
        $(this).css("color", "#b2b278");
    });

    $("#categori>li>a").on("mouseleave", function (e) {
        $(this).css("color", "black");
    });

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

})