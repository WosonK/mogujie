from django.conf.urls import url

from App import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^login/$', views.login, name='login'),
    url(r'^register/$', views.register, name='register'),
    url(r'^detail/(\d+)/$', views.detail, name='detail'), # 商品详情页
    url(r'^shopping/$', views.shoping, name='shopping'),  # 购物车+订单+支付+完成
    url(r'^checkname/$', views.checkname, name='checkname'),
    url(r'^logout/$', views.logout, name='logout'),

    url(r'^addtocart/$', views.addtocart, name='addcart'),
    url(r'^changecartstatus/$', views.changecartstatus, name='changecartstatus'),
    url(r'^changecartselect/$', views.changecartselect, name='changecartselect'),

    url(r'^order/$', views.order, name='order'),
    url(r'^myorders/$', views.myorders, name='myorders'),
    url(r'^orderinfo/(\d+)/$', views.orderinfo, name='orderinfo'),
]