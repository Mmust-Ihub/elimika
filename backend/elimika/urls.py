from django.contrib import admin
from django.urls import path
from django.urls.conf import include


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/auth/', include('dj_rest_auth.urls')),
    path('api/v1/auth/register/', include("dj_rest_auth.registration.urls")),
]
