echo "Running 'post-create.sh' script..."
if [ -z "$(ls -A /rpkmcserver)" ]; then
    echo "Setting up server..."
    # Copy server JAR
    cp /rpkmcserver-build/spigot-1.19.4.jar /rpkmcserver/spigot-1.19.4.jar

    # Create plugins directory
    mkdir /rpkmcserver/plugins

    # Copy JARs
    cp /jars/*.jar /rpkmcserver/plugins

    # Accept EULA
    cd /rpkmcserver && echo "eula=true" > eula.txt
else
    echo "Server is already set up."
fi

java -jar /rpkmcserver/spigot-1.19.4.jar