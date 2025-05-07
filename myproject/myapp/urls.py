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
    path('dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('logout/', views.logout_view, name='logout'),
]