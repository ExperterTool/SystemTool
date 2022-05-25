@echo off
:loop
ping -t 127.0.0.1 >nul 2>nul
goto loop
