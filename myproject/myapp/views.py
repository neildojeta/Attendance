# # from django.shortcuts import render
# # from django.http import HttpResponse

# # def home(request):
# #     # return HttpResponse("Welcome to My Django App!")
# #     return render(request, 'myapp/home1.html')
# from django.shortcuts import render, redirect
# from django.contrib.auth import authenticate, login
# from django.contrib.auth.decorators import login_required
# from django.contrib import messages

# def admin_login(request):
#     if request.method == "POST":
#         username = request.POST.get("username")
#         password = request.POST.get("password")
#         user = authenticate(request, username=username, password=password)

#         if user is not None:
#             if user.is_staff:  # Check if the user is an admin/staff
#                 login(request, user)
#                 return redirect("admin_dashboard")  # Redirect to admin dashboard
#             else:
#                 messages.error(request, "Access denied. Admins only.")
#         else:
#             messages.error(request, "Invalid username or password.")
    
#     return render(request, "myapp/home1.html")  # Reload the login page with error messages

# @login_required
# def admin_dashboard(request):
#     return render(request, "myapp/admin_dashboard.html")


# # Create your views here.


import mysql.connector
from django.shortcuts import render, redirect
from django.contrib import messages
from db_config import create_connection

def admin_login(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        # Connect to MySQL
        conn = create_connection()
        if conn:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
            user = cursor.fetchone()
            conn.close()

            if user:
                # Store session data
                request.session["username"] = user["username"]
                return redirect("admin_dashboard")
            else:
                messages.error(request, "Invalid username or password.")
        else:
            messages.error(request, "Database connection failed.")

    return render(request, "myapp/home1.html")

def register_view(request):
    # return redirect("register")
    return render(request, 'myapp/register.html')

def admin_dashboard(request):
    if "username" not in request.session:
        return redirect("admin_login")  # Redirect to login if not authenticated
    return render(request, "myapp/admin_dashboard.html")

def logout_view(request):
    request.session.flush()  # Clear session data
    return redirect("admin_login")
