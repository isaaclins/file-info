@echo off
set "FILE_PATH=%~1"

if "%FILE_PATH%"=="" (
    echo No file specified. Usage: upload.bat [file_path]
    pause
    exit /b
) else (
    echo File Information:
    echo -----------------
    echo File Name: %~n1
    echo File Size: %~z1 bytes
    for %%A in ("%FILE_PATH%") do (
        echo Creation Date: %%~tA
        echo Last Modified Date: %%~tA
        echo Stored in: %FILE_PATH%
    )
    echo -----------------
    echo.
    echo Calculating hashes...
    
    echo SHA-1 HASH:
    certUtil -hashfile "%FILE_PATH%" SHA1 | findstr /i /v "SHA1" | findstr /v "CertUtil:"
    
    echo.
    echo MD5 HASH:
    certUtil -hashfile "%FILE_PATH%" MD5 | findstr /i /v "MD5" | findstr /v "CertUtil:"
    
    echo.
    echo SHA-256 HASH:
    certUtil -hashfile "%FILE_PATH%" SHA256 | findstr /i /v "SHA256" | findstr /v "CertUtil:"
)

pause
