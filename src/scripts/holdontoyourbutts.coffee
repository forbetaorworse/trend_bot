# Description:
#   Display a "hold onto your butts" pic
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hold onto your butts - display a "hold onto your butts" pic
#
# Author:
#   SonicBoom

butts = [
  "http://i306.photobucket.com/albums/nn248/dreggorymcgee/Movies/Hold-onto-your-butts-1.jpg",
  "http://i.chzbgr.com/completestore/2010/4/6/129150129111313546.jpg",
  "http://media.tumblr.com/tumblr_m9syko4BbM1r5h6p7.jpg",
  "http://fc00.deviantart.net/fs70/f/2012/109/4/8/keep_calm_and_hold_on_to_your_butts_by_mr_saxon-d4wvxge.png",
  "http://a1.s6img.com/cdn/box_002/post_12/339358_4045215_lz.jpg",
  "http://drawception.com/pub/panels/2012/4-16/CyAbRE5Fhh-2.png",
  "http://drawception.com/pub/panels/2012/4-2/tgNqREOakY-2.png"
]

module.exports = (robot) ->
  robot.hear /hold on ?to your butts?/i, (msg)->
    msg.send msg.random butts
