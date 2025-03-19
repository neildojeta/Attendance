from django.shortcuts import render
from django.http import HttpResponse

def home(request):
    # return HttpResponse("Welcome to My Django App!")
    return render(request, 'myapp/home.html')

# Create your views here.
