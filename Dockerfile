FROM ubuntu

USER root

# Install dependencies
RUN apt-get update
RUN apt-get install -y git \
    openjdk-17-jdk \
    openjdk-17-jre \
    wget

# Create directories
RUN mkdir /rpkmcserver-build

# Build server
WORKDIR /rpkmcserver-build
RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN git config --global --unset core.autocrlf || :
RUN java -jar BuildTools.jar --rev 1.18.2

# Download & install community plugins -----------------------------
WORKDIR /jars
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-auction-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-auctions-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-bank-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-banks-bukkit-2.3.3-mc1.18-1-all.jar
# RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-block-log-lib-bukkit-2.3.3-mc1.18-1-all.jar
# RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-block-logging-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-character-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-characters-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-chat-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-chat-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-class-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-classes-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-core-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-crafting-skill-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-crafting-skill-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-daily-quote-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-drink-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-drinks-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-economy-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-economy-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-essentials-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-experience-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-experience-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-feature-flag-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-feature-flags-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-food-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-food-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-item-quality-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-item-quality-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-kit-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-language-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-languages-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-location-history-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-lock-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-locks-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-moderation-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-moderation-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-monster-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-notification-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-notifications-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-payment-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-payments-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-permissions-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-permissions-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-player-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-players-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-professions-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-professions-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-rolling-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-selection-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-selection-lib-bukkit-2.3.3-mc1.18-1-all.jar
# RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-selection-worldedit-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-shop-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-shops-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-skill-fireball-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-skill-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-skills-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-stat-build-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-stat-builds-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-stat-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-stats-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-store-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-stores-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-tracking-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-trade-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-travel-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-unconsciousness-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-unconsciousness-lib-bukkit-2.3.3-mc1.18-1-all.jar
RUN wget https://github.com/dmccoystephenson/my-RPKit/releases/download/v2.3.3-1.18/rpk-warp-lib-bukkit-2.3.3-mc1.18-1-all.jar
# --------------------------------------------------------

# Download and install other plugins -----------------------------
RUN wget https://github.com/ViaVersion/ViaVersion/releases/download/4.9.2/ViaVersion-4.9.2.jar
RUN wget https://github.com/ViaVersion/ViaBackwards/releases/download/4.9.1/ViaBackwards-4.9.1.jar
# --------------------------------------------------------

# Copy post-create.sh
COPY ./post-create.sh /post-create.sh
RUN chmod +x /post-create.sh

# Copy config directory
COPY ./config /config

# Run server
WORKDIR /rpkmcserver
EXPOSE 25565
ENTRYPOINT /post-create.sh