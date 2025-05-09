from django.urls import path
from . import views

urlpatterns = [
    # Admin login
    path('', views.admin_login, name='admin_login'),
    path('login/', views.login_view, name='login'),
    path('register/', views.register_view, name='register'),
    
    # Admin dashboard
    path('dashboard/', views.admin_dashboard, name='admin_dashboard'),
    
    # Student management
    path('add_student/', views.add_student, name='add_student'),
    path('update_student/', views.update_student, name='update_student'),
    path('delete_student/<str:student_id>/', views.delete_student, name='delete_student'),
    
    # User management
    path('update_approval/<str:username>/<str:status>/', views.update_approval, name='update_approval'),
    path('delete_user/<str:username>/', views.delete_user, name='delete_user'),
    
    # Logout
    path('logout/', views.logout_view, name='logout'),
]
