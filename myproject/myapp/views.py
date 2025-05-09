import mysql.connector
from django.shortcuts import render, redirect
from django.contrib import messages
from db_config import create_connection
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

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


def login_view(request):
    return render(request, 'myapp/login.html')


def admin_dashboard(request):
    if "username" not in request.session:
        return redirect("admin_login")  # Redirect to login if not authenticated

    conn = create_connection()
    register_student_data = []
    student_records_data = []
    programs = []
    yearlvls = []

    search_users = request.GET.get("search_users", "").strip()
    search_students = request.GET.get("search_students", "").strip()

    # Handle the selected tab (students, faculty, etc.)
    tab = request.GET.get('tab', 'students')  # Default to 'students' tab if not provided

    if conn:
        try:
            cursor = conn.cursor()

            if tab == 'students':
                # Filter student_enrollment table (Student Records)
                if search_students:
                    query = """
                        SELECT student_id, studentname, year_level, course 
                        FROM student_enrollment 
                        WHERE studentname LIKE %s 
                        OR student_id LIKE %s 
                        OR year_level LIKE %s 
                        OR course LIKE %s
                    """
                    wildcard = f"%{search_students}%"
                    cursor.execute(query, (wildcard, wildcard, wildcard, wildcard))
                else:
                    cursor.execute("SELECT student_id, studentname, year_level, course FROM student_enrollment")
                student_records_data = cursor.fetchall()

                # Filter users table (Student Approval)
                if search_users:
                    cursor.execute("""
                        SELECT username, password, usertype, approved 
                        FROM users 
                        WHERE usertype NOT IN ('admin', 'faculty') AND username LIKE %s
                    """, ('%' + search_users + '%',))
                else:
                    cursor.execute("""
                        SELECT username, password, usertype, approved 
                        FROM users 
                        WHERE usertype NOT IN ('admin', 'faculty')
                    """)
                register_student_data = cursor.fetchall()

            # elif tab == 'faculty':
                

            # Fetch data for dropdowns (programs and year levels)
            cursor.execute("SELECT programcode FROM programs")
            programs = [row[0] for row in cursor.fetchall()]

            cursor.execute("SELECT yrlvl FROM yearlvl")
            yearlvls = [row[0] for row in cursor.fetchall()]

        finally:
            conn.close()

    return render(request, "myapp/admin_dashboard.html", {
        "register_student_data": register_student_data,
        "student_records_data": student_records_data,
        "search_users": search_users,
        "search_students": search_students,
        "programs": programs,
        "yearlvls": yearlvls,
        "tab": tab,  # Pass the selected tab to the template
    })


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


@csrf_exempt
def add_student(request):
    if request.method == "POST":
        student_id = request.POST.get("student_id")
        studentname = request.POST.get("studentname")
        year_level = request.POST.get("year_level")
        course = request.POST.get("course")

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    INSERT INTO student_enrollment (student_id, studentname, year_level, course)
                    VALUES (%s, %s, %s, %s)
                """, (student_id, studentname, year_level, course))
                conn.commit()
                return JsonResponse({"success": True})
            except Exception as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
    return JsonResponse({"success": False, "error": "Invalid request"})


@csrf_exempt
def update_student(request):
    if request.method == "POST":
        student_id = request.POST.get("student_id")
        studentname = request.POST.get("studentname")
        year_level = request.POST.get("year_level")
        course = request.POST.get("course")
        original_id = request.POST.get("original_id")  # to identify which student to update

        if not original_id:
            return JsonResponse({"success": False, "error": "Missing original student ID"})

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    UPDATE student_enrollment
                    SET student_id = %s, studentname = %s, year_level = %s, course = %s
                    WHERE student_id = %s
                """, (student_id, studentname, year_level, course, original_id))
                conn.commit()
                return JsonResponse({"success": True})
            except Exception as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
    return JsonResponse({"success": False, "error": "Invalid request"})


def delete_student(request, student_id):
    if request.method == "POST":
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("DELETE FROM student_enrollment WHERE student_id = %s", (student_id,))
                conn.commit()
                return JsonResponse({"success": True})
            except Exception as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
    return JsonResponse({"success": False, "error": "Invalid request"})


def logout_view(request):
    request.session.flush()  # Clear session data
    return redirect("admin_login")
