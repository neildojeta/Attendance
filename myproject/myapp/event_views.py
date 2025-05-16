import mysql.connector
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from db_config import create_connection  # Your custom DB connection function

@csrf_exempt
def add_event(request):
    if request.method == "POST":
        event_id = request.POST.get("event_id")
        event_name = request.POST.get("event_name")
        venue = request.POST.get("venue")
        days = request.POST.get("days")  # e.g. "Monday, Wednesday"
        start_time = request.POST.get("start_time")
        end_time = request.POST.get("end_time")
        event_date = request.POST.get("event_date")  # Format: YYYY-MM-DD

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                # Insert event into events table (change table/fields accordingly)
                query = """
                    INSERT INTO events (event_id, event_name, venue, days, start_time, end_time, event_date)
                    VALUES (%s, %s, %s, %s, %s, %s, %s)
                """
                cursor.execute(query, (event_id, event_name, venue, days, start_time, end_time, event_date))
                conn.commit()
                return JsonResponse({"success": True})
            except mysql.connector.Error as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
        else:
            return JsonResponse({"success": False, "error": "Database connection failed"})
    else:
        return JsonResponse({"success": False, "error": "Invalid request method"})


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
                query = """
                    UPDATE events
                    SET event_name = %s,
                        venue = %s,
                        days = %s,
                        start_time = %s,
                        end_time = %s,
                        event_date = %s
                    WHERE event_id = %s
                """
                cursor.execute(query, (event_name, venue, days, start_time, end_time, event_date, event_id))
                conn.commit()
                if cursor.rowcount > 0:
                    return JsonResponse({"success": True})
                else:
                    return JsonResponse({"success": False, "error": "Event not found"})
            except mysql.connector.Error as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
        else:
            return JsonResponse({"success": False, "error": "Database connection failed"})
    else:
        return JsonResponse({"success": False, "error": "Invalid request method"})


@csrf_exempt
def delete_event(request, event_id):
    if request.method == "POST":
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                query = "DELETE FROM events WHERE event_id = %s"
                cursor.execute(query, (event_id,))
                conn.commit()
                if cursor.rowcount > 0:
                    return JsonResponse({"success": True})
                else:
                    return JsonResponse({"success": False, "error": "Event not found"})
            except mysql.connector.Error as e:
                return JsonResponse({"success": False, "error": str(e)})
            finally:
                conn.close()
        else:
            return JsonResponse({"success": False, "error": "Database connection failed"})
    else:
        return JsonResponse({"success": False, "error": "Invalid request method"})


def list_events(request):
    # Optional: Add filtering or pagination here
    conn = create_connection()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT * FROM events ORDER BY event_date")
            events = cursor.fetchall()
            return JsonResponse({"success": True, "events": events})
        except mysql.connector.Error as e:
            return JsonResponse({"success": False, "error": str(e)})
        finally:
            conn.close()
    else:
        return JsonResponse({"success": False, "error": "Database connection failed"})
