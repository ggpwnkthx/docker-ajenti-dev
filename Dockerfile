FROM coach/ajenti
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -s
RUN apt-get install -y nodejs
RUN npm -g install bower babel-cli babel-preset-es2015 babel-plugin-external-helpers less coffee-script angular-gettext-cli angular-gettext-tools
RUN apt-get install -y gettext
RUN pip install ajenti-dev-multitool
COPY /entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]