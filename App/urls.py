from django.conf.urls import url

from App import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'^login/$', views.login),
    url(r'^register/$', views.register),
    url(r'^detail$', views.detail),
    url(r'^shoping$', views.shoping),
]