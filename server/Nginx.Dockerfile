FROM ubuntu:22.04

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

# Configuring tzdata settings
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN DEBIAN_FRONTEND=noninteractive

# Ubuntu Library
RUN apt-get update -y && apt-get install -y nginx \
    git vim curl wget zip unzip gnupg\
    php8.1-fpm php-mbstring php-cli php-bcmath php-json php-xml php-zip php-pdo php-common php-tokenizer php-mysql php-curl php-gd php-intl php-soap php-xmlrpc \
    nodejs npm && npm install n -g && n stable && apt purge -y nodejs npm

# Composer    
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN rm -rf /var/lib/apt/lists/*

# Set permission (775 for directories, 664 for files)
RUN find /var/www/html -type d -exec chmod 775 {} \;
RUN find /var/www/html -type f -exec chmod 664 {} \;

WORKDIR /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
