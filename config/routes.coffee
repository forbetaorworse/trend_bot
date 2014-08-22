module.exports = (app, passport) ->
	trendspace = require '../controllers/trendspace'
	users = require '../controllers/users'

	#Home Route
	app.get '/', trendspace.index
	app.get '/users', trendspace.index

	# User Routes
	app.get '/login', users.login
	app.get '/signup', users.signup
	app.get '/logout', users.logout
	app.post '/users', users.create
	app.post '/users/session', passport.authenticate('local', [failureRedirect: '/login', failureFlash: 'Invalid email or password.']), users.session
	app.get '/users/:userId', users.show
	app.get '/auth/37signals', passport.authenticate('37signals', [failureRedirect: '/login', failureFlash: 'Unable to login to 37signals'])