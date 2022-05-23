::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBVAXg2GAES0A5EO4f7+086CsUYJW/IDdIDc1fqHI+9z
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBVAXg2GAES0A5EO4f7+086CsUYJW/IDW4DX1rWaOqAw5UvucJU5w2hf2MgDGRVMewCXbx8k52taswQ=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal
title Collatz conjecture calculator (v0.1.0.0_alpha)
@mode con lines=25 cols=61

:warning
cls
echo BEFORE USING, PLEASE READ THIS CAREFULLY.
echo.
echo Collatz conjecture is kinda complicated to explain by
echo just a few words, so I will leave this YouTube video
echo link from Veritasium here:
echo.
echo https://www.youtube.com/watch?v=094y1Z2wpJg
echo Make sure you have watched the entire video and
echo acknowledge everything before using this thing.
pause >nul
echo.
echo And... during calculations, this application may put
echo a lot of work on your CPU. Be sure you have closed
echo unnecessary tasks before continuing, to prevent lags
echo or even crashes. Chances are low, but who knows.
echo.
echo Written and compiled by karonboi
echo Licensed under GNU General Public License v3.0
echo To see more about this calculator, go to this GitHub
echo repository:
echo https://github.com/karonboi/Collatz-Conjecture-calculator
pause >nul
goto scene_input

:scene_input
set steps=0
set filecode=%random%
echo Collatz conjecture calculator (v0.1.0.0_alpha, made by karonboi) >> result_%filecode%.txt
cls
echo Now input a random number, integers only.
echo (Carets are not supported at this time.)
echo.
echo (And please, too huge numbers can lead to a crash or
echo  centuries to complete the count.)
echo.
set /p num=
echo.
set starttime=%time%
set startdate=%date%
echo Process started at %starttime%, %date% >> result_%filecode%.txt
echo Start number: %num% >> result_%filecode%.txt
echo. >> result_%filecode%.txt
echo Please wait...
goto system_loop_detectoddoreven

:system_loop_detectoddoreven
:: Detects if the number is odd or even.
::  - If it's odd, it will be multiplied by 3 and then plus 1.
::  - If it's even, it will be divided to 2 until it's odd.
::  - If it's 1, the loop will end.
if %num% == 1 goto system_endloop
set /a newnum=%num% %% 2
if %newnum% == 0 goto system_calcualte_even
if not %newnum% == 0 goto system_calcualte_odd
goto system_loop_detectoddoreven

:system_calcualte_even
set /a steps=%steps%+1
set /a newnum=%num%/2
echo [system_calcualte_even, step_%steps%] %num% is even, so %num% / 2 = %newnum% >> result_%filecode%.txt
set num=%newnum%
goto system_loop_detectoddoreven

:system_calcualte_odd
set /a steps=%steps%+1
set /a newnum=%num%*3+1
echo [system_calcualte_odd, step_%steps%] %num% is odd, so %num% * 3 + 1 = %newnum% >> result_%filecode%.txt
set num=%newnum%
goto system_loop_detectoddoreven

:system_endloop
set endtime=%time%
set enddate=%date%
echo. >> result_%filecode%.txt
echo Process ended at %endtime%, %enddate% with %steps% steps. >> result_%filecode%.txt
goto scene_end

:scene_end
echo.
echo Process finished.
echo Output is placed at result_%filecode%.txt
pause >nul
goto scene_input
