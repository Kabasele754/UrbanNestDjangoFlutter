from django.urls import path, include

urlpatterns = [
    # You can add any additional API routes here
    # For now, we'll just include the routes from our apps
    path('', include('listings.urls')),
    path('', include('users.urls')),
]