from django.shortcuts import render, redirect
from django.contrib import messages
from django.http import JsonResponse
from db_config import create_connection

def register_view(request):
    if request.method == "POST":
        email = request.POST.get("email")
        password = request.POST.get("password")
        confirm_password = request.POST.get("confirm_password")

        if password != confirm_password:
            messages.error(request, "Passwords do not match.")
            return render(request, 'myapp/register.html')

        conn = create_connection()
        if conn:
            cursor = conn.cursor()
            try:
                cursor.execute("INSERT INTO users (username, password) VALUES (%s, %s)", (email, password))
                conn.commit()
                messages.success(request, "Registration successful. Redirecting to login...")
                return render(request, 'myapp/register.html', {'redirect_after_success': True})
            except Exception as e:
                messages.error(request, f"Registration failed: {str(e)}")
            finally:
                conn.close()
        else:
            messages.error(request, "Database connection failed.")

    return render(request, 'myapp/register.html')


def update_approval(request, username, status):
    if request.method == "POST":
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("UPDATE users SET approved = %s WHERE username = %s", (status, username))
                conn.commit()
                return JsonResponse({"success": True})
            except Exception as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
    return JsonResponse({"success": False, "error": "Invalid request"})


def delete_user(request, username):
    if request.method == "POST":
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("DELETE FROM users WHERE username = %s", (username,))
                conn.commit()
                return JsonResponse({"success": True})
            except Exception as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
    return JsonResponse({"success": False, "error": "Invalid request"})
