$(function () {
    $('.loginBtn').on('click', function () {
        temp1 = checkingName()
        temp2 = checkingPassword()
        if ( temp1 && temp2 ){
            $('.login-content form').submit()
        }
    })

    function checkingName() {
        // 数字、字母
        var reg = /^[A-Za-z0-9]+$/
        var nameInput = $('#name input')
        if (reg.test(nameInput.val())) {  // 符合
            $('#name i').html('')
            $('#name').removeClass('has-error').addClass('has-success')
            $('#name span').removeClass('glyphicon-remove').addClass('glyphicon-ok')

            return true
        } else {    // 不符合
            $('#name i').html('账号由数字、字母组成')
            $('#name').removeClass('has-success').addClass('has-error')
            $('#name span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
            return false
        }
    }

    function checkingPassword() {
        // 数字
        var reg = /^[\d]{6,12}$/
        var passwordInput = $('#password input')
        if (reg.test(passwordInput.val())) {  // 符合
            $('#password i').html('')
            $('#password').removeClass('has-error').addClass('has-success')
            $('#password span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
            return true
        } else {    // 不符合
            $('#password i').html('6~12位纯数字')
            $('#password').removeClass('has-success').addClass('has-error')
            $('#password span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
            return false
        }
    }
})