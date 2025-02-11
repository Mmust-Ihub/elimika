from django.contrib import admin
from . import models


class SchoolAdmin(admin.ModelAdmin):
    list_display = ("name", "address", "phone", "email")
    search_fields = ("name", "address", "phone", "email")
    readonly_fields = ()
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


class ParentAdmin(admin.ModelAdmin):
    list_display = ("parent", "phone", "student")
    search_fields = ("parent", "phone", "student")
    readonly_fields = ()
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


class ClassAdmin(admin.ModelAdmin):
    list_display = ("name", "school")
    search_fields = ("name", "school")
    readonly_fields = ()
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


class SubjectAdmin(admin.ModelAdmin):
    list_display = ("name", "classes")
    search_fields = ("name", "classes")
    readonly_fields = ()
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


class TeacherAdmin(admin.ModelAdmin):
    list_display = ("teacher", "phone", "school", "subject")
    search_fields = ("teacher", "phone", "school", "subject")
    readonly_fields = ()
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


class TeacherSubjectAdmin(admin.ModelAdmin):
    list_display = ("teacher", "subject")
    search_fields = ("teacher", "subject")
    readonly_fields = ()
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


class StudentAdmin(admin.ModelAdmin):
    list_display = ("student", "phone", "date_of_birth", "school")
    search_fields = ("student", "phone", "date_of_birth", "school")
    readonly_fields = ()
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


class ResultAdmin(admin.ModelAdmin):
    list_display = ("student", "subject", "marks")
    search_fields = ("student", "subject", "marks")
    readonly_fields = ()
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()


admin.site.register(models.School, SchoolAdmin)
admin.site.register(models.Parent, ParentAdmin)
admin.site.register(models.Class, ClassAdmin)
admin.site.register(models.Subject, SubjectAdmin)
admin.site.register(models.Teacher, TeacherAdmin)
admin.site.register(models.TeacherSubject, TeacherSubjectAdmin)
admin.site.register(models.Student, StudentAdmin)
admin.site.register(models.Result, ResultAdmin)
