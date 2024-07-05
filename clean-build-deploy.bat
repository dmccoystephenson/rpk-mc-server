rem This script will clean, build and deploy the application

rem Check if the user wants to continue
echo "Are you sure you want to clean, build and deploy the application? (y/n)"
set /p choice=
if /i %choice% neq y goto end

rem Clean the application
docker compose down --remove-orphans --volumes

rem Build the application and deploy it
docker compose up --build -d
:end