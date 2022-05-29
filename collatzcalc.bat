@echo off
title Collatz conjecture calculator (v0.2.0.0_alpha)
@mode con lines=25 cols=75
setlocal EnableExtensions EnableDelayedExpansion

:system_checkif_optionsaves
if exist options.bat call options.bat
if not exist options.bat goto system_options_createsave
goto scene_warning

:system_options_createsave
(
echo @echo off
echo.
echo set limit_steps_bool=false
echo set limit_steps_inte=300
) > options.bat
goto scene_warning

:scene_warning
cls
echo BEFORE USING, PLEASE READ THIS CAREFULLY.
echo.
echo Collatz conjecture is kinda complicated to explain by just a few words, 
echo so I will leave this YouTube video link from Veritasium here:
echo.
echo https://www.youtube.com/watch?v=094y1Z2wpJg
echo Make sure you have watched the entire video and acknowledge everything 
echo before using this thing.
pause >nul
echo.
echo And... during calculations, this application may put a lot of work on
echo your CPU. Be sure you have closed unnecessary tasks before continuing,
echo to prevent lags or even crashes. Chances are low, but who knows.
echo.
echo Written and compiled by karonboi
echo Licensed under GNU General Public License v3.0
echo To see more about this calculator, go to this GitHub repository:
echo https://github.com/karonboi/Collatz-Conjecture-calculator
pause >nul
goto scene_select

:scene_select
title Collatz conjecture calculator (v0.2.0.0_alpha)
cls
echo Choose a mode:
echo 1: Positive integers
echo 2: Negative integers
echo.
echo X: Options
echo.
set /p select=
if %select%== 1 goto scene_positiveMode_input
if %select% == 2 goto scene_negativeMode_input
if "%seelct%"=="X" goto scene_system_options
if "%select%"=="x" goto scene_system_options
if not %select% == 1 goto scene_select
if not %select% == 2 goto scene_select
if not "%seelct%"=="X" goto scene_select
if not "%seelct%"=="x" goto scene_select
if not defined %select% goto scene_select
goto scene_select

:scene_system_options
call options.bat
set new_limitStepBool=%limit_steps_bool%
set new_limitStepInte=%limit_steps_inte%
cls
title Collatz conjecture calculator [Options] (v0.2.0.0_alpha)
if %limit_steps_bool% == true echo 1. Turn off steps limitation
if %limit_steps_bool% == false echo 1. Turn on step limitation
echo 2. Change the steps limitation range
echo.
echo X. Read the warning
echo Q. Returm
set /p option=
if %option% == 1 goto system_changeSettings_limitStepBool
if %option% == 2 goto scene_system_changeSettings_limitStepInte
if %option% == X goto scene_warning_duringsettings
if %option% == x goto scene_warning_duringsettings
if %option% == Q goto scene_select
if %option% == q goto scene_select
if not %option% == 1 goto scene_system_options
if not %option% == 2 goto scene_system_options
if not %option% == X goto scene_system_options
if not %option% == x goto scene_system_options
if not %option% == Q goto scene_system_options
if not %option% == q goto scene_system_options
if not defined %option% goto scene_system_options
goto scene_system_options

:scene_warning_duringsettings
echo.
echo Collatz conjecture is kinda complicated to explain by just a few words, 
echo so I will leave this YouTube video link from Veritasium here:
echo.
echo https://www.youtube.com/watch?v=094y1Z2wpJg
echo Make sure you have watched the entire video and acknowledge everything 
echo before using this thing.
pause >nul
echo.
echo And... during calculations, this application may put a lot of work on
echo your CPU. Be sure you have closed unnecessary tasks before continuing,
echo to prevent lags or even crashes. Chances are low, but who knows.
echo.
echo Written and compiled by karonboi
echo Licensed under GNU General Public License v3.0
echo To see more about this calculator, go to this GitHub repository:
echo https://github.com/karonboi/Collatz-Conjecture-calculator
pause >nul
goto scene_system_options

:scene_system_changeSettings_limitStepInte
echo.
echo Current range: %limit_steps_inte%
set /p new_limitStepInte=New range: 
goto system_saveOptions

:system_changeSettings_limitStepBool
if %limit_steps_bool% == true set new_limitStepBool=false
if %limit_steps_bool% == false set new_limitStepBool=true
goto system_saveOptions

:system_saveOptions
(
echo @echo off
echo.
echo set limit_steps_bool=%new_limitStepBool%
echo set limit_steps_inte=%new_limitStepInte%
) > options.bat
goto scene_system_options

