from django.contrib import admin
from . import models
from django.contrib.auth.forms import UserChangeForm, UserCreationForm

admin.site.site_header = "Elimika Admin"
admin.site.site_title = "Elimika Admin"
admin.site.index_title = "Elimika Admin"


class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = models.User
        fields = "__all__"


class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = models.User
        fields = "__all__"


class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'email', 'firstname', 'lastname', 'type', 'is_staff', 'is_superuser')
    search_fields = ('username', 'email', 'firstname', 'lastname')
    readonly_fields = ('last_login',)
    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()
    # add_form = CustomUserCreationForm
    # form = CustomUserChangeForm


admin.site.register(models.User, UserAdmin)
