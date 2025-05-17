from django.db import models

class Event(models.Model):
    event_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    venue = models.CharField(max_length=100)
    day = models.CharField(max_length=50)
    start_time = models.TimeField()
    end_time = models.TimeField()
    event_date = models.DateField()

    def __str__(self):
        return self.name
