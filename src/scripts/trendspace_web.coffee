# Description:
# 	This is the main web config for TRENDSPACE
#	All additional libraries and configs required
#	To power the site belong here
#
# Author:
#	Eric M.F. Westbrook
#


module.exports = (@robot) ->

	console.log "Here's the styles src: " + process.cwd() + "/src/styles"
	console.log "Here's the styles dest: " + process.cwd() + process.env.EXPRESS_STATIC + "/styles"