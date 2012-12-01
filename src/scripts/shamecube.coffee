# Description:
#   Display a shamecube
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   shamecube - display a shamecube
#
# Author:
#   SonicBoom

module.exports = (robot) ->
  robot.hear /shame ?cube/i, (msg)->
    msg.send "http://25.media.tumblr.com/tumblr_mdtp3riBWS1r27kz7o1_250.gif"
