# Mobile Applications I Project 4
# Simple Clock Application

## Description

This project is a simple clock application developed in Xcode using Swift. It incorporates concepts learned in Module 4, focusing on displaying a live clock, implementing a countdown timer, and integrating multimedia functionalities.

## Features

### Live Clock
The application displays a live clock in the format: Wed, 28 Dec 2022 14:59:00.
The background image changes based on the time (AM or PM), providing visual cues to the user.

### Countdown Timer
Users can set a countdown timer using a UIDatePicker to select hours and minutes.
The timer starts when the user clicks the "Start Timer" button.
The remaining time is displayed on label2 in the format: 00:10:15.

### Music Playback
Once the timer ends, a selected music (5-10 seconds) starts playing.
The button text changes to "Stop Music".
Users can stop the music by clicking the button, which then changes back to "Start Timer" to allow setting a new timer.

## Requirements

The application is designed to run for all size classes, including iPads, and supports landscape orientation.

## Usage

### To use the clock application:

Open the application on your iOS device or simulator.
The live clock will be displayed on label1, and the background image will change according to the time of day (AM or PM).
Use the UIDatePicker to set the countdown timer by selecting hours and minutes.
Click the "Start Timer" button to start the countdown.
Once the timer ends, the selected music will play, and the button text will change to "Stop Music".
Click the button to stop the music and reset the timer for setting a new countdown.

## Implementation Details

Clone or download the project from the provided GitHub repository.
Open the project in Xcode to explore the implementation of live clock display, countdown timer functionality, background image changes, and music playback.
Examine the use of constraints and size classes to ensure the application runs smoothly on all device sizes and orientations.
