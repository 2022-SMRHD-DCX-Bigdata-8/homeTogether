$(document).ready(function(){
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
    $('#post_btn').on("mouseenter", function (e) {
        $(this).css("background-color", "#F8F8F8");
        $(this).css("color", "#b2b278");
    })
    $('#post_btn').on("mouseleave", function (e) {
        $(this).css("background-color", "#b2b278");
        $(this).css("color", "white");
    })
    //---------------------------------------------------
    
    $("#widthraw").click(function(){
        $("#hidden_line").css("opacity", "100%");
    })
    $("#hidden_line > td > button").click(function(){
        $("#float").css("opacity", "90%");
        $("#float").css("z-index", "1");
    })
    $("#cancle").click(function(){
        $("#float").css("opacity", "0%");
        $("#float").css("z-index", "-1");
    })
    $("#float").click(function(){
        $("#float").css("opacity", "0%");
        $("#float").css("z-index", "-1");
    })
    $("#float > div").click(function(e){
        e.stopPropagation();
    })
    //--------------------------------------------------
    var order_list = $("#email_boxes");
    var review_QnA = $("#review");
    var member_data = $("#login_view");
    $(".listContainer > #order_list").click(function(e){
        order_list.css("display", "none");
        review_QnA.css("display", "none");
        member_data.css("display", "none");
        order_list.css("display", "block");
    })
    $(".listContainer > #review_QnA").click(function(e){
        order_list.css("display", "none");
        review_QnA.css("display", "none");
        member_data.css("display", "none");
        review_QnA.css("display", "block");
    })
    $(".listContainer > #member_data").click(function(e){
        order_list.css("display", "none");
        review_QnA.css("display", "none");
        member_data.css("display", "none");
        member_data.css("display", "block");
    })
})