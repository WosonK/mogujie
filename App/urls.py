from django.conf.urls import url

from App import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^login/$', views.login, name='login'),
    url(r'^register/$', views.register, name='register'),
    url(r'^detail/$', views.detail, name='detail'), # 商品详情页
    url(r'^shopping/$', views.shoping, name='shopping'),  # 购物车+订单+支付+完成
    url(r'^my/$', views.my, name='my'),  #个人中心
]