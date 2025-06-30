import tkinter as tk
from tkinter import ttk

class App(tk.Tk):
    def __init__(self):
        self.title = "Pharma Questions"
        self.geometry = "600x400"
        self.create_buttons()
    def create_buttons(self):
        self.label = ttk.Label(self, text='Lipitor')
        self.label.pack(pady="5")
        