:scene_positiveMode_input
set steps=0
set filecode=%random%
echo Collatz conjecture calculator (v0.2.0.0_alpha, made by karonboi) >> result_positive_%filecode%.txt
echo Running in Positive mode. >> result_positive_%filecode%.txt
if %limit_steps_bool% == true echo Steps limit is on. The calculations will stop at step %limit_steps_inte%. >> result_positive_%filecode%.txt
if %limit_steps_bool% == false echo Steps limit is off. >> result_positive_%filecode%.txt
title Collatz conjecture calculator [Positive mode] (v0.2.0.0_alpha)
cls
echo Now input a random number, positive integers only.
if %limit_steps_bool% == true echo Steps limit is on. The calculations will stop at step %limit_steps_inte%.
if %limit_steps_bool% == false echo Steps limit is off.
echo (Carets are not supported at this time.)
echo.
echo (And please, too huge numbers can lead to a crash or
echo  centuries to complete the process.)
set /p startnum=
echo.
set starttime=%time%
set startdate=%date%
echo Process started at %starttime%, %date% >> result_positive_%filecode%.txt
echo Start number: %startnum% >> result_positive_%filecode%.txt
echo. >> result_positive_%filecode%.txt
echo Please wait...
set num=%startnum%
call options.bat
if %limit_steps_bool% == true goto system_positiveMode_loop_detectoddoreven_limitStep
if %limit_steps_bool% == false goto system_positiveMode_loop_detectoddoreven_free
goto scene_positiveMode_input

:system_positiveMode_loop_detectoddoreven_free
:: Detects if the number is odd or even.
::  - If it's odd, it will be multiplied by 3 and then plus 1.
::  - If it's even, it will be divided to 2 until it's odd.
::  - If it's 1, the loop will end.
if %num% == 1 goto system_positiveMode_endloop
set /a newnum=%num% %% 2
if %newnum% == 0 goto system_positiveMode_calcualte_even_free
if not %newnum% == 0 goto system_positiveMode_calcualte_odd_free
goto system_positiveMode_loop_detectoddoreven_free

:system_positiveMode_loop_detectoddoreven_limitStep
:: Detects if the number is odd or even.
:: Acts like the previous command groups, but with steps limited.
if %steps% == %limit_steps_inte% goto system_positiveMode_endloop
if %num% == 1 goto system_positiveMode_endloop
set /a newnum=%num% %% 2
if %newnum% == 0 goto system_positiveMode_calcualte_even_limitStep
if not %newnum% == 0 goto system_positiveMode_calcualte_odd_limitStep
goto system_positiveMode_loop_detectoddoreven_limitStep

:system_positiveMode_calcualte_even_free
set /a steps=%steps%+1
set /a newnum=%num%/2
echo [system_positiveMode_calcualte_even, step_%steps%] %num% is even, so %num% / 2 = %newnum% >> result_positive_%filecode%.txt
set num=%newnum%
goto system_positiveMode_loop_detectoddoreven_free

:system_positiveMode_calcualte_even_limitStep
set /a steps=%steps%+1
set /a newnum=%num%/2
echo [system_positiveMode_calcualte_even, step_%steps%, limitStep=%limit_steps_inte%] %num% is even, so %num% / 2 = %newnum% >> result_positive_%filecode%.txt
set num=%newnum%
goto system_positiveMode_loop_detectoddoreven_limitStep

:system_positiveMode_calcualte_odd_free
set /a steps=%steps%+1
set /a newnum=%num%*3+1
echo [system_positiveMode_calcualte_odd, step_%steps%] %num% is odd, so %num% * 3 + 1 = %newnum% >> result_positive_%filecode%.txt
set num=%newnum%
goto system_positiveMode_loop_detectoddoreven_free

:system_positiveMode_calcualte_odd_limitStep
set /a steps=%steps%+1
set /a newnum=%num%*3+1
echo [system_positiveMode_calcualte_odd, step_%steps%, limitStep=%limit_steps_inte%] %num% is odd, so %num% * 3 + 1 = %newnum% >> result_positive_%filecode%.txt
set num=%newnum%
goto system_positiveMode_loop_detectoddoreven_limitStep

:system_positiveMode_endloop
set endtime=%time%
set enddate=%date%
echo. >> result_positive_%filecode%.txt
echo Process ended at %endtime%, %enddate% with %steps% steps. >> result_positive_%filecode%.txt
goto scene_positiveMode_end

:scene_positiveMode_end
echo.
echo Process finished.
echo Output is placed at result_positive_%filecode%.txt
echo.
echo Return to menu? (y/n)
set /p return=
if %return% == Y goto scene_select
if %return% == y goto scene_select
if %return% == N goto scene_positiveMode_input
if %return% == n goto scene_positiveMode_input
if not %return% == Y goto scene_positiveMode_input
if not %return% == y goto scene_positiveMode_input
if not %return% == N goto scene_positiveMode_input
if not %return% == n goto scene_positiveMode_input
if not defined %return% goto scene_positiveMode_input
goto scene_positiveMode_input

