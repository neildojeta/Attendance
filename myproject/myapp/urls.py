# from django.urls import path
# from . import views

# # urlpatterns = [
# #     path('', views.home, name='home'),
# # ]
# urlpatterns = [
#     path('', views.admin_login, name='admin_login'),
#     path('', views.admin_dashboard, name='admin_dashboard'),
#     # path("admin_login/", admin_login, name="admin_login"),
# ]

from django.urls import path
from . import views

urlpatterns = [
    path('', views.admin_login, name='admin_login'),
    path('login/', views.login_view, name='login'),
    path('register/', views.register_view, name='register'),
    
    path('logout/', views.logout_view, name='logout'),

    path('dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path("add_student/", views.add_student, name="add_student"),
    path("update_student/", views.update_student, name="update_student"),  # <-- added route
    path('delete_student/<str:student_id>/', views.delete_student, name='delete_student'),
    path('update_approval/<str:username>/<str:status>/', views.update_approval, name='update_approval'),
    path('delete_user/<str:username>/', views.delete_user, name='delete_user'),
]
