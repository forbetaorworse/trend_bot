# Description:
# 	This is the main web config for TRENDSPACE
#	All additional libraries and configs required
#	To power the site belong here
#
# Author:
#	Eric M.F. Westbrook
#

View = require '../view'

module.exports = (@robot) ->

	robot.router.get '/ultimatetest', (request, response) ->
		data = 
			testVar: "What a var!"
			anotherVar: "What another var!"
		response.render 'helloWorld', data



	robot.router.get '/ultimatetesttwo', (request, response) ->
		data = 
			testVar: "What a new var!"
			anotherVar: "Does this work?"
		view = @robot.view.getView "helloWorld", data
		response.end view