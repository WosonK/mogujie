from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, 'mainPage.html')


def login(request):
    return render(request, 'login.html')


def register(request):
    return render(request, 'register.html')


def detail(request):
    return render(request, 'productDetail.html')


def shoping(request):
    return render(request, 'shopping.html')