:scene_negativeMode_input
set steps=0
set filecode=%random%
echo Collatz conjecture calculator (v0.2.0.0_alpha, made by karonboi) >> result_negative_%filecode%.txt
echo Running in negative mode. >> result_negative_%filecode%.txt
if %limit_steps_bool% == true echo Steps limit is on. The calculations will stop at step %limit_steps_inte%. >> result_negative_%filecode%.txt
if %limit_steps_bool% == false echo Steps limit is off. >> result_negative_%filecode%.txt
title Collatz conjecture calculator [Negative mode] (v0.2.0.0_alpha)
cls
echo Now input a random number, negative integers only.
if %limit_steps_bool% == true echo Steps limit is on. The calculations will stop at step %limit_steps_inte%.
if %limit_steps_bool% == false echo Steps limit is off.
echo (Carets are not supported at this time.)
echo.
echo (And please, too huge numbers can lead to a crash or
echo  centuries to complete the process.)
echo.
set /p startnum=
echo.
set starttime=%time%
set startdate=%date%
echo Process started at %starttime%, %date% >> result_negative_%filecode%.txt
echo Start number: %startnum% >> result_negative_%filecode%.txt
echo. >> result_negative_%filecode%.txt
echo Please wait...
set num=%startnum%
if %limit_steps_bool% == true goto system_negativeMode_loop_detectoddoreven_limitStep
if %limit_steps_bool% == false goto system_negativeMode_loop_detectoddoreven_free
goto system_negativeMode_loop_detectoddoreven

:system_negativeMode_loop_detectoddoreven_free
:: Detects if the number is odd or even.
::  - If it's odd, it will be multiplied by 3 and then plus 1.
::  - If it's even, it will be divided to 2 until it's odd.
::  - If it's -1, the loop will end.
if %num% == -1 goto system_negativeMode_endloop
set /a newnum=%num% %% 2
if %newnum% == 0 goto system_negativeMode_calcualte_even_free
if not %newnum% == 0 goto system_negativeMode_calcualte_odd_free
goto system_negativeMode_loop_detectoddoreven_free

:system_negativeMode_loop_detectoddoreven_limitStep
:: Detects if the number is odd or even.
:: Once again, bla bla bla.
if %steps% == %limit_steps_inte% goto system_negativeMode_endloop
if %num% == -1 goto system_negativeMode_endloop
set /a newnum=%num% %% 2
if %newnum% == 0 goto system_negativeMode_calcualte_even_limitStep
if not %newnum% == 0 goto system_negativeMode_calcualte_odd_limitStep
goto system_negativeMode_loop_detectoddoreven_limitStep

:system_negativeMode_calcualte_even_free
set /a steps=%steps%+1
set /a newnum=%num%/2
echo [system_negativeMode_calcualte_even, step_%steps%] %num% is even, so %num% / 2 = %newnum% >> result_negative_%filecode%.txt
set num=%newnum%
goto system_negativeMode_loop_detectoddoreven_free

:system_negativeMode_calcualte_even_limitStep
set /a steps=%steps%+1
set /a newnum=%num%/2
echo [system_negativeMode_calcualte_even, step_%steps%, limitStep=%limit_steps_inte%] %num% is even, so %num% / 2 = %newnum% >> result_negative_%filecode%.txt
set num=%newnum%
goto system_negativeMode_loop_detectoddoreven_limitStep

:system_negativeMode_calcualte_odd_free
set /a steps=%steps%+1
set /a newnum=%num%*3+1
echo [system_negativeMode_calcualte_odd, step_%steps%] %num% is odd, so %num% * 3 + 1 = %newnum% >> result_negative_%filecode%.txt
set num=%newnum%
goto system_negativeMode_loop_detectoddoreven_free

:system_negativeMode_calcualte_odd_limitStep
set /a steps=%steps%+1
set /a newnum=%num%*3+1
echo [system_negativeMode_calcualte_odd, step_%steps%, limitStep=%limit_steps_inte%] %num% is odd, so %num% * 3 + 1 = %newnum% >> result_negative_%filecode%.txt
set num=%newnum%
goto system_negativeMode_loop_detectoddoreven_limitStep

:system_negativeMode_endloop
set endtime=%time%
set enddate=%date%
echo. >> result_negative_%filecode%.txt
echo Process ended at %endtime%, %enddate% with %steps% steps. >> result_negative_%filecode%.txt
goto scene_negativeMode_end

:scene_negativeMode_end
echo.
echo Process finished.
echo Output is placed at result_negative_%filecode%.txt
echo.
echo Return to menu? (y/n)
set /p return=
if %return% == Y goto scene_select
if %return% == y goto scene_select
if %return% == N goto scene_negativeMode_input
if %return% == n goto scene_negativeMode_input
if not %return% == Y goto scene_negativeMode_input
if not %return% == y goto scene_negativeMode_input
if not %return% == N goto scene_negativeMode_input
if not %return% == n goto scene_negativeMode_input
if not defined %return% goto scene_negativeMode_input
goto scene_negativeMode_input
