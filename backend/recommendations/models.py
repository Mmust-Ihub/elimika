from django.db import models
from school.models import Teacher, Subject, Student

# psycopg2-binary==2.9.9
class Assignment(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    due_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class Questions(models.Model):
    assignment = models.ForeignKey(Assignment, on_delete=models.CASCADE)
    question = models.TextField()
    marks = models.IntegerField()
    answer = models.TextField()

    def __str__(self):
        return self.question


class StudentResult(models.Model):
    assignment = models.ForeignKey(Assignment, on_delete=models.CASCADE)
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    marks = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.marks
