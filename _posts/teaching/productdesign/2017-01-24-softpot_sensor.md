---
categories: productdesign_tutorial
layout: apd_default
title: IoT - Softpot Membrane Potentiometer Hookup Guide
published: true
---

# IoT - Softpot membrane potentiometer hookup guide - MAE540-2017 Team 4

## AIM
The aim of the experiment is to explain the application of Softpot Membrane Potentiometer and to provide necessary information for setting up the sensor.

## APPLICATION
A basic potentiometer converts mechanical displacement into electrical energy, and has applications which is suitable for injection molding machines, woodworking machinery, printing, spraying, machine tools, robotics, Dimming of lights, regulating fan speed, engineering, computer-controlled monitoring of sports equipment etc. The main disadvantage of the normal potentiometer is the big size and cost. The potentiometer used here is the **Softpot Membrane potentiometer**. The figure below shows diagram of a Softpot Membrane potentiometer.
<img src="https://ubiquitousmusic.wikispaces.com/file/view/softpotbent.png/381391302/softpotbent.png" alt="Drawing" style="height: 400px;"/>

Refrence https://ubiquitousmusic.wikispaces.com/SoftPot+Membrane+Potentiometer
 
 
Combining the applications of a potentiometer and the advantages like small size, less cost will make the sensor suitable for medical applications where normal sensors will malfunction due to the harsh conditions like radiation.
For more information about the sensor click [here][2].

## INTRODUCTION TO THE SOFTPOT MEMBRANE POTENTIOMETER

1. The SoftPot membrane potentiometer acts as an infinitely variable analog voltage divider. 
2. SoftPot Membrane Potentiometer is a very thin variable potentiometer.
3. We can vary the resistance linearly from 100 ohms to 10,000 ohms by pressing down on the various parts of the strip, allowing the user accurately calculate the relative position on the strip.
4. It consists of three layers: **Top layer with silver shunt, Space layer and Bottom layer with conductive carbon**.
5. Top layer closes the bottom layer when actuated, thus producing a reading. 
6. It be used as an accurate positional indicator for CNC head positioning, variable user input, straight user input and many other applications.

### Features of SoftPot

1. Lower cost than Mechanical Potentiometers
2. Sealed for harsh environments
3. Polyester substrate
4. Low set-up costs with versatility of custom design. 
5. Small [form factor][1].
6. We can combine multiple SoftPot on the same control panel.

### Specifications of SoftPot

1. Mounting Type : Custom
2. Operating Temperature Range : -40C to 50C
3. Resistance tolerance: +/-20%
4. Resistance (ohms) : 10K

## SCHEMATIC OF THE HOOKUP

Below is the Schematic diagram of the circuit which connects the softpot membrane potentiometer to the adruino ESP8266:

<img src="http://bildr.org/blog/wp-content/uploads/2012/11/softpot-Straight-arduino.png"  width="500" height="400"/>

Reference http://bildr.org/2012/11/touch-sliders-with-a-softpot-arduino/

Note that AO for Adriuno UNO is ADC for sparkfun esp8266 thing.

Below is the Softpot membrane potentiometer that we used in the experiment:

<img src="https://i.imgsafe.org/6ea086f44b.jpg" width="300" height="300"/>

There are 3 pins on softpot. Pin 1 which is the one with the arrow refers to ground, pin 2 refers to sensor and pin 3 refers to power. Pin 1 was connected to the ground GND on adruino, pin 2 is connected to ADC, and pin 3 is connected to 3.3v.

Below is the pictures after the connections has been made:

<img src="https://i.imgsafe.org/6e6ee1e6a6.jpg"  width="300" height="300"/>
<img src="https://i.imgsafe.org/6e7261b836.jpg"  width="300" height="300"/>
## Adruino Code and Blynk Setup

Below is the code we put in adruino to get pin 5 to "HIGH".


	  #include <Wire.h>
	  #include <ESP8266WiFi.h>
	  #include <BlynkSimpleEsp8266.h>
	  
	  // You should get Auth Token in the Blynk App.
	  // Go to the Project Settings (nut icon).
	  char auth[] = "87fd9561fc854da99451724d1bde9d40"; 
	  
	  // Your WiFi credentials.
	  // Set password to "" for open networks.
	  char ssid[] = "Fawzan's iPhone"; 
	  char pass[] = "12345678"; 
	  
	  void setup()
	  {
	    Blynk.begin(auth, ssid, pass);
	  }
	  
	  void loop()

	  {
	    Blynk.run();
	  }


  
In Blynk, we created a new widget called "Gauge" and gave input as analog ADC0, this is shown in the pictures below.

<img src="https://i.imgsafe.org/6f2acd8992.png"  width="300" height="500"/>
<img src="https://i.imgsafe.org/6f2ad54359.png"  width="300" height="500"/>

## EXPERIMENT AND DISCUSSION:

Experiment: We did a basic study of various pins in the 'SparkFun ESP8266 Thing board'. There were 3 connections for softpot: pin 1 is ground, pin 2 is sensor (on which the resistance change is measured) pin 3 is power. We connected the ESP8266 on the breadboard and and made the necessary connections to the softpot. The ADC was connected to Pin 2 of softpot and pin 5 on sparkfun connected to pin 3 of softpot via a resistor of 10K ohms. Then the ground was connected to pin1. We used the pin 5 actuation code that was tested in the class. This will act as a power source. We burnt the same code that was tested in class and actuated the button on blynk. Then turned the button on. We used the gauge widget to showcase the sensing and gave a delay of 250 milliseconds on GP4. Then we did the experiment by moving an object on top of the sensor to see the variation in the gauge. The photo describes the variation in object position over the sensor and gauge reading.
Discussion: the sensor worked fine having a liner sensitivity. To understand the sensor more, we experimented with circuit adding resistor in parallel. When no resistor is added, the sensor works in its full range linearly. But if we want to make it active in only first half of the 50mm length we added a 10k ohm and then tested. The result was as expected. The gauge was only working for the first half of the sensor and remaining was on high. And further we added few more resistors in parallel to experiment more. 


[1]: https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=form+factor
[2]: https://www.sparkfun.com/datasheets/Sensors/Flex/SoftPot.pdf