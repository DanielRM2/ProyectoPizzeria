# Usar una imagen base de OpenJDK
FROM openjdk:17-jdk-slim as build

# Directorio de trabajo
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . .

# Dar permisos de ejecución al archivo mvnw
RUN chmod +x mvnw

# Construir el proyecto con Maven (asegurarse de que el archivo pom.xml esté presente)
RUN ./mvnw clean install

# Ejecutar el archivo JAR
CMD ["java", "-jar", "target/ProyectPizza-1.0.jar"]
