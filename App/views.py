import hashlib
import random
import time
import uuid

from django.http import JsonResponse
from django.shortcuts import render, redirect
from App.models import Wheel, Brand, Goods, User, Cart, Order, OrderGoods


def index(request):
    #
    token = request.session.get('token')

    wheels = Wheel.objects.all()
    brands1 = Brand.objects.filter(bid__in=[1, 2, 3, 4, 5, 6, 7, 8])
    goods = Goods.objects.all()

    data = {
        'wheels': wheels,
        'brands1': brands1,
        'goods': goods,
    }

    if token:  # 登录
        user = User.objects.get(token=token)
        data['name'] = user.name
        data['isLogin'] = 1

    elif request.session.get('name'):# 未登录,14天内保持登录
        data['name'] = request.session.get('name')
    elif not request.session.get('name'):# 未登录,logout
        data['name'] = '未登录'

    return render(request, 'mainPage.html', context=data)


def genarate_password(param):
    sha = hashlib.sha256()
    sha.update(param.encode('utf-8'))
    return sha.hexdigest()


def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    elif request.method == 'POST':
        name = request.POST.get('name')
        password = request.POST.get('password')

        try:
            user = User.objects.get(name=name)
            if user.password == genarate_password(password):  # 登录成功
                print(password)
                user.token = str(uuid.uuid5(uuid.uuid4(), 'login'))
                user.save()
                request.session['token'] = user.token
                return redirect('app:index')
            else:
                return render(request, 'login.html', context={'passwdErr': '密码错误!'})
        except:
            return render(request, 'login.html', context={'acountErr': '账号不存在!'})


def register(request):
    if request.method == 'GET':
        return render(request, 'register.html')
    elif request.method == 'POST':
        user = User()

        user.name = request.POST.get('name')
        user.password = genarate_password(request.POST.get('password'))
        user.email = request.POST.get('email')
        user.tel = request.POST.get('tel')
        user.token = str(uuid.uuid5(uuid.uuid4(), 'register'))

        user.save()

        request.session['token'] = user.token

        return redirect('app:index')


def logout(request):
    request.session.flush()
    return redirect('app:index')


def checkname(request):
    name = request.GET.get('name')

    responseData = {
        'status': 1  # 1标识可用，-1标识不可用
    }

    try:
        user = User.objects.get(name=name)
        responseData['msg'] = '账号已被占用'
        responseData['status'] = -1
        return JsonResponse(responseData)
    except:
        return JsonResponse(responseData)


def detail(request, trackid):
    token = request.session.get('token')

    temp = Goods.objects.filter(trackid=trackid)
    exact = temp[0]

    id = exact.id
    smallImg = exact.smallImg
    name = exact.name
    price = exact.price
    oldprice = exact.oldprice
    sales = exact.sales
    store = exact.store
    bg = exact.bg

    data = {
        'id': id,
        'smallImg': smallImg,
        'price': price,
        'oldprice': oldprice,
        'sales': sales,
        'store': store,
        'bg': bg,
    }

    if token:  # 登录
        user = User.objects.get(token=token)
        data['name'] = user.name
        data['isLogin'] = 1
    else:
        pass

    return render(request, 'productDetail.html', context=data)


def shoping(request):
    token = request.session.get('token')

    data = {}

    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user).exclude(number=0)
        data['carts'] = carts
        data['name'] = user.name
        return render(request, 'shopping.html', context=data)
    else:
        return redirect('app:login')


def addtocart(request):
    goodsid = request.GET.get('goodsid')
    num = request.GET.get('num')
    token = request.session.get('token')

    responseData = {
        'status': 1
    }

    if token:
        user = User.objects.get(token=token)
        goods = Goods.objects.get(pk=goodsid)

        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
            cart = carts.first()
            cart.number = cart.number + num
            cart.save()
            responseData['number'] = cart.number
        else:
            cart = Cart()
            cart.user = user
            cart.goods = goods
            cart.number = num
            cart.save()

            responseData['number'] = cart.number

        return JsonResponse(responseData)
    else:
        responseData['status'] = -1
        return JsonResponse(responseData)


def changecartstatus(request):
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()

    responseData = {
        'status': 1,
        'isselect': cart.isselect
    }

    return JsonResponse(responseData)


def changecartselect(request):
    isselected = request.GET.get('isselected')
    if isselected == 'true':
        isselected = True
    else:
        isselected = False

    token = request.session.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user)
    for cart in carts:
        cart.isselected = isselected
        cart.save()

    return JsonResponse({'msg': '反选操作成功', 'status': 1})


def order(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    order = Order()
    order.user = user
    order.identifier = str(int(time.time())) + str(random.randrange(10000,100000))
    order.save()

    carts = Cart.objects.filter(user=user)
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.number = cart.number
        orderGoods.save()

        cart.delete()

    ident = order.identifier

    return redirect('app:orderinfo', ident)



def orderinfo(request, identifier):
    order = Order.objects.get(identifier=identifier)
    token = request.session.get('token')

    user = User.objects.get(token=token)
    name = user.name

    return render(request, 'orderinfo.html', context={'order':order,'name':name,})


def myorders(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)


    orders = Order.objects.filter(user_id=user.id)
    token = request.session.get('token')

    if token:
        user = User.objects.get(token=token)
        name = user.name
    else:
        return redirect('app:login')


    return render(request, 'myorders.html', context={'orders':orders,'name':name,})