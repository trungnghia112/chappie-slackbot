Select     = require("soupselect").select
HtmlParser = require "htmlparser2"


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

module.exports = (robot) ->
  robot.respond /test$/i, (msg) ->
    msg.http("http://haivn.com/photo/page/#{getRandomArbitrary(1,100)}")
    .get() (err, res, body) ->
      handler = new HtmlParser.DefaultHandler()
      parser  = new HtmlParser.Parser handler

      parser.parseComplete body

      results = Select handler.dom, ".haivl-photo a .image img"
      console.log(handler.dom)
      r = getRandomArbitrary(1,results.length)

      src = "http:"+results[r].attribs.src
      alt = escape_html_characters(results[r].attribs.alt)

      msg.send alt
      msg.send src

