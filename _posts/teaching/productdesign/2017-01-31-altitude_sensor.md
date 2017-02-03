---
categories: productdesign_tutorial
layout: apd_default
title: IoT - Altitude and Pressure Sensor Hookup Guide
published: true
---

# IoT - Altitude and pressure sensor hookup guide - MAE540-2017 Team 9 
By Surya Prakash Reddy Dasari, Kevin Espinoza, Nikhil Sunil Kadway, Satya Pattela, Xinyu Wang

## Introduction
The purpose of this experiment is to introduce an altitude/pressure sensor. This report will include a schematic of the hookup, Arduino code, and all related installation guide. In addition, the report will include a discussion of how the experiment functioned, and new knowledge of the sensor.

1. **A narrative of the application**
2. **An introduction to the sensor**
3. **A schematic of the hookup**
4. **The Arduino code and related installation guide of  necessary packages**
5. **The experiment and discussion**

## Narrative of the Application

Aerospace major wildly uses the accurate barometric pressure sensors such as MPL3115A2
pressure sensor; ambient pressure and temperature are basic parameters in most aerospace
applications. For example, a classic aerospace experiment always sets pressure gauges before and
after the test section to analyze the flow of state change around the model. Typically, a wind
tunnel creates the flow. The advantage of the MPL3115A2 sensor is that it can measure the
pressure and temperature at the same time. Hence, the idea gas law could easily calculate the
corresponding density in each state. To use, the MPL3115A2 to measure the pressure altitude
because the relationship between pressure and altitude within the atmosphere is descried by a
simple formula, and pressure and temperature are one-to-one correspondence.

## A Schematic of the Hookup

###  Item List

