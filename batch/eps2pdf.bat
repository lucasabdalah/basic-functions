@echo off

@REM eps2pdf: convert multiple eps files to pdf with miktex 
echo -------- Convert EPS to PDF with miktex --------
@echo.
@echo.
:: Input the folder path to convert all *.eps files
set /p PathInput= Insert the folder path: 
set String= %PathInput%"\*.eps"
@echo.
@echo.
echo -------- Processing files with miktex --------\n.\n.
@echo.
@echo.
for %%f in (%String%) do epstopdf "%%f"
@echo.
@echo.
echo -------- Finished: PDF files --------\n
pause