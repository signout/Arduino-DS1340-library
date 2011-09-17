// Set date and time using a DS1340 RTC connected via I2C
// 
// Connect SCL to Analog 0
// Connect SDA to Analog 1

#include <Wire.h>
#include "DS1340lib.h"

RTC_DS1340 RTC;

void setup () {
    Serial.begin(57600); // Set serial port speed
    Wire.begin(); // Start the I2C
    RTC.begin(); // Init RTC
    RTC.adjust(DateTime(__DATE__, __TIME__)); // Time and date is expanded to date and time on your computer at compiletime
    Serial.print('Time and date set');
//    RTC.enabletricklecharger(); // Uncomment if you want to enable the trickle charger
//    RTC.enableFTout(); // Uncomment if you want FT to toggle at 512Hz
}

void loop () {
    DateTime now = RTC.now();
    
    Serial.print(now.year(), DEC);
    Serial.print('/');
    Serial.print(now.month(), DEC);
    Serial.print('/');
    Serial.print(now.day(), DEC);
    Serial.print(' ');
    Serial.print(now.hour(), DEC);
    Serial.print(':');
    Serial.print(now.minute(), DEC);
    Serial.print(':');
    Serial.print(now.second(), DEC);
    Serial.println();
    
    delay(3000);
}