1. [Arduino ESP8266](https://www.sparkfun.com/products/13711)
2. [Altitude/Pressure sensor](https://www.sparkfun.com/products/11084)
3. [Breadboard](https://www.adafruit.com/product/64)
4. [Jumper wires male-male](https://solarbotics.com/product/45040/)
5. [USB wires](https://www.sparkfun.com/products/12016)

###  Hardware setup 
To test the basic functionality, we will use the following hookup:

1. Connect **Micro-B** to **Arduino ESP8266**.
![caption](http://i65.tinypic.com/2885ibr.jpg)

2. Connect **USB-A** to **Laptop**.
![caption](http://i63.tinypic.com/14nfy4z.jpg)

3. Connect **Mini-B** to **FTDI**.
![caption](http://i64.tinypic.com/2vchvrr.jpg)

4. Connect **FTDI** to **Arduino ESP8266** via **Jumper wires** following this order:
   GND-GND
   CTS-NC
   3V3-3V3
   RXI-RXI
   TXO-TXO
   DTR-DTR
   5. Connect the **Altitude/Pressure sensor Breakout - MPL3115A2** to **Arduino ESP8266** via **Jumper wires** following this order:
   GND-GND
   3V3-VVC
   SCL-SCL
   SDA-SDA
   ![caption](http://i66.tinypic.com/2upz48x.jpg)

**Note:** You can also you the SDA and SCL lines on Arduino boards that have them broken out. Make sure you edit the code accordingly if you use those pins instead.
On an Arduino board connect the SDA pin on the breakout board to A4 and SCL to A5. If you're using a 5V Arduino Uno we recommend putting 330 ohm resistors in line to limit the 5V signal going into the sensor and prevent damage to the sensor.

6. Place the **Arduino ESP8266** to the **Bread Board**.

7. Switch on the button on the ESP8266 chip to check whether the connections are accurate. A led will glow which confirms the connection are accurate.
![caption](http://i65.tinypic.com/2ahkj4.jpg)

8. Final look after completing hookup.
![caption](http://i63.tinypic.com/302wexi.jpg)

### Software setup

The following setup should work for both Windows and Linux.

**ARDUINO code for accessing the Altitude/Pressure sensor:**


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
    float tempf = 0;
  
    void setup()
    {
      Wire.begin();        // Join i2c bus
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
 ![caption](http://i67.tinypic.com/15g775w.png) 
 
**Installation guide:**

1.	Download and Install the [Arduino IDE](https://www.sparkfun.com/products/13754).

2.	Open the Arduino IDE and follow the following steps:
    
    a) Go to **File > Preference**, and type the string 'http://arduino.esp8266.com/stable/package_esp8266com_index.json' into the "Additional Board Manager URLs" text box and click OK.
    ![caption](http://i67.tinypic.com/29asle1.jpg)
    
    b) Next step is installing "esp8266". Go to **Tools > Boards > Boards Manager**, search "esp8266", and install it.
    ![caption](http://i64.tinypic.com/2rfejx0.jpg)
    
    c) After installing "esp8266",select "SparkFun ESP8266 Thing" under **Tools > Boards**.
    ![caption](http://i67.tinypic.com/168a5c7.jpg)

3.	Depending on the type of sensor used its corresponding library files are to be downloaded. After downloading, the files are to be unzipped and are moved to **>>Documents>>Arduino>>Libraries**.
For the Altitude/Pressure the library file to be downloaded is [ITS LIBRARY](https://github.com/sparkfun/SparkFun_MPL3115A2_Breakout_Arduino_Library/archive/master.zip). Restart Arduino IDE and check to see if you have **SparkFun MPL3115A2 Altitude and Pressure Sensor Breakout** under **File>Examples**. 
    ![caption](http://i66.tinypic.com/2hxx0ep.jpg) 
    
    a) Turn the thing on with the help of switch on one corner. We can see a red light once board is on.
    
    b) In the IDE, check **Tools>Port** to see which serial port you are using. Remember that both the Thing and the FTDI are hooked up through USB, the one we should use is the USB Serial Port rather than Communications Port. To find the right port, go to Device Manager (on Windows, it's under **Control Panel>System and Security>System**) and check "**Ports**".
    ![caption](http://i64.tinypic.com/24gt5zd.jpg)
    
    c) Sensor can be turned on/off and readings can be taken with the application called **BLYNK**.
    
    d) Download the [Blynk library](https://github.com/blynkkk/blynk-library). Unzip it and move it to **>>Documents>>Arduino>>Libraries**.
    
**Blynk setup:**  

1.  Download and install the Blynk app in smart phone.

2.  Start the app after entering the login details.

3.  Clink on the New Project and give a title to it accordingly.
![caption](http://i65.tinypic.com/2eb7ja0.png)   
![caption](http://i63.tinypic.com/r8z0qb.png)

4.Go to project settings and get Auth Token to an E-mail by which, Blynk is registered by clicking on "Email all" and type it into the Arduino Sketch code.

5. Then under the New Project, create the following:
   
   a) Select the required buttons by tapping on the screen from Widget box.
   
   b) A **button**: Set output of the button to "Digital - GP5", this particular pin corresponds to the LED on the Thing board.
   ![caption](http://i68.tinypic.com/bfmlqv.png)  ![caption](http://i65.tinypic.com/b5mxc8.png)
   ![Caption](http://i66.tinypic.com/1zml3c7.png)
   
   c) Two value displays: Set the inputs to **Virtual - V0** and **Virtual - V1**, respectively.
   
   d) We can also add the parameter names to the virtual value v0 and v1 and in this project the names the parameter readings shown for Temperature(F0) and Pressure(pascal).
   ![caption](http://i63.tinypic.com/2z71hg7.png)  ![caption](http://i67.tinypic.com/1zq7qbq.png)
   
   e) By following the above steps, we are just one step away from running the application. The Button is turned ON and we can see the values for temperature(F0) and pressure(Pascal) for v0 and v1 respectively.
   ![caption](http://i67.tinypic.com/euj512.png)

## The Experiment and Discussion 

For testion our Altitude/ Pressure sensore we carried out the following experiments:

1. Exposing the sensor to different temperatures.
  a) Contact with a cold object.
  b) Contact with a hot object.
2. Exposing the sensor to different pressures.
  a) Exposing the sensor within a pressure close to vaccum.
  b) Exposing the sensor within atmospheric pressure.
  
### Checking for an ERROR

Before performing any experiment it is essential to check whether the instrumets inspite functioning and showing results are there any errors in the readings. So we decided to confirm the readings with the temperature controller and sensor of our appartment to check the temperature readings only. Fortunately we witnessed no error in the sensor and hence we carried on with our experiments.
![caption](http://i66.tinypic.com/27wzpg4.jpg)

  

**1.a) Exposing the sensor to a cold object**.

Initially we planned to keep the sensor inside the refrigerator, but, later we realized that as soon as we bring the temperature back to normal temperature the surface of the sensor becaome wet due to obvious reason can damage the sensor. So to minimize this threat we made a physical contact between the sensor and an object from thr refridgetor inside an enviornment in room temperature.
![caption](http://i66.tinypic.com/33wmceb.jpg)
 
 Doing so we witnessed a **drastic drop** in the temperature and a **fine and steady drop** in the pressure. The room temperature is **76.66** degree F where as the object temperature measured by the sensor is **41.9** degree F. Similarly the atmospheric pressure from **97809.5** pascal came down to **97718** pascal. 
 So basically there is a temperature difference of **34.76** degree F.
 Pressure drop of **91.5** pascal.
 ![caption](http://i63.tinypic.com/30avrir.jpg)
 
 **1.b)  Exposing the sensor to a hot object.**
 
 Here the hot object in nothing but a human hand which has a temperature more than room temperature, mainly due to blood and the chemical reactions inside the stomach.
 By doing so we witnessed a **steady rise** in temperature and a **fine and steady drop** in the pressure. Again the room temperature is **76.66** degree F where as the object temperature measured by the sensor is **92.975** degree F. Similarly the atmospheric pressure from **97809.5** pascal came down to **97756** pascal. 
 So basically there is a temperature difference of **53.5** degree F.
 Pressure drop of **69.25** pascal.
 ![caption](http://i63.tinypic.com/20ts1du.jpg)
 
**2.a)  Exposing the sensor within a pressure close to vaccum.**

As its very difficult to achieve vaccum, so we tried to create some as much as we could. So we took a plastic bottle and created a hole on the bottle cap, further we inserted a straw so as to suck the air inside the bottle to create a vaccum. The team inserted the sensor inside the bottle to measure the pressure.
Finally the team got readings, **89463.0** pascals and temperature **62.487** degree F.

So basically there is a temperature difference of **14.173** degree F.
 Pressure drop of **8346.5** pascal.
 ![caption](http://i66.tinypic.com/1222exc.jpg) ![caption](http://i66.tinypic.com/2qurxc4.png)


**2.b)  Exposing the sensor within atmospheric pressure.**

As per the data provided by **WEATHERFORYOU.COM** the atm pressure in pascal at the time we measured the pressure on sensor was **101264** pascal. But as per our reading we got a pressure reading in our house which is **97809.5**. Which shows a huge drop in pressure. Generally speaking we wont consider the sensor reading to be accurate because considering a temperature of 76 degree F and the current atmosphere of Tempe AZ 97824.25 is very less pressure. Practically we think the sensor is showing an error.
![caption](http://i66.tinypic.com/27wzpg4.jpg)

### Advantages and Disadvantages of Altitude/Pressure sensor

#### ADVANTAGES

1. Fully Compensated internally
2. 1.6V to 3.6V Digital Interface Supply Voltage
3. I2C digital output interface (operates up to 400 kHz)
4. Direct Reading, Compensated
5. Pressure: 20-bit measurement (Pascals)
6. Altitude: 20-bit measurement (meters)
7. Temperature: 12-bit measurement (degrees Celsius)
8. Programmable Events
9. Autonomous Data Acquisition
11.32 Sample FIFO
12 Ability to log data up to 12 days using the FIFO
13.1 second to 9 hour data acquisition rate
14.1.95V to 3.6V Supply Voltage, internally regulated by LDO

#### DISADVANTAGES

1. Its not portable, as we have to carry laptop along with the sensor everytime.
2. Its not water resistant.
3. It does not measure extreme high temperatures. 

## CONCLUSION

From the tests which our team conducted, we can say that the sensor is fully functional. The temperature sensor is accurate though the pressure is not. The hookup is very easy to understand and easy to control through a smartphone via Blynk.