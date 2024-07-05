# Description: This script is used to clean, build and deploy the application

# ask for confirmation
echo "are you sure you want to clean and build?"
read -p "Press enter to continue"

# clean
docker compose down --remove-orphans --volumes

# build and deploy
docker compose up --build -d