# Description:
#   Delegate your birthday greetings, celebrations and quotes to Hubot.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot birthday quote for <user> -- congratulate <user> with a random birthday quote
#   hubot celebrate me <user> -- congratulate <user> with an inspirational greeting
#   hubot happy birthday me <user> -- congratulate <user> with a humorous greeting
#
# Author:
#   sopel

module.exports = (robot) ->

  robot.hear /(birthday quote)( for )?(.*)/i, (msg)->
    name = msg.match[3].trim()
    if name.length == 0
      msg.send(quote())
    else
      msg.send(name + " - here's a quote for you: ")
      msg.send(quote(name))

    robot.emit 'slack.attachment',
      message: msg.message
      content:
        # see https://api.slack.com/docs/attachments
        fields: [{
          value: robotAtchs[(Math.random() * robotAtchs.length) >> 0]
        }]

  robot.hear /(happy birthday)( me )?(.*)/i, (msg)->
    name = msg.match[3].trim()
    if name.length == 0
      msg.send(quote())
    else
      msg.send(greeting(name))

    robot.emit 'slack.attachment',
      message: msg.message
      content:
        # see https://api.slack.com/docs/attachments
        fields: [{
          value: robotAtchs[(Math.random() * robotAtchs.length) >> 0]
        }]


  robot.hear /(celebrate)( me )?(.*)/i, (msg)->
    name = msg.match[3].trim()
    if name.length == 0
      msg.send("You must be kidding.")
    else
      msg.send(celebrate(name))

    robot.emit 'slack.attachment',
      message: msg.message
      content:
        # see https://api.slack.com/docs/attachments
        fields: [{
          value: robotAtchs[(Math.random() * robotAtchs.length) >> 0]
        }]


celebrate = (name) ->
  celebrates[(Math.random() * celebrates.length) >> 0].replace(/{name}/, name);

celebrates = [
  "{name} - Hoping that your day will be as special as you are.",
  "{name} - Count your life by smiles, not tears. Count your age by friends, not years.",
  "May the years continue to be good to you. Happy Birthday {name}!",
  "{name} - You're not getting older, you're getting better.",
  "{name} - May this year bring with it all the success and fulfillment your heart desires.",
  "{name} - Wishing you all the great things in life, hope this day will bring you an extra share of all that makes you happiest.",
  "Happy Birthday {name}, and may all the wishes and dreams you dream today turn to reality.",
  "May this day bring to you all things that make you smile. Happy Birthday {name}!",
  "{name} - Your best years are still ahead of you.",
  "{name} - Birthdays are filled with yesterday's memories, today's joys, and tomorrow's dreams.",
  "{name} - Hoping that your day will be as special as you are.",
  "{name} - You'll always be forever young."
]


greeting = (name) ->
  greetings[(Math.random() * greetings.length) >> 0].replace(/{name}/, name);

greetings = [
  "{name} are a person who always deserves the best and obviously nothing less. Wish your birthday celebration will be as fantastic as you are. Happy birthday."
  "{name} - Happy Birthday to someone who is forever young",
  "{name} - May your special day be filled with memories and flowers, friendship and happy hours.",
  "My birthday gift for {name} is: a whole lot of love, to wish you a day that’s as special as you are. Happy birthday card",
  "Happy Birthday Smile: sending {name} smiles for every moment of your special day. Have a wonderful time and a very happy birthday pictures.",
  "{name} - Let us never know what old age is. Let us know the happiness time brings, not count the years.",
  "{name} - On this special day, I wish you all the very best, all the joy you can ever have and may you be blessed abundantly today, tomorrow and the days to come! May you have a fantastic birthday and many more to come... HAPPY BIRTHDAY!!!!",
  "{name} - May your birthday be filled with many happy hours and your life with many happy birthdays. HAPPY BIRTHDAY !!",
  "{name} - You are special and I hope that you float through the day with a big smile on your face. Happy Birthday!",
  "Thinking of you on your birthday, and wishing {name} all the best! I hope it is as fantastic as you are, you deserve the best and nothing less.",
  "{name} - Hope you love your new age. It loves you because it looks good on you. Happy Birthday."
]


quote = () ->
  quotes[(Math.random() * quotes.length) >> 0];

quotes = [
  "Our birthdays are feathers in the broad wing of time. - Jean Paul Richter",
  "Inside every older person is a younger person wondering what happened. - Jennifer Yane",
  "Wisdom doesn't necessarily come with age. Sometimes age just shows up all by itself. - Tom Wilson",
  "May you stay forever young. - Bob Dylan",
  "The old believe everything; the middle-aged suspect everything; the young know everything. - Oscar Wilde",
  "Old age is like everything else. To make a success of it, you've got to start young. - Fred Astaire",
  "Age is a number and mine is unlisted. - Unknown",
  "When I was younger, I could remember anything, whether it happened or not.- Mark Twain",
  "Whatever with the past has gone, The best is always yet to come. - Lucy Larcom",
  "It takes a long time to grow young. - Pablo Picasso",
  "Few women admit their age. Few men act theirs. - Unkown",
  "The best way to remember your wife's birthday is to forget it once. - H. V. Prochnow"
]


robotAtchs = [
  "☀̤̣̈̇ː̖́.[̲̅̅H̲̅][̲̅̅A̲̅][​̲̅̅P̲̅][̲̅̅P̲̅][̲̅̅Y̲̅].ː̗​̀☀̤̣̈̇ː̖́..ː̗̀☀̤̣̈̇ː̖́.[̅̅​̲B̲̅][̲̅̅I̲̅][̲̅̅R̲̅][̲̅̅T​̲̅][̲̅̅H̲̅][̲̅̅D̲̅][̲̅̅A̲̅​][̲̅̅Y̲̅].ː̗̀☀"
  ".•*¨*•♫♪ ░H░A░P░P░Y░ (¯''•.¸*♥♥♥* ¸.•''¯) ░B░I░R░T░H░D░A░Y░ ♪♫•*¨*•.¸¸♫♪ ",
  "♥ ¸¸.•*¨*•♫♪ Happy Birthday to you ♪♫•*¨*•.¸¸♥ ",
  "\n
¸_./'\\._¸•¤**¤•…•¤**¤•…..•¤**¤•.¸.•¤**¤•\n
*•. .•*~* Happy Birthday to you! *~..**\n
/.•*•.\\._¸•¤**¤•…..•¤**¤•…•¤**¤•., .•¤**¤•\n"
]