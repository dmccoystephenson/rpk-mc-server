echo "Running 'post-create.sh' script..."
if [ -z "$(ls -A /rpkmcserver)" ]; then
    echo "Setting up server..."
    # Copy server JAR
    echo "Copying server JAR..."
    cp /rpkmcserver-build/spigot-1.18.2.jar /rpkmcserver/spigot-1.18.2.jar

    # Create plugins directory
    echo "Creating plugins directory..."
    mkdir /rpkmcserver/plugins

    # Copy config files
    echo "Copying config files..."
    cp /config/ops.json /rpkmcserver

    # Accept EULA
    echo "Accepting EULA..."
    cd /rpkmcserver && echo "eula=true" > eula.txt
else
    echo "Server is already set up."
fi

# Copy JARs (initially and in case of updates)
echo "Copying JARs..."
cp /jars/*.jar /rpkmcserver/plugins

# Copy file overrides
echo "Copying file overrides..."
cp /deposit-box/plugin-overrides/*.jar /rpkmcserver/plugins

# Start server
java -jar /rpkmcserver/spigot-1.18.2.jar