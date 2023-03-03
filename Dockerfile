# Imagem base
FROM openjdk:11-jdk-slim

# Variáveis de ambiente
ENV INTELLIJ_VERSION 2022.3.2
ENV INTELLIJ_DOWNLOAD_URL https://download.jetbrains.com/idea/ideaIC-$INTELLIJ_VERSION.tar.gz

# Instalação do IntelliJ IDEA
RUN apt-get update && apt-get install -y curl \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libfreetype6 \
    libxi6 \
    libgtk-3-0
RUN curl -fsSL $INTELLIJ_DOWNLOAD_URL -o intellij.tar.gz \
    && tar -xzf intellij.tar.gz \
    && rm -rf intellij.tar.gz \
    && mv idea-* /opt/intellij \
    && ln -s /opt/intellij/bin/idea.sh /usr/local/bin/idea

# Diretório de trabalho
WORKDIR /workspace

# Comando padrão
CMD ["idea"]
