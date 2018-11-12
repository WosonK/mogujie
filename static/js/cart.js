$(document).ready(function () {
    //二级菜单
    $(".shoppingcar").mouseenter(function () {
        $(".empty_cart").show()
        $(".empty_cart").mouseenter(function () {
            $(this).show();
        });
        $(".empty_cart").mouseleave(function () {
            $(this).hide();
        })
    });
    $(".shoppingcar").mouseleave(function () {
        $(".empty_cart").hide()
    })

    $(".customer_service").mouseenter(function () {
        $(".service_none").show()
        $(".service_none").mouseenter(function () {
            $(this).show();
        });
        $(".service_none").mouseleave(function () {
            $(this).hide();
        })
    });
    $(".customer_service").mouseleave(function () {
        $(".empty_cart").hide()
    })

    $(".xiaodian").mouseenter(function () {
        $(".myxiaodian").show()
        $(".myxiaodian").mouseenter(function () {
            $(this).show();
        });
        $(".myxiaodian").mouseleave(function () {
            $(this).hide();
        })
    });
    $(".xiaodian").mouseleave(function () {
        $(".empty_cart").hide()
    })

    $('input[name="selectall"]').click(function () {
        if ($(this).is(':checked')) {
            $('input[name="check"]').each(function () {
                $(this).prop("checked", true);
            });
        } else {
            $('input[name="check"]').each(function () {
                $(this).removeAttr("checked", false);
            });
        }

    });


    $(".add").click(function () {
        var t = $(this).parent().find('input[class=num]');
        if (t.val() == "" || undefined || null) {
            t.val(0);
        }
        t.val(parseInt(t.val()) + 1)
        setTotal();
    })
    $(".min").click(function () {
        var t = $(this).parent().find('input[class=num]');
        if (t.val() == "" || undefined || null) {
            t.val(0);
        }
        t.val(parseInt(t.val()) - 1)
        if (parseInt(t.val()) < 0) {
            t.val(0);
        }
        setTotal();
    })
    $(".num").keyup(function () {
        var t = $(this).parent().find('input[class=num]');
        if (parseInt(t.val()) == "" || undefined || null || isNaN(t.val())) {
            t.val(0);
        }
        setTotal();
    })

    function setTotal() {
        var s = 0;
        $(".tr #number").each(function () {
            var t = $(this).find('input[class=num]').val();
            var p = $(this).prev().text();
            if (parseInt(t) == "" || undefined || null || isNaN(t) || isNaN(parseInt(t))) {
                t = 0;
            }
            s += parseInt(t) * parseFloat(p);
        });
        //保留小数点后2位，由于数据库已经设置了，这里可以不用toFixed
        $(".totalprice").html(s.toFixed(2));
    }

    setTotal();

})
