# AVR_Mega168p_picoboot_try
Arduino IDE and test this bootloader  
Arduino IDE 1.8.13  
hardward : Nano with Atmega168P, Arduino IDE has no support, perhaps clone but not offical release. Atmega168 has different signature but supported


### download and save the picoboot,
author's https://github.com/nerdralph/picoboot/tree/master/arduino

download [picobootArduino168v3b2.hex](https://github.com/nerdralph/picoboot/blob/master/arduino/picobootArduino168v3b2.hex)  
copy to C:\Program Files (x86)\Arduino\hardware\arduino\avr\bootloaders\atmega\  

### make Arduino IDE to support this board and picoboot,

locate the boards.txt, usually here, C:\Program Files (x86)\Arduino\hardware\arduino\avr
copy the file to user folder, open the file, find the lines,
```
##############################################################  
  
nano.name=Arduino Nano  
  
nano.upload.tool=avrdude  
nano.upload.protocol=arduino  
  
nano.bootloader.tool=avrdude  
nano.bootloader.unlock_bits=0x3F  
nano.bootloader.lock_bits=0x0F  

nano.build.f_cpu=16000000L  
nano.build.board=AVR_NANO  
nano.build.core=arduino  
nano.build.variant=eightanaloginputs  
  
```  
   
under section above, add following lines, and save to the folder/file 

```
## Arduino Nano w/ ATmega168p_picoboot  
## -------------------------  
nano.menu.cpu.atmega168p_picoboot=ATmega168p (picoboot v3b2)  
  
nano.menu.cpu.atmega168p_picoboot.upload.maximum_size=16128  
nano.menu.cpu.atmega168p_picoboot.upload.maximum_data_size=1024  
nano.menu.cpu.atmega168p_picoboot.upload.speed=250000  
  
nano.menu.cpu.atmega168p_picoboot.bootloader.low_fuses=0xf7  
nano.menu.cpu.atmega168p_picoboot.bootloader.high_fuses=0xd6  
nano.menu.cpu.atmega168p_picoboot.bootloader.extended_fuses=0xFc  
nano.menu.cpu.atmega168p_picoboot.bootloader.file=atmega/picobootArduino168v3b2.hex  

nano.menu.cpu.atmega168p_picoboot.build.mcu=atmega168p  


```  
restart ARduino IDE, select board as created & seen,
![picoboot_try_Arduino_IDE.JPG](picoboot_try_Arduino_IDE.JPG)  




### burn the picoboot
burn this bootloader to Nano (with Atmega168P) and try.  
115200 baud, ok  
230400 baud, NG  
250000 baud, ok  
ok


