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
from . import student_views
from . import user_views
from . import faculty_views
from . import event_views
# from . import student_dashboard

urlpatterns = [
    path('', views.admin_login, name='admin_login'),
    path('login/', views.login_view, name='login'),
    path('register/', user_views.register_view, name='register'),
    path('logout/', views.logout_view, name='logout'),
    path('dashboard/', views.admin_dashboard, name='admin_dashboard'),

    # Student-related views
    path("add_student/", student_views.add_student, name="add_student"),
    path("update_student/", student_views.update_student, name="update_student"),
    path('delete_student/<str:student_id>/', student_views.delete_student, name='delete_student'),

    path('update_approval/<str:username>/<str:status>/', user_views.update_approval, name='update_approval'),
    path('delete_user/<str:username>/', user_views.delete_user, name='delete_user'),

    path('add_faculty/', faculty_views.add_faculty, name='add_faculty'),
    path('update_faculty/', faculty_views.update_faculty, name='update_faculty'),
    path('delete_faculty/<str:faculty_id>/', faculty_views.delete_faculty, name='delete_faculty'),

    # Event-related views
    path('add_event/', event_views.add_event, name='add_event'),
    path('update_event/', event_views.update_event, name='update_event'),
    path('delete_event/<str:event_id>/', event_views.delete_event, name='delete_event'),
    path('events/fetch/', event_views.fetch_events, name='fetch_events'),
    # path('list_events/', event_views.get_events, name='list_events'),

    # path("test_route/", event_views.test_route),

    # Student-Dashboard
    path('student_dashboard/', views.student_dashboard, name='student_dashboard'),
    path('logout/', views.logout_view, name='logout'),

    # Faculty-Dashboard
    path('faculty_dashboard/', views.faculty_dashboard, name='faculty_dashboard'),
    path('logout/', views.logout_view, name='logout'),
]
