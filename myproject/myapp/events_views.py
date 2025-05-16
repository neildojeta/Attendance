from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from db_config import create_connection  # Your custom DB connection method

@csrf_exempt
def get_events(request):
    conn = create_connection()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT id, event_name, venue, vday, vstart_time, vend_time FROM events")
            rows = cursor.fetchall()
            data = [{
                'id': row['id'],
                'title': row['event_name'],
                'start': f"{row['vday']}T{row['vstart_time']}",
                'end': f"{row['vday']}T{row['vend_time']}",
            } for row in rows]
            return JsonResponse(data, safe=False)
        except Exception as e:
            return JsonResponse({"success": False, "error": str(e)})
        finally:
            conn.close()
    return JsonResponse({"success": False, "error": "DB connection failed"})

@csrf_exempt
def add_event(request):
    if request.method == "POST":
        data = json.loads(request.body)
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    INSERT INTO events (event_name, venue, vday, vstart_time, vend_time)
                    VALUES (%s, %s, %s, %s, %s)
                """, (
                    data['name'],
                    data['venue'],
                    data['vday'],
                    data['vstart_time'],
                    data['vend_time']
                ))
                conn.commit()
                return JsonResponse({'success': True})
            except Exception as e:
                return JsonResponse({'success': False, 'error': str(e)})
            finally:
                conn.close()
    return JsonResponse({'success': False, 'error': 'Invalid request'})

@csrf_exempt
def update_event(request):
    if request.method == "POST":
        data = json.loads(request.body)
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    UPDATE events
                    SET event_name = %s, venue = %s, vday = %s, vstart_time = %s, vend_time = %s
                    WHERE id = %s
                """, (
                    data['name'],
                    data['venue'],
                    data['vday'],
                    data['vstart_time'],
                    data['vend_time'],
                    data['id']
                ))
                conn.commit()
                return JsonResponse({'success': True})
            except Exception as e:
                return JsonResponse({'success': False, 'error': str(e)})
            finally:
                conn.close()
    return JsonResponse({'success': False, 'error': 'Invalid request'})

@csrf_exempt
def delete_event(request):
    if request.method == "POST":
        data = json.loads(request.body)
        conn = create_connection()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("DELETE FROM events WHERE id = %s", (data['id'],))
                conn.commit()
                return JsonResponse({'success': True})
            except Exception as e:
                return JsonResponse({'success': False, 'error': str(e)})
            finally:
                conn.close()
    return JsonResponse({'success': False, 'error': 'Invalid request'})
