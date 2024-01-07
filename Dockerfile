FROM ubuntu:latest

# Atualizar o sistemas e suas dependências
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y apache2 php libapache2-mod-php php-gd && \
    rm -rf /var/lib/apt/lists/*

# Baixar e extrair o DokuWiki
RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz && \
    tar -zxvf dokuwiki-stable.tgz && \
    rm dokuwiki-stable.tgz && \
    mv dokuwiki-*/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
