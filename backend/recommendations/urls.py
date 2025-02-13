from django.urls import path,include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register(r"assignment", views.AssignmentViewSet)
router.register(r"question", views.QuestionViewSet)
router.register(r"student-result", views.StudentResultViewSet)

urlpatterns = [
    path("chat-lessons/", views.chat_lessons, name="chat-lessons"),
    path("student-chat/", views.student_chat, name="student-chat"),
    path("career-chat/", views.careerchat, name="career-chat"),
    path("", include(router.urls)),
]

# router.urls
