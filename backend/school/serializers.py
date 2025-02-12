from rest_framework import serializers
from . import models

class SchoolSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.School
        fields = "__all__"
        read_only_fields = ("user",)
        
class ClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Class
        fields = "__all__"
        read_only_fields = ("user",)
        

class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Subject
        fields = "__all__"
        read_only_fields = ("user",)
        
    
class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Teacher
        fields = "__all__"
        read_only_fields = ("user",)

class TeacherSubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.TeacherSubject
        fields = "__all__"
        read_only_fields = ("user",)


class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Student
        fields = "__all__"
        read_only_fields = ("user",)
        
class ResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Result
        fields = "__all__"
        read_only_fields = ("user",)
        

class ParentSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = models.Parent
        fields = "__all__"
        read_only_fields = ("user",)
