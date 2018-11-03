from django.shortcuts import render
from App.models import Wheel, Brand, Goods


def index(request):
    wheels = Wheel.objects.all()
    brands1 = Brand.objects.filter(bid__in=[1,2,3,4,5,6,7,8])
    goods = Goods.objects.all()


    data = {
        'wheels': wheels,
        'brands1': brands1,
        'goods': goods,
    }

    return render(request, 'mainPage.html', context=data)


def login(request):
    return render(request, 'login.html')


def register(request):
    return render(request, 'register.html')


def detail(request):
    return render(request, 'productDetail.html')


def shoping(request):
    return render(request, 'shopping.html')


def my(request):
    return render(request, 'my.html')