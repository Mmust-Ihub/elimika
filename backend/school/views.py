from rest_framework import viewsets

from .models import (
    School,
    Class,
    Subject,
    Teacher,
    TeacherSubject,
    Student,
    Result,
    Parent,
)

from .serializers import (
    SchoolSerializer,
    ClassSerializer,
    SubjectSerializer,
    TeacherSerializer,
    TeacherSubjectSerializer,
    StudentSerializer,
    ResultSerializer,
    ParentSerializer,
)


class SchoolViewSet(viewsets.ModelViewSet):
    queryset = School.objects.all()
    serializer_class = SchoolSerializer


class ClassViewSet(viewsets.ModelViewSet):

    queryset = Class.objects.all()
    serializer_class = ClassSerializer


class SubjectViewSet(viewsets.ModelViewSet):

    queryset = Subject.objects.all()
    serializer_class = SubjectSerializer


class TeacherViewSet(viewsets.ModelViewSet):

    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer


class TeacherSubjectViewSet(viewsets.ModelViewSet):

    queryset = TeacherSubject.objects.all()
    serializer_class = TeacherSubjectSerializer


class StudentViewSet(viewsets.ModelViewSet):

    queryset = Student.objects.all()
    serializer_class = StudentSerializer


class ResultViewSet(viewsets.ModelViewSet):

    queryset = Result.objects.all()
    serializer_class = ResultSerializer


class ParentViewSet(viewsets.ModelViewSet):

    queryset = Parent.objects.all()
    serializer_class = ParentSerializer

