import requests
from tkinter import *
from tkinter.ttk import *

window = Tk()
window.title("Simulation of Credit Card System")
window.geometry('350x200')
isloop = 1

Label(window, text="Credit Card #").grid(row=0)
Label(window, text="Amount to charge").grid(row=1)

e1 = Entry(window)
e2 = Entry(window)

e1.grid(row=0, column=1)
e2.grid(row=1, column=1)

def clicked():
    tempText = "{ \"id\": \"" + e1.get() + "\", \"value\": \"" + e2.get() +"\" }"
    print (tempText)
    r = requests.post("https://recommendmii-343b5.firebaseio.com/transactions.json", tempText)
    print (r.content)
    e1.delete(0, END)
    e2.delete(0, END)

btn = Button(window, text="Log Transaction", command=clicked)
btn.grid(column=1, row=4)
    
window.mainloop()
