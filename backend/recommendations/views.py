from rest_framework import viewsets
from rest_framework.request import HttpRequest
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Assignment, Questions, StudentResult
from .serializers import (
    AssignmentSerializer,
    QuestionSerializer,
    StudentResultSerializer,
)

from .utils import chat_lessons as lesson
from .utils import student_chat as stud_chat
from .utils import career_chat as career_chat


class AssignmentViewSet(viewsets.ModelViewSet):
    queryset = Assignment.objects.all()
    serializer_class = AssignmentSerializer


class QuestionViewSet(viewsets.ModelViewSet):
    queryset = Questions.objects.all()
    serializer_class = QuestionSerializer


class StudentResultViewSet(viewsets.ModelViewSet):
    queryset = StudentResult.objects.all()
    serializer_class = StudentResultSerializer


@api_view(["GET"])
def chat_lessons(request):
    text = request.GET.get("text", "start")
    section = lesson.get_response(text)
    return Response({"section": section})


@api_view(["POST"])
def student_chat(request):
    print(request.data)
    text = request.data.get("text", "hello")
    history = request.data.get("history", "hello")
    response = stud_chat.get_response(text, history=history)
    return Response({"response": response})


@api_view(["POST"])
def careerchat(request: HttpRequest):
    user = request.user
    if user.is_anonymous:
        return Response(
            {"error": "You must be logged in to access this resource"}, status=403
        )
    response = career_chat.get_response(user.id)
    return Response({"response": response})
