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