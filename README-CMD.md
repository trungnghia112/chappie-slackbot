# 
# Deloy
#
# IMVN
$ HUBOT_SLACK_TOKEN=xoxb-15128939907-T6O8tVHeOFcUHPrULGS3vY37 ./bin/hubot --adapter slack
# trungnghia112
$ HUBOT_SLACK_TOKEN=xoxb-15135766178-0gKrV6rY6ePwDe60OQgXtRBL ./bin/hubot --adapter slack


#
# Create
#

$ heroku login
Enter your Heroku credentials.
Email: adam@example.com
Password (typing will be hidden):
Authentication successful.


$ heroku create chappie-slackbot
$ heroku addons:create rediscloud:30

$ heroku config:add HEROKU_URL=https://chappie-slackbot.herokuapp.com
$ heroku config:add HUBOT_SLACK_TOKEN=xoxb-15135766178-0gKrV6rY6ePwDe60OQgXtRBL

$ git push heroku master

#
# Clone
#

$ heroku login

$ heroku git:clone -a chappie-slackbot
$ cd chappie-slackbot

$ git add .
$ git commit -am "make it better"
$ git push heroku master


#
# Some bug
#

# node update
sudo npm cache clean -f
sudo npm install -g n
sudo n stable


#
# Setup
#
$ npm install -g hubot coffee-script yo generator-hubot