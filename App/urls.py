from django.conf.urls import url

from App import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^login/$', views.login, name='login'),
    url(r'^register/$', views.register, name='register'),
    url(r'^detail$', views.detail, name='detail'),
    url(r'^shopping$', views.shoping, name='shopping'),
]