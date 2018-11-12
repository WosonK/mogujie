$(function () {
    // 账号验证
    $('#name input').blur(function () {
        if($(this).val() == '') return

        // 数字、字母
        var reg = /^[A-Za-z0-9]+$/
        if (reg.test($(this).val())) {  // 符合
            // ajax,获取账号是否可用
            $.get('/checkname/', {'account':$(this).val()},function (response) {
                console.log(response)
                if (response.status == 1){  // 可用
                    $('#name i').html('')
                    $('#name').removeClass('has-error').addClass('has-success')
                    $('#name span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
                } else {    // 不可用
                    $('#name i').html(response.msg)
                    $('#name').removeClass('has-success').addClass('has-error')
                    $('#name span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
                }
            })

        } else {    // 不符合
            $('#name i').html('账号由数字、字母组成')
            $('#name').removeClass('has-success').addClass('has-error')
            $('#name span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })


    // 密码验证
    $('#password input').blur(function () {
        if($(this).val() == '') return

        // 数字
        var reg = /^[\d]{6,12}$/
        if (reg.test($(this).val())) {  // 符合
            $('#password i').html('')
            $('#password').removeClass('has-error').addClass('has-success')
            $('#password span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
        } else {    // 不符合
            $('#password i').html('6~12位纯数字')
            $('#password').removeClass('has-success').addClass('has-error')
            $('#password span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })

    // 确认密码
    $('#passwd input').blur(function () {
        if($(this).val() == '') return

        // 数字
        if ($(this).val() == $('#password input').val()) {  // 符合
            $('#passwd i').html('')
            $('#passwd').removeClass('has-error').addClass('has-success')
            $('#passwd span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
        } else {    // 不符合
            $('#passwd i').html('两次密码不一致')
            $('#passwd').removeClass('has-success').addClass('has-error')
            $('#passwd span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })


    // 手机验证
    $('#tel input').blur(function () {
        if($(this).val() == '') return

        // 手机
        var reg = /^1[3|5|7|8|]\d{9}$/
        if (reg.test($(this).val())) {  // 符合
            $('#tel i').html('')
            $('#tel').removeClass('has-error').addClass('has-success')
            $('#tel span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
        } else {    // 不符合
            $('#tel i').html('请输入正确的手机号')
            $('#tel').removeClass('has-success').addClass('has-error')
            $('#tel span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })


    $('#email input').blur(function () {
        if($(this).val() == '') return

        var reg = /^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$/
        if (reg.test($(this).val())) {  // 符合
            $('#email i').html('')
            $('#email').removeClass('has-error').addClass('has-success')
            $('#email span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
        } else {    // 不符合
            $('#email i').html('请输入正确的邮箱')
            $('#email').removeClass('has-success').addClass('has-error')
            $('#email span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })
})