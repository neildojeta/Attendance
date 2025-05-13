import mysql.connector
from django.shortcuts import render, redirect
from django.contrib import messages
from db_config import create_connection
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

# from .student_views import add_student, update_student, delete_student 

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

def login_view(request):
    return render(request, 'myapp/login.html')


def admin_dashboard(request):
    if "username" not in request.session:
        return redirect("admin_login")  # Redirect to login if not authenticated

    conn = create_connection()
    register_student_data = []
    student_records_data = []
    faculty_data = []
    programs = []
    yearlvls = []

    search_users = request.GET.get("search_users", "").strip()
    search_students = request.GET.get("search_students", "").strip()
    search_faculty = request.GET.get("search_faculty", "").strip()

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

            elif tab == 'faculty':
                if search_faculty:
                    cursor.execute("""
                        SELECT faculty_id, flastname, ffirstname, fmidname, faculty_initials
                        FROM faculty 
                        WHERE flastname LIKE %s OR ffirstname LIKE %s
                    """, ('%' + search_faculty + '%', '%' + search_faculty + '%'))
                else:
                    cursor.execute("""
                        SELECT faculty_id, flastname, ffirstname, fmidname, faculty_initials
                        FROM faculty
                    """)
                faculty_data = cursor.fetchall()

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
        "faculty_data": faculty_data,
        "search_users": search_users,
        "search_students": search_students,
        "search_faculty": search_faculty,
        "programs": programs,
        "yearlvls": yearlvls,
        "tab": tab,  # Pass the selected tab to the template
    })


def logout_view(request):
    request.session.flush()  # Clear session data
    return redirect("admin_login")
