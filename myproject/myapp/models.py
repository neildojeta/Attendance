from django.db import models

class Event(models.Model):
    event_name = models.CharField(max_length=200)
    venue = models.CharField(max_length=200)
    vday = models.DateField()
    vstart_time = models.TimeField()
    vend_time = models.TimeField()

    def __str__(self):
        return self.event_name