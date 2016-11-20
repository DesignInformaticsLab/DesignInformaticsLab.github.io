---
categories: productdesign_tutorial
layout: apd_default
title:  Internet of Things Hookup Guideline 1: ESP8266 Thing + Blynk for Dummies 
---

* Introduction
This is a tutorial for people (like me) who have no experience at all at IoT. We will skip a lot 
of the technical details and focus on moving you from "What is IoT?" to "Oh that's neat!". 
This tutorial mostly follow the official one [ESP8266 Thing Hookup Guide], but tries to explain 
a few things skipped.

* Item list
To start, you will need the following items prepared. Note that there are enormous 
hardware/software combinations to get the same thing to work. I will only go through the easiest way.
1. [The SparkFun ESP8266 Thing board]: "The Thing" combines Arduino Uno and ESP8266 Wifi shield so that 
you don't have to purchase separate parts and wire them. However, the shortcoming is that it provides
limited ports (one I^2C and one analog, we will mention these later).
2. [FTDI Basic -3.3V]: FTDI will be connected to the Thing to physically upload your program to it. Both
boards run at 3.3V.
3. [SparkFun Cerberus USB Cable]: The cable charges the Thing and allows communication between your 
computer and the FTDI.
4. Jumper Wires and a Breadboard: You will need them to connect FTDI and other chips/sensors of your 
interest to the Thing.
5. Arduino stackable header: I use two of these to connect the Thing to the breadboard. 
6. Solder: You will need to wire chips/sensors before you can use them. So prepare to solder.
7. A Android/Apple smart phone and a computer. 

* Hardware setup
To test the basic functionality, we will use the following hookup.

* Software setup
The following setup should work for both Windows and Linux.
1. Download the [Arduino IDE] and install. It's free.
2. Open the Arduino IDE. Install ESP8266 Arduino Addon: 
2.1 Go to File > Preference, type the following
http://arduino.esp8266.com/stable/package_esp8266com_index.json
into the "Additional Board Manager URLs" text box. Hit OK.
2.2 Then go to Tools > Boards > Boards Manager, search "esp8266", and install it.
2.3 Go to Tools > Boards, select "ESP8266 Thing". If you don't see it, close and reopen the IDE.
3. On your smart phone, install "Blynk" and register. It's free.

* Case study
Before you move forward, please go through the cases from [ESP8266 Thing Hookup Guide] to see
if your setup is all correct.

**Hint**: If you encounter the error: "warning: espcomm_sync failed...", there could be two reasons: 
First, check Tools>Port to see which serial port you are using. Remember that both the Thing and the FTDI
are hooked up through USB, the one we should use is the USB Serial Port rather than Communications Port.
To find the right port, go to Device Manager (on Windows, it's under Control Panel>System and 
Security>System) and check "Ports". See figure below. The second reason could be that your soldering is
not done well. Sometimes this problem disappears when you re-upload, if your Port is chosen correctly.

Now assume that you had fun with those cases, below we go through the simple setup to read from a 
pressure sensor (data from board to phone) and to control the on-board LED (data from phone to board).

** Hardware configuration
The pressure sensor we use (MPL3115A2) is a I^2C device: The four pins useful to us are "GND" (ground),
"3V3" (3.3V power), SDA (signal - data), and SCL (signal - clock). You need to solder wires to these 
pins, and connect them to the corresponding pins on the Thing. See figure.

** Coding and testing


[ESP8266 Thing Hookup Guide] https://learn.sparkfun.com/tutorials/esp8266-thing-hookup-guide/introduction
[Arduino IDE] https://www.arduino.cc/en/Main/Software