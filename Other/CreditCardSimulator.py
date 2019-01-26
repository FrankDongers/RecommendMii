import requests
from tkinter import *
from tkinter.ttk import *

window = Tk()
window.title("Welcome to LikeGeeks app")
window.geometry('350x200')
isloop = 1


#combo = Combobox(window)
#combo['values']= (1, 2, 3, 4, 5, "Text")
#combo.current(1) #set the selected item
#combo.grid(column=2, row=0)

selected = IntVar()
rad1 = Radiobutton(window,text='1204', value=1204, variable=selected)
rad2 = Radiobutton(window,text='1206', value=1206, variable=selected)
rad3 = Radiobutton(window,text='1212', value=1212, variable=selected)
rad4 = Radiobutton(window,text='3101', value=3101, variable=selected)
rad5 = Radiobutton(window,text='3105', value=3105, variable=selected)
def clicked():
   while (isloop == 1):
       
       selectedRoom = input("Which room do you want to book? (1204,1206,1212,3101,3105)")
       selectedDay = input ("Which day? (MM/DD/YYYY) ")
       selectedHour = input("Hour (24 Hour Clock)")
       selectedMinute = input("Minute")

       roomValues = {
           "1204": "3d735cc3-c698-4e89-b6e8-4add6feec7e3",
           "1206": "cf8698cd-0f75-4ac7-accb-87bf9f35d7ac",
           "1212": "f57fa3be-401d-467c-9464-81a867b23a24",
           "3101": "a1d6d445-7560-4dc6-bc1e-86e359973abd",
           "3105": "1ff8e88a-b2bd-490f-8149-251e0d77c7c7"
           }

       selectedRoomKey = (roomValues[selectedRoom])

       dataValues =	{
         "memberLoginId": "2aa55ce2-ac3c-4c8a-a98d-c7df72f81210",
         "roomId": selectedRoomKey,
         "day": selectedDay,
         "hour": selectedHour,
         "minute": selectedMinute,
         "duration": "30"
       }

       print(dataValues)
       r = requests.post("https://apps2.ivey.ca/lti/RoomBooking/Provider/AddRoomBooking", data=dataValues)
       print (r.content)
       print(selected.get())
btn = Button(window, text="Click Me", command=clicked)
rad1.grid(column=0, row=2)
rad2.grid(column=1, row=2)
rad3.grid(column=2, row=2)
rad4.grid(column=3, row=2)
rad5.grid(column=4, row=2)

btn.grid(column=1, row=4)

#lbl = Label(window, text="Hello")
#lbl.grid(column=0, row=0)
def clicked():
    lbl.configure(text="Button was clicked !!")
#btn = Button(window, text="Click Me", command=clicked)
#btn.grid(column=1, row=0)
window.mainloop()
