Select     = require("soupselect").select
HtmlParser = require "htmlparser2"
_          = require "underscore"


getRandomArbitrary = (min, max) ->
  return Math.floor(Math.random() * (max - min) + min);

escape_html_characters = (text)->
  replacements = [
    [/&/g, '&amp;']
    [/</g, '&lt;']
    [/"/g, '&quot;']
    [/'/g, '&#039;']
  ]

  for r in replacements
    text = text.replace r[0], r[1]
  return text


dict9gag = ["funny", "nsfw", "wtf", "gif", "geeky", "meme", "cute", "comic", "cosplay", "food", "girl", "timely", "design"]
dictHaivl = ["haivl"]

module.exports = (robot) ->

#robot.hear /test (.*)$/i, (msg)->

  robot.hear /have (.*)$/i, (msg) ->

    type = msg.match[1].trim()

    search = null
    for v in dict9gag
      if v == type
        search = '9gag'
    for v in dictHaivl
      if v == type
        search = 'haivl'

    switch search
      when '9gag'
        get_data_9gag(msg, type)
      when 'haivl'
        get_data_haivl(msg)
      else
#msg.send "Sorry, something went wrong"


get_data_haivl = (msg)->
  link = "http://haivn.com/photo/page/#{getRandomArbitrary(1,100)}"
  soupselectArray = ".haivl-photo a .image img"
  get_data(msg,link,soupselectArray)

get_data_9gag = (msg, type)->
  link = "http://9gag.com/#{type}/fresh"
  soupselectArray = ".badge-entry-container .badge-post-container a img"
  get_data(msg,link,soupselectArray)

get_data = (msg,link,soupselectArray)->
  msg.http(link)
  .get() (err, res, body) ->
    handler = new HtmlParser.DefaultHandler()
    parser  = new HtmlParser.Parser handler

    parser.parseComplete body

    results = Select handler.dom, soupselectArray

    r = getRandomArbitrary(1,results.length)

    src = "http:"+results[r].attribs.src
    alt = escape_html_characters(results[r].attribs.alt)

    msg.send alt
    msg.send src

