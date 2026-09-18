# ==========================================
# ÉTAPE 1 : Construction (Build) du projet
# ==========================================

FROM gradle:8.5-jdk21 AS build

# Install git
RUN apt-get update && apt-get install -y git

WORKDIR /app

# Clone the repository using the token
RUN git clone https://github.com/thier32/taskmanager.git .


RUN chmod +x gradlew

# Download dependencies of every module

#RUN ./gradlew clean bootJar


RUN ./gradlew dependencies --no-daemon

# Compile and package executable module
RUN ./gradlew :taskmanager-application:bootJar -x test --no-daemon

# ==========================================
# ÉTAPE 3 : Exécution en production (Runtime)
# ==========================================
FROM eclipse-temurin:21-jre-alpine


# Copier le fichier .jar généré spécifiquement dans le sous-module de build
# Adaptez 'app-api' par le nom de votre module principal
COPY --from=build /app/taskmanager-application/build/libs/*.jar app.jar

# Exposer le port de Spring Boot
EXPOSE 8091

# Lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]