FROM coach/ajenti

# Install Dependancies
RUN apt-get -y install curl gettext

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -s
RUN apt-get install -y nodejs
RUN npm -g install bower babel-cli babel-preset-es2015 babel-plugin-external-helpers less coffee-script angular-gettext-cli angular-gettext-tools

# Install Ajenti 2 Development Tools
RUN pip install ajenti-dev-multitool

# Add Docker EntryPoint Script
COPY /entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]