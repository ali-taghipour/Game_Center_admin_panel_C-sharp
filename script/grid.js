m = [];

//function len() {
//    $.ajax({
//        url: "index.aspx/get_length",
//        data: {},
//        dataType: "json",
//        contentType: "application/json",
//        type: "post",

//        success: function (count) {
//            r = count.d;

           
//        },

//        failure: function () { },
//    });
//}

function all(start, length) {
    $.ajax({
        url: "index.aspx/getAll",
        data: "{st:" + start + ",cu:" + length + "}",
        dataType: "json",
        contentType: "application/json",
        type: "post",

        success: function (res) {
            m = res.d;

            for (i = 0; i < m.length; i++) {
                it = $("<div>").addClass("items");

                h = $("<h2>").html(m[i].name);

                im = $("<img>").attr({ src: "Game pics/" + m[i].pic });

                mas = $("<div>").addClass("mask");

                st = $("<span>").addClass("star").css({ padding: m[i].star * 15 + "px", paddingTop: 11 + "px", paddingBottom: 11 + "px" }).attr("data-num", m[i].star);

                pr = $("<span>").addClass("price").html(m[i].price + " $");

                mas.append(st).append(pr);
                it.append(h).append(im).append(mas);
                $("#grid").append(it);
            }

            $("#grid > .items").on("click", function () {
                $("#pop_up").empty();

                cls = $("<span>").addClass("close").attr("onclick", "close_pop()");

                items = $("<div>").addClass("items");

                ht = $("<h2>").html($("h2", this).html());

                img = $("<img>").attr("src", $("img", this).attr("src"));

                mask = $("<div>").addClass("mask");

                star = $("<span>").addClass("star").css({ padding: $(".star", this).attr("data-num") * 15 + "px", paddingTop: 11 + "px", paddingBottom: 11 + "px" });

                price = $("<span>").addClass("price").html($(".price", this).html());

                flash = $("<span>").addClass("flash");
                flash.attr("onclick", "flas()");

                mask.append(star).append(price);
                items.append(ht).append(img).append(mask).append(flash);
                $("#pop_up").append(cls).append(items);

                $("#holder").css({ display: "block" });
                clearInterval(cc);
                $("#grid").css({ filter: "brightness(10%)", background: "black" });

            });
        },
        failure: function () { },
    });

}

function over() {
    $("#overlay").css("display", "none");
}

$(document).ready(function () {
    all(0, 10);

    var i = 10;
    $(window).scroll(function () {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            $("#overlay").css("display","block");
            $("#scrolling").css({ display: "inline" });
            setTimeout("all(i, 10)", 1000);
            setTimeout("over()",1000);
            i += 10;
        }
    });

    $("#scrolling").click(function () {
        function ss() { $("html,body").animate({ scrollTop:0},"slow"); } 
        ss();
    });
});


color = ["red", "orange", "blue", "pink", "cyan", "green", "yellow", "black","gray"];

var i = 0
function color_changing() {

    grid.style.backgroundColor = color[i];
    i = (i + 1) % color.length;

}

cc = setInterval("color_changing()", 800);


// clearInterval(cc);

var j = 0;

function popColor_changing() {

    pop_up.style.borderColor = color[j];
    j = (j + 1) % color.length;

}

setInterval("popColor_changing()", 800);

var k = 0;
function flas() {
    k = k + 1;
    if (k % 2 != 0) {
        pop_up.querySelector("img").style.filter = "brightness(100%)";
        pop_up.querySelector(".mask").style.filter = "brightness(100%)";
        pop_up.querySelector("h2").style.color = "white";
        pop_up.querySelector(".close").style.filter = "brightness(100%)";
    }
    else {
        pop_up.querySelector("img").style.filter = "brightness(40%)";
        pop_up.querySelector(".mask").style.filter = "brightness(40%)";
        pop_up.querySelector("h2").style.color = "black";
        pop_up.querySelector(".close").style.filter = "brightness(40%)";
    }
}

function close_pop() {
    holder.style.display = "none";
    grid.style.filter = "brightness(100%)";
    cc = setInterval("color_changing()", 800);

    //pop_up.querySelector("img").remove();
    //pop_up.querySelector(".mask").remove();
    //pop_up.querySelector("h2").remove();
    //pop_up.querySelector(".flash").remove();

    k = 0;

    pop_up.querySelector("img").style.filter = "brightness(40%)";
    pop_up.querySelector(".mask").style.filter = "brightness(40%)";
    pop_up.querySelector(".close").style.filter = "brightness(40%)";
    pop_up.querySelector("h2").style.color = "black";
}