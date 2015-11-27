# Description:
#   Allows Hubot to roll dice
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
# dice help - List dice game commands"
# dice play - Add yourself to the game and play"
# dice sum - Display summary of current game"
# dice clear - Remove data list from current game"
#
# Author:
#   trungnghia112@gmail.com


helpSummary = "Dice game commands:_"
helpSummary += "\n`dice help` - List dice game commands"
helpSummary += "\n`dice play` - Add yourself to the game and play"
helpSummary += "\n`dice sum` - Display summary of current game"
helpSummary += "\n`dice clear` - Remove data list from current game"


#https://www.dropbox.com/s/yua085v1dkyu6vn/dice1.gif?dl=0
#https://www.dropbox.com/s/jvew9ih42tonx1y/dice2.gif?dl=0
#https://www.dropbox.com/s/96831bp3iy7x0rj/dice3.gif?dl=0
#https://www.dropbox.com/s/d6oy7evpzjlzgj2/dice4.gif?dl=0
#https://www.dropbox.com/s/fblvddgnm17l6b8/dice5.gif?dl=0
#https://www.dropbox.com/s/y1mvg14xyvi2nc5/dice6.gif?dl=0

diceGif = [":dice-1:",":dice-2:",":dice-3:",":dice-4:",":dice-5:",":dice-6:"]


objScore = {}
dbDice = []

oneDice = [1,2,3,4,5,6]

sender = (msg) ->
  return msg.message.user.name.toLowerCase()

checkPlayerExists = (my_item, my_array) ->
  for item in my_array
      return true if item.player == my_item
  false

module.exports = (robot) ->
  
  key = 'dice-table'
  
  robot.hear /dice help$/i, (msg) ->
    msg.send helpSummary
  
  robot.hear /play dice$/i, (msg) ->
    msg.send "It has changed to `dice play`. View commands `dice help`"
  
  robot.hear /dice clear$/i, (msg) ->
    robot.brain.set(key, [])
    msg.reply "Roll table has clean."
  
  robot.hear /dice sum$/i, (msg) ->
    messages = robot.brain.get(key) ? []
    
    if messages.length > 0
      message = messages.map (i) ->
        "#{i.player} : `#{i.score}`"
        
      .join '\n'
      msg.send message
    else
      msg.reply "Nothing to show for it"
  
  robot.hear /dice play$/i, (msg) ->
    player = sender(msg)

    OD1  = msg.random oneDice
    OD2  = msg.random oneDice
    
    score = OD1 + OD2
    
    dices1GIF = diceGif[OD1-1]
    dices2GIF = diceGif[OD2-1]
    
    
    diceScores = robot.brain.get(key) ? []
    objScore = { score, player }
    
    checkPlayer = robot.brain.get(key) ? []
    #console.log(checkPlayer.length)
    if checkPlayer.length > 0
      
      if (checkPlayerExists(player,checkPlayer))
        msg.reply "Please wait for next round. You can type `dice help`"
      else
        diceScores.push objScore
        robot.brain.set(key, diceScores)
        msg.reply "#{dices1GIF}#{dices2GIF}\nI rolled #{OD1} and #{OD2}, making `#{score}`."
          
    else
      diceScores.push objScore
      robot.brain.set(key, diceScores)
      msg.reply "#{dices1GIF}#{dices2GIF}\nI rolled #{OD1} and #{OD2}, making `#{score}`."
    
    
    