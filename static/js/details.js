$(document).ready(function () {
    //勾选
    $(".small-img li").css({borderColor: "#cfcfcf"});
    $(".small-img li").click(function () {
        $(this).css({borderColor: "red"}).siblings().css({borderColor: "#cfcfcf"});
    })

    $(".minus").click(function () {
        var n = $(".countnum").val();
        if (n <= 1) {
            return;
        }
        var num = parseInt(n) - 1;
        $(".countnum").val(num);
    })
    $(".plus").click(function () {
        var n = $(".countnum").val();
        var i = $(".storenum").html();
        var stonum = parseInt(i);
        var num = parseInt(n) + 1;
        if (num >= stonum) {
            alert("所选商品数量大于库存数量");
            num = stonum;
        }
        ;
        $(".countnum").val(num);
    });

    $(".addtocart").click(function () {
        var goodsid = $(this).attr('goodsid')
        var num = $(".countnum").val()

        $.get('/addtocart/', {'goodsid': goodsid,'num': num}, function (response) {
                console.log(response)

                if (response.status == -1) { // 未登录
                    window.open('/login/', target = "_self")
                }
            }
        )
    })
})