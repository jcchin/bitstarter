#!/bin/bash

#--------------------------setup--ssjs.sh----------------

# Install node packages
npm install

echo -e "\n\nNOW ENTER YOUR HEROKU PASSWORD"
# Set up heroku.
#  - https://devcenter.heroku.com/articles/config-vars#setting-up-config-vars-for-a-deployed-application
#  - https://devcenter.heroku.com/articles/heroku-postgresql#provisioning-the-add-on
heroku login
#heroku create
echo -e "\n\nPress ENTER A FEW TIMES"
ssh-keygen -t rsa -C "jchin89@gmail.com" #press enter a few times
heroku keys:add
heroku addons:add heroku-postgresql:dev
heroku pg:promote `heroku config  | grep HEROKU_POSTGRESQL | cut -f1 -d':'`
heroku plugins:install git://github.com/ddollar/heroku-config.git

echo -e "\n\nCOPY THE OUTPUT TO GITHUB\n"
cat ~/.ssh/id_rsa.pub  #copy the output

# Set up heroku configuration variables
# https://devcenter.heroku.com/articles/config-vars
# IMPORTANT: 
#  - Edit .env to include your own COINBASE_API_KEY and HEROKU_POSTGRES_URL.
#  - Modify the .env.dummy file, and DO NOT check .env into the git repository.
#  - See .env.dummy for details.
# cp .env.dummy .env



# For local: setup postgres (one-time) and then run the local server
#-----------pgsetup.sh
./pgsetup.sh