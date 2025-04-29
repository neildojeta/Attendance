# import tkinter as tk
# from tkinter import ttk
# from db_config import create_connection

# def fetch_data():
#     conn = create_connection()
#     cursor = conn.cursor()
    
#     # Fetch subjects (both idsubjects and subjectcode)
#     cursor.execute("SELECT idsubjects, subjectcode FROM subjects1")
#     subjects_data = cursor.fetchall()
#     subjects_dict = {subjectcode: idsubjects for idsubjects, subjectcode in subjects_data}
#     subject_codes = list(subjects_dict.keys())

#     # Fetch programs
#     cursor.execute("SELECT programcode FROM programs")
#     programs = [row[0] for row in cursor.fetchall()]

#     # Fetch year levels
#     cursor.execute("SELECT yrlvl FROM yearlvl")
#     yearlevels = [row[0] for row in cursor.fetchall()]
    
#     conn.close()
    
#     return subjects_dict, subject_codes, yearlevels, programs

# def save_selection():
#     selected_subject_code = subject_var.get()
#     selected_subject_id = subjects_dict.get(selected_subject_code)  # Get the corresponding idsubjects
#     selected_year = year_var.get()
#     selected_program = program_var.get()
    
#     if not selected_subject_id or not selected_year or not selected_program:
#         status_label.config(text="Please fill in all fields!", fg="red")
#         return
    
#     conn = create_connection()
#     cursor = conn.cursor()
    
#     query = """
#     INSERT INTO subject_assignment (idsubject_assignment, yearlvl, programs)
#     VALUES (%s, %s, %s)
#     """
#     cursor.execute(query, (selected_subject_id, selected_year, selected_program))
#     conn.commit()
#     conn.close()
    
#     status_label.config(text="Data Saved Successfully!", fg="green")

# # Create main window
# root = tk.Tk()
# root.title("Student Attendance Viewer")
# root.geometry("400x250")

# # Fetch data
# subjects_dict, subject_codes, yearlevels, programs = fetch_data()

# # Dropdown variables
# subject_var = tk.StringVar()
# year_var = tk.StringVar()
# program_var = tk.StringVar()

# # Labels and Dropdowns
# tk.Label(root, text="Select Subject Code:").pack()
# subject_dropdown = ttk.Combobox(root, textvariable=subject_var, values=subject_codes)
# subject_dropdown.pack()

# tk.Label(root, text="Select Year Level:").pack()
# year_dropdown = ttk.Combobox(root, textvariable=year_var, values=yearlevels)
# year_dropdown.pack()

# tk.Label(root, text="Select Program Code:").pack()
# program_dropdown = ttk.Combobox(root, textvariable=program_var, values=programs)
# program_dropdown.pack()

# # Save Button
# save_button = tk.Button(root, text="Save", command=save_selection)
# save_button.pack(pady=10)

# # Status Label
# status_label = tk.Label(root, text="", fg="green")
# status_label.pack()

# root.mainloop()
import tkinter as tk
from tkinter import ttk, messagebox
from db_config import create_connection

def fetch_data():
    conn = create_connection()
    cursor = conn.cursor()
    
    # Fetch subjects (both idsubjects and subjectcode)
    cursor.execute("SELECT idsubjects, subjectcode FROM subjects1")
    subjects_data = cursor.fetchall()
    subjects_dict = {subjectcode: idsubjects for idsubjects, subjectcode in subjects_data}
    subject_codes = list(subjects_dict.keys())

    # Fetch programs
    cursor.execute("SELECT programcode FROM programs")
    programs = [row[0] for row in cursor.fetchall()]

    # Fetch year levels
    cursor.execute("SELECT yrlvl FROM yearlvl")
    yearlevels = [row[0] for row in cursor.fetchall()]
    
    conn.close()
    
    return subjects_dict, subject_codes, yearlevels, programs

def save_selection():
    selected_subject_code = subject_var.get()
    selected_subject_id = subjects_dict.get(selected_subject_code)  # Get corresponding idsubjects
    selected_year_idx = year_listbox.curselection()
    selected_programs = [program_listbox.get(i) for i in program_listbox.curselection()]
    
    # Ensure a subject, one year level, and at least one program is selected
    if not selected_subject_id:
        status_label.config(text="Please select a subject!", fg="red")
        return
    
    if not selected_year_idx:
        status_label.config(text="Please select one year level!", fg="red")
        return

    if not selected_programs:
        status_label.config(text="Please select at least one program!", fg="red")
        return

    selected_year = year_listbox.get(selected_year_idx[0])  # Get the single selected year

    conn = create_connection()
    cursor = conn.cursor()

    query = """
    INSERT INTO subject_assignment (idsubject_assignment, yearlvl, programs)
    VALUES (%s, %s, %s)
    """
    
    for program in selected_programs:
        cursor.execute(query, (selected_subject_id, selected_year, program))
    
    conn.commit()
    conn.close()
    
    status_label.config(text="Data Saved Successfully!", fg="green")
    messagebox.showinfo("Success", "Data saved successfully!")

# Create main window
root = tk.Tk()
root.title("Subject Assignment")
root.geometry("400x400")

# Fetch data
subjects_dict, subject_codes, yearlevels, programs = fetch_data()

# Dropdown for subject selection
subject_var = tk.StringVar()
tk.Label(root, text="Select Subject Code:").pack()
subject_dropdown = ttk.Combobox(root, textvariable=subject_var, values=subject_codes)
subject_dropdown.pack()

# Single-selection Listbox for Year Level
tk.Label(root, text="Select Year Level (Only One):").pack()
year_listbox = tk.Listbox(root, selectmode=tk.SINGLE, height=5, exportselection=False)
for year in yearlevels:
    year_listbox.insert(tk.END, year)
year_listbox.pack()

# Multi-selection Listbox for Programs
tk.Label(root, text="Select Programs (Multiple Allowed):").pack()
program_listbox = tk.Listbox(root, selectmode=tk.MULTIPLE, height=5, exportselection=False)
for program in programs:
    program_listbox.insert(tk.END, program)
program_listbox.pack()

# Save Button
save_button = tk.Button(root, text="Save", command=save_selection)
save_button.pack(pady=10)

# Status Label
status_label = tk.Label(root, text="", fg="green")
status_label.pack()

root.mainloop()



