# AVR_Mega168p_picoboot_try
Arduino IDE and test this bootloader  
Arduino IDE 1.8.13, update to 1.8.13 / 1.8.19, support UNO, NANO, 168p 328p  
hardware : Nano with Atmega168P, 16MHz  
note : Arduino IDE has no support to 168p, perhaps clone but not offical release. Atmega168 has different signature but supported


### download and save the picoboot, no fork yet,
author's https://github.com/nerdralph/picoboot/tree/master/arduino

download [picobootArduino168v3b2.hex](https://github.com/nerdralph/picoboot/blob/master/arduino/picobootArduino168v3b2.hex)  
copy to ``` C:\Program Files (x86)\Arduino\hardware\arduino\avr\bootloaders\picoboot\```  
in case donwload failed here is the local copy,  
  
```  
:1000000011241D9AFCE303D03197E9F7F9CF8A95C3  
:04001000F1F7089567  
:103F000024B621FE7CC0519AAA27BB27C4E631966D  
:103F1000489B04C0E1F7CA95D1F771C01196489B40  
:103F2000FDCFB695A795B695A795A695AB1FAA9573  
:103F3000C0ECDD2712E01883AC8328E1298350E12F  
:103F400055D09033E9F718E01983BC81B3951197E8  
:103F5000C895E9F741E13FD029835E8347D0092F17  
:103F6000A4E13FD0053521F433D0FC01EE0FFF1F53  
:103F7000063511F0013409F4BE830537E1F5AEE1F1  
:103F800030D0A4E92ED0ABE02CD0043679F41CD08C  
:103F90009634C9F41DD00C0141E01DD03296325048  
:103FA000C9F7329743E017D045E015D0043759F4EC  
:103FB0000BD0E1BDF2BDA591953411F4F89AA0B5EE  
:103FC00010D03A95B1F7BFCF11D002D0382F089555  
:103FD0000DD0892F0BC017B710FDFDCF47BFE89557  
:103FE0000895188115FFFDCFAE830895188117FF3E  
:103FF000FDCF9E810895013541F65E83D9835198A6  
:00000001FF  
```  


### make Arduino IDE to support this board and picoboot,

Arduino IDE 1.8.19, borad.txt is located ```%userprofile%\AppData\Local\Arduino15\packages\arduino\hardware\avr\1.8.6```

locate the boards.txt, usually here, ```C:\Program Files (x86)\Arduino\hardware\arduino\avr```  
copy the file to user folder, open the file, find the lines,
or, replace with boards_arduino-1.8.13.txt   
or, boards_arduino-1.8.15.txt  

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
nano.menu.cpu.atmega168p_picoboot.bootloader.file=picoboot/picobootArduino168v3b2.hex  

nano.menu.cpu.atmega168p_picoboot.build.mcu=atmega168p  


```  
restart ARduino IDE, select board as created & seen,
![picoboot_try_Arduino_IDE.JPG](picoboot_try_Arduino_IDE.JPG)  







### burn the picoboot
burn this bootloader to Nano (with Atmega168P) and try.  
115200 baud, ok  
230400 baud, NG  
250000 baud, ok  

:: Atmega168P, BOD 1.8V, Arduino bootloader, picoboot 250000 baud rate, tested ok   
::set lfuse=0xF7  
::set hfuse=0xd6  
::set efuse=0xfc  



# AVR_Mega328p_picoboot_try 
download, [https://github.com/nerdralph/picoboot/blob/master/arduino/picobootArduino328v3b2.hex](https://github.com/nerdralph/picoboot/blob/master/arduino/picobootArduino328v3b2.hex)  

copy to, copy to ```C:\Program Files (x86)\Arduino\hardware\arduino\avr\bootloaders\picoboot\```    
in case donwload failed here is the local copy,   
```  
:1000000011241D9AFCE303D03197E9F7F9CF8A95C3
:04001000F1F7089567
:107E000024B621FE7CC0519AAA27BB27C4E631962E
:107E1000489B04C0E1F7CA95D1F771C01196489B01
:107E2000FDCFB695A795B695A795A695AB1FAA9534
:107E3000C0ECDD2712E01883AC8328E1298350E1F0
:107E400055D09033E9F718E01983BC81B3951197A9
:107E5000C895E9F741E13FD029835E8347D0092FD8
:107E6000A4E13FD0053521F433D0FC01EE0FFF1F14
:107E7000063511F0013409F4BE830537E1F5AEE1B2
:107E800030D0A5E92ED0AFE02CD0043679F41CD048
:107E90009634C9F41DD00C0141E01DD03296325009
:107EA000C9F7329743E017D045E015D0043759F4AD
:107EB0000BD0E1BDF2BDA591953411F4F89AA0B5AF
:107EC00010D03A95B1F7BFCF11D002D0382F089516
:107ED0000DD0892F0BC017B710FDFDCF47BFE89518
:107EE0000895188115FFFDCFAE830895188117FFFF
:107EF000FDCF9E810895013541F65E83D983519867
:00000001FF
```  


### make UNO to support picoboot too   
locate the boards.txt, usually here, ```C:\Program Files (x86)\Arduino\hardware\arduino\avr```    
under section above, add following lines, and save to the folder/file,
find Uno, replace the text as following, for Arduino IDE 1.8.15  
```
uno.name=Arduino Uno

uno.vid.0=0x2341
uno.pid.0=0x0043
uno.vid.1=0x2341
uno.pid.1=0x0001
uno.vid.2=0x2A03
uno.pid.2=0x0043
uno.vid.3=0x2341
uno.pid.3=0x0243

uno.upload.tool=avrdude
uno.upload.protocol=arduino
#uno.upload.maximum_size=32256
#uno.upload.maximum_data_size=2048
#uno.upload.speed=115200

uno.bootloader.tool=avrdude
#uno.bootloader.low_fuses=0xFF
#uno.bootloader.high_fuses=0xDE
#uno.bootloader.extended_fuses=0xFD
uno.bootloader.unlock_bits=0x3F
uno.bootloader.lock_bits=0x0F
#uno.bootloader.file=optiboot/optiboot_atmega328.hex

#uno.build.mcu=atmega328p
uno.build.f_cpu=16000000L
uno.build.board=AVR_UNO
uno.build.core=arduino
#uno.build.variant=standard
nano.build.variant=eightanaloginputs




## xialaba 2020-OCT-20
## Arduino UNO w/ ATmega328P optiboot
## --------------------------
uno.menu.cpu.atmega328_optiboot=ATmega328P (optiboot standard)

uno.menu.cpu.atmega328_optiboot.upload.maximum_size=32256
uno.menu.cpu.atmega328_optiboot.upload.maximum_data_size=2048
uno.menu.cpu.atmega328_optiboot.upload.speed=115200

uno.menu.cpu.atmega328_optiboot.bootloader.low_fuses=0xFF
uno.menu.cpu.atmega328_optiboot.bootloader.high_fuses=0xDA
uno.menu.cpu.atmega328_optiboot.bootloader.extended_fuses=0xFD
uno.menu.cpu.atmega328_optiboot.bootloader.file=optiboot/optiboot_atmega328.hex  

uno.menu.cpu.atmega328_optiboot.build.mcu=atmega328p



## xialaba 2020-OCT-20
## Arduino UNO w/ ATmega328P_picoboot
## --------------------------
uno.menu.cpu.atmega328_picoboot=ATmega328P (picoboot v3b2)

uno.menu.cpu.atmega328_picoboot.upload.maximum_size=30720
uno.menu.cpu.atmega328_picoboot.upload.maximum_data_size=2048
uno.menu.cpu.atmega328_picoboot.upload.speed=250000

uno.menu.cpu.atmega328_picoboot.bootloader.low_fuses=0xFF
uno.menu.cpu.atmega328_picoboot.bootloader.high_fuses=0xDA
uno.menu.cpu.atmega328_picoboot.bootloader.extended_fuses=0xFD
uno.menu.cpu.atmega328_picoboot.bootloader.file=picoboot/picobootArduino328v3b2.hex  

uno.menu.cpu.atmega328_picoboot.build.mcu=atmega328p
```  
.  

:: Atmega328P, picoboot bootloader, UNO, 250000 baud, tested ok    
set lfuse=0xF7  
set hfuse=0xde    
set efuse=0xff    


:: Atmega328P, optiboot bootloader, Nano, baud rate 250000, tested ok  
::set lfuse=0xFF  
::set hfuse=0xda  
::set efuse=0xfd  
