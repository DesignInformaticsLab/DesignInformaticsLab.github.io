---
categories: productdesign_tutorial
layout: apd_default
title:  Hookup Guideline for ESP8266 Thing and Blynk
---
# Hookup Guideline for ESP8266 Thing and Blynk

## Introduction

This is a tutorial for people (like me) who have no IoT experience **at all**. We will skip a lot 
of the technical details and focus on moving you from "**Really I can do this?**" to "**Oh that's neat!**". 
This tutorial mostly follow the official [ESP8266 Thing Hookup Guide][1], but tries to explain 
a few (dummy) things.

## Item list

To start, you will need the following items prepared. Note that there are enormous 
hardware/software combinations to get the same thing to work. I will only go through the easiest way.

1. **The SparkFun ESP8266 Thing board**: "The Thing" combines Arduino Uno and ESP8266 Wifi shield so that 
you don't have to purchase separate parts and wire them. However, the shortcoming is that it provides
limited pins.
2. **FTDI Basic -3.3V**: FTDI will be connected to the Thing to physically upload your program to it. Both
boards run at 3.3V.
3. **SparkFun Cerberus USB Cable**: The cable charges the Thing and allows communication between your 
computer and the FTDI.
4. **Jumper Wires and a Breadboard**: You will need them to connect FTDI and other chips/sensors of your 
interest to the Thing.
5. **Arduino stackable header**: I use two of these to connect the Thing to the breadboard. 
6. **Solder**: You will need to wire chips/sensors before you can use them. So prepare to solder.
7. A Android/Apple **smart phone** and a **computer**. 

## Hardware setup
To test the basic functionality, we will use the following hookup.

<img src="/_images/tutorial_iot/hookup1.JPG" alt="Drawing" style="height: 400px;"/>
<img src="/_images/tutorial_iot/hookup2.JPG" alt="Drawing" style="height: 400px;"/>

## Software setup
The following setup should work for both Windows and Linux.

1. Download the [Arduino IDE][2] and install. It's free.
2. Open the Arduino IDE. Install ESP8266 Arduino Addon: 
  * Go to **File > Preference**, type
`http://arduino.esp8266.com/stable/package_esp8266com_index.json`
into the "Additional Board Manager URLs" text box. Hit OK.
  * Then go to **Tools > Boards > Boards Manager**, search "esp8266", and install it.
  * Go to **Tools > Boards**, select "ESP8266 Thing". If you don't see it, close and reopen the IDE.
3. On your smart phone, install "Blynk" and register. It's free.

## Validation
Before you move forward, I strongly recommend you to go through the cases 
from [the official guideline][1] to see
if your setup is all correct.

**Hint**: If you encounter the error: "warning: espcomm_sync failed...", there could be three reasons:

1. Check if the Thing is turned on! The switch is on one corner of the board. You should 
see a red light on once the board is turned on.
2. In the IDE, check **Tools>Port** to see which serial port you are using. 
Remember that both the Thing and the FTDI
are hooked up through USB, the one we should use is the USB Serial Port rather than Communications Port.
To find the right port, go to Device Manager (on Windows, it's under **Control Panel>System and 
Security>System**) and check "**Ports**". See figure below.
<img src="/_images/tutorial_iot/port.png" alt="Drawing" style="height: 400px;"/>
<img src="/_images/tutorial_iot/port2.png" alt="Drawing" style="height: 400px;"/>
<!--![Alt text](/_images/tutorial_iot/port.png)-->
<!--![Alt text](/_images/tutorial_iot/port2.png)-->

3. It could be that your soldering is not well done. 

In addition, sometimes this problem disappears when you re-upload, if your Port is chosen correctly.

## Case study
Now assume that you had fun with those cases, below we go through the simple setup to read from a 
pressure sensor (data from board to phone) and to control the on-board LED (data from phone to board).

### Hardware configuration
The pressure sensor (MPL3115A2) has four pins: "GND" (ground),
"3V3" (3.3V power), SDA (signal - data), and SCL (signal - clock). You need to solder wires to these 
pins, and connect them to the corresponding pins on the Thing. See figure.
<img src="/_images/tutorial_iot/pressure.JPG" alt="Drawing" style="height: 400px;"/>

### Arduino Sketch
In Arduino IDE, open a new sketch, compile and upload the following code:

{% highlight C %}
#define BLYNK_PRINT Serial    // Comment this out to disable prints and save space
#include <Wire.h>
#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>
#include "SparkFunMPL3115A2.h"

// You should get Auth Token in the Blynk App.
// Go to the Project Settings (nut icon).
char auth[] = "***"; // ***Type in your Blynk Token

// Your WiFi credentials.
// Set password to "" for open networks.
char ssid[] = "***"; ***your wifi name
char pass[] = "***"; ***and password

// pressure
MPL3115A2 myPressure;
float pressure = 0;

void setup()
{
  Wire.begin();        // Join i2c bus
  Serial.begin(9600);
  myPressure.begin(); // Get sensor online

  // Configure the sensor
  //myPressure.setModeAltimeter(); // Measure altitude above sea level in meters
  myPressure.setModeBarometer(); // Measure pressure in Pascals from 20 to 110 kPa

  myPressure.setOversampleRate(7); // Set Oversample to the recommended 128
  myPressure.enableEventFlags(); // Enable all three pressure and temp event flags

  Blynk.begin(auth, ssid, pass);
}

void loop()
{
  Blynk.run();
  getPressure();
}

void getPressure()
{
  pressure = myPressure.readPressure();
  tempf = myPressure.readTempF();
  Blynk.virtualWrite(0, tempf);
  Blynk.virtualWrite(1, pressure);
}
{% endhighlight %}

### Blynk setup
In Blynk, create a new project and create the following

* A **button**: Set output of the button to "Digital - GP5", this particular pin correspond to the LED on the Thing board.
 If you look close enough, you can see "5" next to the LED on the board.
* Two **value displays**: Set the inputs to "Virtual - V0" and "Virtual - V1", respectively. If necessary, you can also
come back to fine tune the value range.
<img src="/_images/tutorial_iot/blynkinterface.png" alt="Drawing" style="height: 400px;"/>
<img src="/_images/tutorial_iot/button.png" alt="Drawing" style="height: 400px;"/>
<img src="/_images/tutorial_iot/display.png" alt="Drawing" style="height: 400px;"/>

That's about it! Now turn on the Thing and hit the run button on Blynk. You should be able to (1) see the current room
temprature (give it some time to converge) and the pressure, and (2) turn on the LED by clicking the button in Blynk.

**Hint**: Sometimes the Blynk server can be slow, or even unavailable. You can turn the Thing off and on to get back
wifi connection.


[1]: https://learn.sparkfun.com/tutorials/esp8266-thing-hookup-guide/introduction
[2]: https://www.arduino.cc/en/Main/Software