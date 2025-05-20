from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from .models import Event  
import json
import mysql.connector
from db_config import create_connection  # Your custom DB connection method

@csrf_exempt
def add_event(request):
    print("✅ add_event() called")

    if request.method == "POST":
        # capybara
        # event_id = request.POST.get("event_id")
        event_name = request.POST.get("event_name")
        venue = request.POST.get("venue")
        vday = request.POST.get("vday")  # Use safe key name (HTML can't use "vday(s)")
        vstart_time = request.POST.get("vstart_time")
        vend_time = request.POST.get("vend_time")

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                sql = """
                    INSERT INTO events (event_name, venue, vday, vstart_time, vend_time)
                    VALUES (%s, %s, %s, %s, %s)
                """
                cursor.execute(sql, (event_name, venue, vday, vstart_time, vend_time))
                conn.commit()
                return JsonResponse({"success": True})
            except mysql.connector.Error as err:
                return JsonResponse({"success": False, "error": str(err)})
            finally:
                cursor.close()
                conn.close()
        else:
            return JsonResponse({"success": False, "error": "Database connection failed."})
    return JsonResponse({"success": False, "error": "Invalid request"})

@csrf_exempt
def update_event(request):
    if request.method == "POST":
        event_id = request.POST.get("event_id")
        event_name = request.POST.get("event_name")
        venue = request.POST.get("venue")
        vdays = request.POST.get("vday")
        vstart_time = request.POST.get("vstart_time")
        vend_time = request.POST.get("vend_time")

        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                sql = """
                    UPDATE events
                    SET event_name=%s, venue=%s, vday=%s, vstart_time=%s, vend_time=%s
                    WHERE event_id=%s
                """
                cursor.execute(sql, (event_name, venue, vdays, vstart_time, vend_time, event_id))
                conn.commit()
                return JsonResponse({"success": True})
            except mysql.connector.Error as err:
                return JsonResponse({"success": False, "error": str(err)})
            finally:
                cursor.close()
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

@csrf_exempt
def event_calendar(request):
    conn = create_connection()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT vday FROM events")
            events = cursor.fetchall()
            event_dates = [event['vday'].strftime("%Y-%m-%d") for event in events]
            return JsonResponse({"highlighted_dates": event_dates})  # <-- change this key
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)
        finally:
            conn.close()
    return JsonResponse({"error": "DB connection failed"}, status=500)

@csrf_exempt
def fetch_events(request):
    conn = create_connection()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT event_id, event_name, venue, vday, vstart_time, vend_time FROM events")
            events = cursor.fetchall()
            
            # Format dates as strings in 'YYYY-MM-DD' format
            formatted_events = []
            for event in events:
                formatted_event = {
                    'event_id': event['event_id'],
                    'event_name': event['event_name'],
                    'venue': event['venue'],
                    'vday': event['vday'].strftime('%Y-%m-%d'),  # Format date here
                    'vstart_time': str(event['vstart_time']),
                    'vend_time': str(event['vend_time'])
                }
                formatted_events.append(formatted_event)
            
            return JsonResponse(formatted_events, safe=False)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)
        finally:
            conn.close()
    return JsonResponse({"error": "DB connection failed"}, status=500)

from django.http import JsonResponse
from db_config import create_connection
  
# Adjust if your DB connection function is named differently

def test_event_connection(request):
    try:
        conn = create_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM events")  # Replace 'events' with your actual table name
        data = cursor.fetchall()
        return JsonResponse({"connected": True, "event_count": len(data)})
    except Exception as e:
        return JsonResponse({"connected": False, "error": str(e)})
