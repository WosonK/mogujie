from django.db import models


class Base(models.Model):
    img = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    trackid = models.CharField(max_length=20)

    class Meta:
        abstract = True

    def __str__(self):
        return self.name


class Wheel(Base):
    img = models.ImageField(upload_to='lbimg')
    class Meta:
        db_table = 'mgj_wheel'

class Temp(Base):
    img2 = models.CharField(max_length=100, default=None)
    class Meta:
        db_table = 'temp_wheel'


class User(models.Model):
    username = models.CharField(max_length=40, unique=True)
    password = models.CharField(max_length=20)
    email = models.CharField(max_length=100, unique=True)
    tel = models.CharField(max_length=20, unique=True)
    img = models.CharField(max_length=256)