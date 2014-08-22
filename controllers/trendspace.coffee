exports.index = (req, res) ->
	unless req.user
		#	not logged in DO DIFFERENT THINGS
 		res.redirect '/login'
	#	logged in DO THINGS 		
	data =
		title: "TRENDSPACE - Welcome!"
		
	res.render 'index', data