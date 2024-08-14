from rest_framework import serializers
from .models import Listing, Review

class ReviewSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source='user.username')

    class Meta:
        model = Review
        fields = ['id', 'user', 'content', 'rating', 'created_at']

class ListingSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')
    reviews = ReviewSerializer(many=True, read_only=True)
    likes_count = serializers.SerializerMethodField()

    class Meta:
        model = Listing
        fields = ['id', 'title', 'description', 'price', 'bedrooms', 'bathrooms', 'area', 'address', 'city', 'listing_type', 'created_at', 'updated_at', 'owner', 'reviews', 'likes_count']

    def get_likes_count(self, obj):
        return obj.likes.count()