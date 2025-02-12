from django.urls import path
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register(r"assignment", views.AssignmentViewSet)
router.register(r"question", views.QuestionViewSet)
router.register(r"student-result", views.StudentResultViewSet)

urlpatterns = router.urls
