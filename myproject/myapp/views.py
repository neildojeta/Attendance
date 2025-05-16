import mysql.connector
from django.shortcuts import render, redirect
from django.contrib import messages
from db_config import create_connection
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

# ========== ADMIN VIEWS ==========

def admin_login(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        conn = create_connection()
        if conn:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
            user = cursor.fetchone()
            conn.close()

            if user:
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
        return redirect("admin_login")

    conn = create_connection()
    register_student_data = []
    student_records_data = []
    faculty_data = []
    programs = []
    yearlvls = []

    search_users = request.GET.get("search_users", "").strip()
    search_students = request.GET.get("search_students", "").strip()
    search_faculty = request.GET.get("search_faculty", "").strip()

    tab = request.GET.get('tab', 'students')

    if conn:
        try:
            cursor = conn.cursor()

            if tab == 'students':
                if search_students:
                    query = """
                        SELECT student_id, studentname, year_level, course 
                        FROM student_enrollment 
                        WHERE studentname LIKE %s OR student_id LIKE %s OR year_level LIKE %s OR course LIKE %s
                    """
                    wildcard = f"%{search_students}%"
                    cursor.execute(query, (wildcard, wildcard, wildcard, wildcard))
                else:
                    cursor.execute("SELECT student_id, studentname, year_level, course FROM student_enrollment")
                student_records_data = cursor.fetchall()

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
                    query = """
                        SELECT faculty_id, flastname, ffirstname, fmidname, faculty_initials
                        FROM faculty 
                        WHERE flastname LIKE %s OR ffirstname LIKE %s
                    """
                    wildcard = f"%{search_faculty}%"
                    cursor.execute(query, (wildcard, wildcard))
                else:
                    cursor.execute("""
                        SELECT faculty_id, flastname, ffirstname, fmidname, faculty_initials
                        FROM faculty
                    """)
                faculty_data = cursor.fetchall()

            # Fetch dropdown data
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
        "tab": tab,
    })


def logout_view(request):
    request.session.flush()
    return redirect("admin_login")

# ========== STUDENT DASHBOARD ==========

def student_dashboard(request):
    if "username" not in request.session:
        return redirect("admin_login")
    tab = request.GET.get('tab', '')
    return render(request, "myapp/student_dashboard.html", {"tab": tab})


# ========== EVENT VIEWS ==========

@csrf_exempt
def add_event(request):
    if request.method == "POST":
        event_id = request.POST.get("event_id")
        event_name = request.POST.get("event_name")
        venue = request.POST.get("venue")
        days = request.POST.get("days")
        start_time = request.POST.get("start_time")
        end_time = request.POST.get("end_time")
        event_date = request.POST.get("event_date")

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                sql = """
                    INSERT INTO events (event_id, event_name, venue, days, start_time, end_time, event_date)
                    VALUES (%s, %s, %s, %s, %s, %s, %s)
                """
                cursor.execute(sql, (event_id, event_name, venue, days, start_time, end_time, event_date))
                conn.commit()
                return JsonResponse({"success": True})
            except mysql.connector.Error as err:
                return JsonResponse({"success": False, "error": str(err)})
            finally:
                conn.close()
        else:
            return JsonResponse({"success": False, "error": "Database connection failed."})


@csrf_exempt
def update_event(request):
    if request.method == "POST":
        event_id = request.POST.get("event_id")
        event_name = request.POST.get("event_name")
        venue = request.POST.get("venue")
        days = request.POST.get("days")
        start_time = request.POST.get("start_time")
        end_time = request.POST.get("end_time")
        event_date = request.POST.get("event_date")

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                sql = """
                    UPDATE events
                    SET event_name=%s, venue=%s, days=%s, start_time=%s, end_time=%s, event_date=%s
                    WHERE event_id=%s
                """
                cursor.execute(sql, (event_name, venue, days, start_time, end_time, event_date, event_id))
                conn.commit()
                return JsonResponse({"success": True})
            except mysql.connector.Error as err:
                return JsonResponse({"success": False, "error": str(err)})
            finally:
                conn.close()
        else:
            return JsonResponse({"success": False, "error": "Database connection failed."})


@csrf_exempt
def delete_event(request, event_id):
    if request.method == "POST":
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                sql = "DELETE FROM events WHERE event_id = %s"
                cursor.execute(sql, (event_id,))
                conn.commit()
                return JsonResponse({"success": True})
            except mysql.connector.Error as err:
                return JsonResponse({"success": False, "error": str(err)})
            finally:
                conn.close()
        else:
            return JsonResponse({"success": False, "error": "Database connection failed."})
