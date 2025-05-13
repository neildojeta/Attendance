# myapp/student_views.py

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from db_config import create_connection

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
        original_id = request.POST.get("original_id")

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
