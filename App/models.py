from django.db import models

class Wheel(models.Model):
    img = models.ImageField(upload_to='lbimg')
    name = models.CharField(max_length=100)
    trackid = models.IntegerField()

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'wheelimg'

class Brand(models.Model):
    bid = models.IntegerField()
    img = models.ImageField(upload_to='brandimg')
    title = models.CharField(max_length=100, default=None)
    desciption = models.CharField(max_length=100, default=None)
    trackid = models.IntegerField()

    class Meta:
        db_table = 'brandimg'

    def __str__(self):
        return self.title

class Goods(models.Model):
    gid = models.IntegerField()
    img = models.ImageField(upload_to='goodsimg')
    smallImg = models.ImageField(upload_to='smallImg')
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=7, decimal_places=2)
    oldprice = models.DecimalField(max_digits=7, decimal_places=2)
    sales = models.IntegerField()
    store = models.IntegerField()
    bg = models.ImageField(upload_to='bg')
    trackid = models.IntegerField()

    class Meta:
        db_table = 'goods'

    def __str__(self):
        return self.name

class User(models.Model):
    name = models.CharField(max_length=40, unique=True)
    password = models.CharField(max_length=80)
    email = models.CharField(max_length=100, unique=True)
    tel = models.CharField(max_length=20, unique=True)
    # img = models.CharField(max_length=256)
    token = models.CharField(max_length=256, default='')


    def __str__(self):
        return self.name

    class Meta:
        db_table = 'user'

class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Goods)
    number = models.IntegerField()
    isselected = models.BooleanField(default=True)

    # def __str__(self):
    #     return self.

    class Meta:
        db_table = 'cart'


class Order(models.Model):
    user = models.ForeignKey(User)
    createtime = models.DateTimeField(auto_now_add=True)
    status = models.IntegerField(default=1)
    identifier = models.CharField(max_length=256)

    class Meta:
        db_table = 'order'

class OrderGoods(models.Model):
    order = models.ForeignKey(Order)
    goods = models.ForeignKey(Goods)
    number = models.IntegerField(default=1)

    class Meta:
        db_table = 'ordergoods'