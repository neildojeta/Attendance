from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from db_config import create_connection

def generate_initials(ffirstname, fmidname, flastname):
    def get_initials(name):
        if not name:
            return ''
        parts = name.strip().split()
        return ''.join(part[0] for part in parts if part)
    
    initials = (
        get_initials(ffirstname) +
        get_initials(fmidname) +
        get_initials(flastname)
    )
    return initials.upper()



@csrf_exempt
def add_faculty(request):
    if request.method == "POST":
        faculty_id = request.POST.get("faculty_id")
        flastname = request.POST.get("facultylastname")
        ffirstname = request.POST.get("facultyfirstname")
        fmidname = request.POST.get("facultymidname")

        faculty_initials = generate_initials(ffirstname, fmidname, flastname)

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    INSERT INTO faculty (faculty_id, flastname, ffirstname, fmidname, faculty_initials)
                    VALUES (%s, %s, %s, %s, %s)
                """, (faculty_id, flastname, ffirstname, fmidname, faculty_initials))
                conn.commit()
                return JsonResponse({"success": True})
            except Exception as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
    return JsonResponse({"success": False, "error": "Invalid request"})


@csrf_exempt
def update_faculty(request):
    if request.method == "POST":
        faculty_id = request.POST.get("faculty_id")
        flastname = request.POST.get("facultylastname")
        ffirstname = request.POST.get("facultyfirstname")
        fmidname = request.POST.get("facultymidname")
        original_id = request.POST.get("original_id")

        if not original_id:
            return JsonResponse({"success": False, "error": "Missing original faculty ID"})

        faculty_initials = generate_initials(ffirstname, fmidname, flastname)

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    UPDATE faculty
                    SET faculty_id = %s, flastname = %s, ffirstname = %s, fmidname = %s, faculty_initials = %s
                    WHERE faculty_id = %s
                """, (faculty_id, flastname, ffirstname, fmidname, faculty_initials, original_id))
                conn.commit()
                return JsonResponse({"success": True})
            except Exception as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
    return JsonResponse({"success": False, "error": "Invalid request"})


def delete_faculty(request, faculty_id):
    if request.method == "POST":
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("DELETE FROM faculty WHERE faculty_id = %s", (faculty_id,))
                conn.commit()
                return JsonResponse({"success": True})
            except Exception as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
    return JsonResponse({"success": False, "error": "Invalid request"})
