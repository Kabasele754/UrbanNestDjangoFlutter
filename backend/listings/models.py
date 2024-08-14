from django.db import models
from django.conf import settings

class Listing(models.Model):
    SALE = 'sale'
    RENT = 'rent'
    LISTING_TYPE_CHOICES = [
        (SALE, 'À vendre'),
        (RENT, 'À louer'),
    ]

    title = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    bedrooms = models.IntegerField()
    bathrooms = models.IntegerField()
    area = models.DecimalField(max_digits=10, decimal_places=2)
    address = models.CharField(max_length=200)
    city = models.CharField(max_length=100)
    listing_type = models.CharField(max_length=4, choices=LISTING_TYPE_CHOICES, default=SALE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    owner = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='listings')
    likes = models.ManyToManyField(settings.AUTH_USER_MODEL, related_name='liked_listings', blank=True)

    def __str__(self):
        return self.title

class Review(models.Model):
    listing = models.ForeignKey(Listing, on_delete=models.CASCADE, related_name='reviews')
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    content = models.TextField()
    rating = models.IntegerField(choices=[(i, i) for i in range(1, 6)])
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Review for {self.listing.title} by {self.user.username}"