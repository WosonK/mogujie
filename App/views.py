from django.shortcuts import render

# Create your views here.
from App.models import Wheel, Temp


def temp(request):
    temps = Temp.objects.all()

    data = {
        'temps':temps,
    }

    return render(request, 'temp.html', context=data)



def index(request):
    wheels = Wheel.objects.all()

    data = {

        'wheels':wheels,
        # 'navs':navs,
        # 'mustbuys':mustbuys,
        # 'shophead':shophead,
        # 'shoptab':shoptab,
        # 'shopclass':shopclass,
        # 'shopcommend':shopcommend,
        # 'mainshows': mainshows
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


def order(request):
    return None


def my(request):
    return render(request, 'my.html')