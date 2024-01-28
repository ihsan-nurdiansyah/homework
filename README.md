Login Application

This is a simple iOS application written in Swift that demonstrates the implementation of a login feature using the MVVM (Model-View-ViewModel) architecture pattern.
The application allows users to log in using their credentials (email and password). 

Features:
Login functionality with email and password fields.
Data validation for the login credentials.
Simple MVVM architecture implementation.

Requirements:
Xcode 13.0 or later
Swift 5.0 or later
iOS 13.0 or later

Installation:
Clone or download the repository.
Open the project in Xcode.
Running pod install on terminal
Build and run the application on a simulator or a physical device.

Usage:  
Launch the application on your iOS device or simulator.
Enter valid credentials in the provided email and password fields.
Tap on the "Login" button.
If the credentials are valid, you will be logged in. Otherwise, an error message will be displayed.
Tap the 'exit' icon to logout.

MVVM Architecture:
The application is structured according to the MVVM (Model-View-ViewModel) architecture pattern:
Model: Represents the data and business logic of the application. In this application, the model includes the user credentials and authentication logic.
View: Represents the user interface components of the application. It displays the data to the user and sends user actions to the ViewModel.
ViewModel: Acts as an intermediary between the View and the Model. It fetches data from the Model and prepares it for display in the View. It also handles user interactions from the View and performs necessary actions.

Screenshot:

<img width="300" alt="Screenshot 2024-01-28 at 23 13 37" src="https://github.com/ihsan-nurdiansyah/homework/assets/3762214/e9230477-e98b-4dbd-97c8-1040965ae64a">
<img width="300" alt="Screenshot 2024-01-28 at 23 13 39" src="https://github.com/ihsan-nurdiansyah/homework/assets/3762214/a6c82f57-c5cd-4858-9d27-ae4588b187c1">
<img width="300" alt="Screenshot 2024-01-28 at 23 13 43" src="https://github.com/ihsan-nurdiansyah/homework/assets/3762214/2f5c8285-e979-41e3-9058-6cdbf23541ad">
<img width="300" alt="Screenshot 2024-01-28 at 23 14 07" src="https://github.com/ihsan-nurdiansyah/homework/assets/3762214/9d5b916d-5d97-4c05-b717-6a374b88d9c7">
<img width="300" alt="Screenshot 2024-01-28 at 23 14 12" src="https://github.com/ihsan-nurdiansyah/homework/assets/3762214/6e83cf72-c62d-4cb6-81bc-05e0ed0e4084">



