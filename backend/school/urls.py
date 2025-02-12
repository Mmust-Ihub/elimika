from django.urls import path
from .views import (
    SchoolViewSet,
    ClassViewSet,
    SubjectViewSet,
    TeacherViewSet,
    TeacherSubjectViewSet,
    StudentViewSet,
    ResultViewSet,
    ParentViewSet,
)

from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register(r'school', SchoolViewSet)
router.register(r'class', ClassViewSet)
router.register(r'subject', SubjectViewSet)
router.register(r'teacher', TeacherViewSet)
router.register(r'teacher-subject', TeacherSubjectViewSet)
router.register(r'student', StudentViewSet)
router.register(r'result', ResultViewSet)
router.register(r'parent', ParentViewSet)

urlpatterns = router.urls
