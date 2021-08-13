copy /y boards_arduino-1.8.15.txt boards.txt

::copy /y boards.txt "C:\Program Files (x86)\Arduino\hardware\arduino\avr\boards.txt"


::@Echo off
REM %0 refers to the currently running batch and the modifier ~dp returns drive and path (with a trailing backslash.)
::"%~dp0cp.bat"

pause
