from rest_framework import serializers
from . import models

class AssignmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Assignment
        fields = "__all__"
        read_only_fields = ("user",)
        
class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Questions
        fields = "__all__"
        read_only_fields = ("user",)
        

class StudentResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.StudentResult
        fields = "__all__"
        read_only_fields = ("user",)