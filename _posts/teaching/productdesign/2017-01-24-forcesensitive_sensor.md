---
categories: productdesign_tutorial
layout: apd_default
title: IoT - Force Sensitive Resistor Hookup Guide
published: true
---

# Force Sensitive Resistor Hookup Guide - MAE540-2017 Team 8
By Samir, Aditya, Hamdan, Arjun, Priyank

#### Item List: This is a list of items required for running the sensor: [Bill of Materials](https://i.imgsafe.org/7033b64637.jpg)

### 1. Application of FSR Sensor : Security System

- We have ideated an application for the FSR sensor, using it as part of a security system for safeguarding valuable items inside a [safe locker](http://i.ebayimg.com/00/s/Nzg4WDcwOA==/z/V50AAOSwt7ZXplI9/$_35.JPG?set_id=880000500F). 

- The idea is to attach the FSR sensor on the handles of the safe locker. So If [anyone](http://us.123rf.com/450wm/dedmazay/dedmazay1602/dedmazay160200070/51877416-cartoon-thief-safecracker-breaks-into-a-safe-vector-illustration.jpg?ver=6) tries to open the safe locker by turning the handle, the sensor would detect the force applied on the handle. When the value of the force applied is above a given value, it would prompt the chip to send an email via blynk to alert the owners.

- The sensitivity of this sensor circuit would be set very high, so that even a slight touch on the handle would activate the circuit to inform the owner that the handle has been touched.

### 2. Introduction to FSR Sensor
- The 0.5" Force Sensitive Resistors are sensors that allow you to detect physical pressure, squeezing and weight.
- The FSR is made of 2 layers separated by a spacer. The more one presses, the more of those Active Element dots touch the semiconductor and that makes the resistance go down.

![Detail drawing of FSR](https://i.imgsafe.org/5b3fc66997.jpg)

- FSRs are basically a resistor that [changes](https://cdn.sparkfun.com/assets/learn_tutorials/5/1/0/fsr-resistance-graph.png) its resistive value (in ohms Ω) depending on how much it is pressed.

- **General FSR Characteristics:**
   1. Diameter:  0.5"
   2. Thickness:  0.018"
   3. Force Range:  100g - 10Kgs
   4. Resistance Range:  200Ohms - 100KOhms

### 3. Schematic of Hookup and Hardware
The following is the setup required for hooking up the FSR Sensor.
- Connect the FTDI chip to the esp8266 thing as follows:

    GND -> GND

    CTS -> NC

    VCC -> 3.3V

    TXO -> RX

    RXI -> TX

    DTR -> DTR

- From one pin of the Force Sensitive Resistor(FSR), say pin A, make a connection to ADC and connect a 10k ohm resistor to GND.
- From pin B of the FSR, make a connection to 3.3V on the input side.

![Schematic Diagram](https://i.imgsafe.org/5ae557e7a7.jpg)

![FTDI Hook up](https://i.imgsafe.org/5b9e77d7cd.jpg)

![Final Set-up](https://i.imgsafe.org/5ba4922549.jpg)


### 4. Arduino Code
<pre>

<font color="#5e6d03">#include</font> <font color="#434f54">&lt;</font><font color="#d35400">Wire</font><font color="#434f54">.</font><font color="#000000">h</font><font color="#434f54">&gt;</font>
<font color="#5e6d03">#include</font> <font color="#434f54">&lt;</font><font color="#d35400">ESP8266WiFi</font><font color="#434f54">.</font><font color="#000000">h</font><font color="#434f54">&gt;</font>
<font color="#5e6d03">#include</font> <font color="#434f54">&lt;</font><font color="#000000">BlynkSimpleEsp8266</font><font color="#434f54">.</font><font color="#000000">h</font><font color="#434f54">&gt;</font>
<font color="#00979c">char</font> <font color="#000000">auth</font><font color="#000000">[</font><font color="#000000">]</font> <font color="#434f54">=</font> <font color="#005c5f">"Blynk Auth Code goes here"</font><font color="#000000">;</font>
<font color="#00979c">char</font> <font color="#000000">ssid</font><font color="#000000">[</font><font color="#000000">]</font> <font color="#434f54">=</font> <font color="#005c5f">"WiFi name"</font><font color="#000000">;</font>
<font color="#00979c">char</font> <font color="#000000">pass</font><font color="#000000">[</font><font color="#000000">]</font> <font color="#434f54">=</font> <font color="#005c5f">"WiFi password"</font><font color="#000000">;</font>

<font color="#00979c">const</font> <font color="#00979c">int</font> <font color="#000000">FSR_PIN</font> <font color="#434f54">=</font> <font color="#000000">A0</font><font color="#000000">;</font> <font color="#434f54">// Pin connected to FSR/resistor divider</font>
<font color="#00979c">const</font> <font color="#00979c">float</font> <font color="#000000">VCC</font> <font color="#434f54">=</font> <font color="#000000">3.28</font><font color="#000000">;</font> <font color="#434f54">// Measured voltage of Sparkfun 3.3v</font>
<font color="#00979c">const</font> <font color="#00979c">float</font> <font color="#000000">R_DIV</font> <font color="#434f54">=</font> <font color="#000000">9788.0</font><font color="#000000">;</font> <font color="#434f54">// Measured resistance of 10k resistor</font>

<font color="#00979c">void</font> <font color="#5e6d03">setup</font><font color="#000000">(</font><font color="#000000">)</font>
<font color="#000000">{</font>
 &nbsp;<b><font color="#d35400">Blynk</font></b><font color="#434f54">.</font><font color="#d35400">begin</font><font color="#000000">(</font><font color="#000000">auth</font><font color="#434f54">,</font> <font color="#000000">ssid</font><font color="#434f54">,</font> <font color="#000000">pass</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;<b><font color="#d35400">Serial</font></b><font color="#434f54">.</font><font color="#d35400">begin</font><font color="#000000">(</font><font color="#000000">9600</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;<font color="#d35400">pinMode</font><font color="#000000">(</font><font color="#000000">FSR_PIN</font><font color="#434f54">,</font> <font color="#00979c">INPUT</font><font color="#000000">)</font><font color="#000000">;</font>
<font color="#000000">}</font>

<font color="#00979c">void</font> <font color="#5e6d03">loop</font><font color="#000000">(</font><font color="#000000">)</font>
<font color="#000000">{</font>
 &nbsp;<font color="#00979c">int</font> <font color="#000000">fsrADC</font> <font color="#434f54">=</font> <font color="#d35400">analogRead</font><font color="#000000">(</font><font color="#000000">FSR_PIN</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;<font color="#434f54">// If the FSR has no pressure, the resistance will be</font>
 &nbsp;<font color="#434f54">// near infinite. So the voltage should be near 0.</font>
 &nbsp;<font color="#5e6d03">if</font> <font color="#000000">(</font><font color="#000000">fsrADC</font> <font color="#434f54">!=</font> <font color="#000000">0</font><font color="#000000">)</font> <font color="#434f54">// If the analog reading is non-zero</font>
 &nbsp;<font color="#000000">{</font>
 &nbsp;&nbsp;&nbsp;<font color="#434f54">// Use ADC reading to calculate voltage:</font>
 &nbsp;&nbsp;&nbsp;<font color="#00979c">float</font> <font color="#000000">fsrV</font> <font color="#434f54">=</font> <font color="#000000">fsrADC</font> <font color="#434f54">*</font> <font color="#000000">VCC</font> <font color="#434f54">/</font> <font color="#000000">1023.0</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<font color="#434f54">// Use voltage and static resistor value to</font>
 &nbsp;&nbsp;&nbsp;<font color="#434f54">// calculate FSR resistance:</font>
 &nbsp;&nbsp;&nbsp;<font color="#00979c">float</font> <font color="#000000">fsrR</font> <font color="#434f54">=</font> <font color="#000000">R_DIV</font> <font color="#434f54">*</font> <font color="#000000">(</font><font color="#000000">VCC</font> <font color="#434f54">/</font> <font color="#000000">fsrV</font> <font color="#434f54">-</font> <font color="#000000">1.0</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<b><font color="#d35400">Serial</font></b><font color="#434f54">.</font><font color="#d35400">println</font><font color="#000000">(</font><font color="#005c5f">"Resistance: "</font> <font color="#434f54">+</font> <font color="#00979c">String</font><font color="#000000">(</font><font color="#000000">fsrR</font><font color="#000000">)</font> <font color="#434f54">+</font> <font color="#005c5f">" ohms"</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<font color="#434f54">// Guesstimate force based on slopes in figure 3 of</font>
 &nbsp;&nbsp;&nbsp;<font color="#434f54">// FSR datasheet:</font>
 &nbsp;&nbsp;&nbsp;<font color="#00979c">float</font> <font color="#000000">force</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<font color="#00979c">float</font> <font color="#000000">fsrG</font> <font color="#434f54">=</font> <font color="#000000">1.0</font> <font color="#434f54">/</font> <font color="#000000">fsrR</font><font color="#000000">;</font> <font color="#434f54">// Calculate conductance</font>
 &nbsp;&nbsp;&nbsp;<font color="#434f54">// Break parabolic curve down into two linear slopes:</font>
 &nbsp;&nbsp;&nbsp;<font color="#5e6d03">if</font> <font color="#000000">(</font><font color="#000000">fsrR</font> <font color="#434f54">&lt;=</font> <font color="#000000">600</font><font color="#000000">)</font>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#000000">force</font> <font color="#434f54">=</font> <font color="#000000">(</font><font color="#000000">fsrG</font> <font color="#434f54">-</font> <font color="#000000">0.00075</font><font color="#000000">)</font> <font color="#434f54">/</font> <font color="#000000">0.00000032639</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<font color="#5e6d03">else</font>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#000000">force</font> <font color="#434f54">=</font> &nbsp;<font color="#000000">fsrG</font> <font color="#434f54">/</font> <font color="#000000">0.000000642857</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<b><font color="#d35400">Serial</font></b><font color="#434f54">.</font><font color="#d35400">println</font><font color="#000000">(</font><font color="#005c5f">"Force: "</font> <font color="#434f54">+</font> <font color="#00979c">String</font><font color="#000000">(</font><font color="#000000">force</font><font color="#000000">)</font> <font color="#434f54">+</font> <font color="#005c5f">" g"</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<b><font color="#d35400">Serial</font></b><font color="#434f54">.</font><font color="#d35400">println</font><font color="#000000">(</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<b><font color="#d35400">Blynk</font></b><font color="#434f54">.</font><font color="#d35400">run</font><font color="#000000">(</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<b><font color="#d35400">Blynk</font></b><font color="#434f54">.</font><font color="#d35400">virtualWrite</font><font color="#000000">(</font><font color="#000000">fsrADC</font><font color="#434f54">,</font> <font color="#000000">force</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<font color="#d35400">delay</font><font color="#000000">(</font><font color="#000000">500</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<font color="#5e6d03">if</font> <font color="#000000">(</font><font color="#000000">force</font> <font color="#434f54">&gt;</font> <font color="#000000">800</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<font color="#000000">{</font>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font color="#d35400">Blynk</font></b><font color="#434f54">.</font><font color="#d35400">email</font><font color="#000000">(</font><font color="#005c5f">"chausamir@gmail.com"</font><font color="#434f54">,</font> <font color="#005c5f">"Security Alert!"</font><font color="#434f54">,</font> <font color="#005c5f">"ATTENTION: Activity near safe locker. Security system has detected imminent threat to valuables. From APDM Team#8"</font><font color="#000000">)</font><font color="#000000">;</font>
 &nbsp;&nbsp;&nbsp;<font color="#000000">}</font>
 &nbsp;<font color="#000000">}</font>
<font color="#000000">}</font>



</pre>

### 5. The Experiment & Result

#### Blynk Setup:

Blynk needs to have widgets added for receiving FSR data, plotting amplitude of force vs. time and then sending an email to the user.

![Blynk Button](https://i.imgsafe.org/705ec7dcb0.png)

![Blynk Guage](https://i.imgsafe.org/7062b737e4.png)

![Blynk History Graph](https://i.imgsafe.org/70652073cb.png)

![Blynk Email](https://i.imgsafe.org/7066ba217c.png)

#### Result of Experiment

- After setting up all the electronics and the Blynk widgets, we tested the force sensor. A force was applied simulating a thief touching the locker, as soon as the force exceeded the threshold limit and an email was sent to the user alerting the theft.

- **At values lower than threshold limit (Force=800): No email was sent.:**

![Blynk Output1](https://i.imgsafe.org/707f726d36.png)

![Blynk Output2](https://i.imgsafe.org/7081f0b178.png)

- **At values higher than the threshold limit: Email is sent to user (Theft alert!):**

![Blynk Output3](https://i.imgsafe.org/70897994fa.png)

![Alert Email](https://i.imgsafe.org/708ba85bf2.jpg)

**The applications of the Force Sensitive Resistor are varied and can be used for several other real-world problems. This security system application can be used by banks, home safe lockers and office lockers.**

### References:
1. [https://www.sparkfun.com/datasheets/Sensors/Pressure/fsrguide.pdf](https://www.sparkfun.com/datasheets/Sensors/Pressure/fsrguide.pdf)
2. [https://www.sparkfun.com/products/9375](https://www.sparkfun.com/products/9375)
3. [https://learn.sparkfun.com/tutorials/force-sensitive-resistor-hookup-guide](https://learn.sparkfun.com/tutorials/force-sensitive-resistor-hookup-guide)
4. [https://cdn-learn.adafruit.com/downloads/pdf/force-sensitive-resistor-fsr.pdf](https://cdn-learn.adafruit.com/downloads/pdf/force-sensitive-resistor-fsr.pdf)
5. [http://fritzing.org/building-circuit/](http://fritzing.org/building-circuit/)


