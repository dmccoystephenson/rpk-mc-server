echo "Running 'post-create.sh' script..."
if [ -z "$(ls -A /rpkmcserver)" ]; then
    echo "Setting up server..."
    # Copy server JAR
    cp /rpkmcserver-build/spigot-1.19.4.jar /rpkmcserver/spigot-1.19.4.jar

    # Create plugins directory
    mkdir /rpkmcserver/plugins

    # Copy JARs
    cp /jars/*.jar /rpkmcserver/plugins

    # Copy config files
    cp /config/ops.json /rpkmcserver

    # Accept EULA
    cd /rpkmcserver && echo "eula=true" > eula.txt
else
    echo "Server is already set up."
fi

echo "Copying file overrides..."
cp /deposit-box/plugin-overrides/*.jar /rpkmcserver/plugins

java -jar /rpkmcserver/spigot-1.19.4.jar