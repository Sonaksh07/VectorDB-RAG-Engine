@echo off
echo ===================================================
echo  VectorDB Compiler Script (g++ / C++17)
echo ===================================================
echo.
echo [1/2] Compiling VectorDB Server (main.cpp)...
g++ -std=c++17 -O2 main.cpp -o db -lws2_32 -D_WIN32_WINNT=0x0A00
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to compile VectorDB Server!
    exit /b %errorlevel%
)
echo Server compiled successfully as db.exe.
echo.
echo [2/2] Compiling Unit Tests (src/tests.cpp)...
g++ -std=c++17 -O2 src/tests.cpp -o run_tests -lws2_32 -D_WIN32_WINNT=0x0A00
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to compile Unit Tests!
    exit /b %errorlevel%
)
echo Unit Tests compiled successfully as run_tests.exe.
echo.
echo ===================================================
echo  Compilation completed successfully!
echo  - Run the database server: ./db
echo  - Run the test suite:      ./run_tests
echo ===================================================
