# Face to Gif
#
# Description:
#   Interfaces with our custom facetogif instance
#
# Commands:
#   gif me - Send me the link

		
module.exports = (robot) ->
	stylespath    = process.cwd() + (process.env.EXPRESS_STATIC || "/public") + "/styles/"

	# robot.sass.renderFile 
	# 	file: "#{stylespath}sass/facetogif.scss"
	# 	outFile: "#{stylespath}facetogif.css"
	# 	outputStyle: "compressed"
	# 	success: () ->
	# 		console.log "CSS compressed and saved: facetogif.scss"
	# 	error: (error) ->
	# 		console.log(error)

	robot.respond /gif me$/i, (msg) ->
		console.log process.env
		host = process.env.HEROKU_URL || "http://localhost:8080"
		msg.send "#{host}/facetogif?user=#{msg.message.user.id}"

	robot.router.get '/facetogif', (request, response) ->
		response.end homeContents "TRENDSPACE - Face to GIF"

	robot.router.post 'facetogif/posttotrendspace/:dataId', (request, response) ->
		dataId = request.param "dataId"
		robot.messageRoom 595758, "http://i.imgur.com/#{dataId}.gif"
		response.end "success"

homeContents = (title) ->
	"""
	<!doctype html>
	<html>
	  <head>
	    <meta charset=utf-8>
	    <title>#{title}</title>
	    <link href="/styles/facetogif.css" rel="stylesheet" />
	    <meta name=viewport content="width=device-width, initial-scale=1.0">
	  </head>
	  <body>
	    <div class=container>
	      <button class="ui-button request-stream" id=put-your-face-here>put your face here</button>
	      <span class=recording-indicator id=recording-indicator></span>
	      <video autoplay height=480 width=640 ></video>
	      <div class="gif-maker-size-controls">
	        <input id=gif-size-small-checkbox name=gif-size tabindex=-1 type=radio value=small ><label class="size-setting small" for=gif-size-small-checkbox title="200x150"></label>
	        <input id=gif-size-square-checkbox name=gif-size tabindex=-1 type=radio value=square ><label class="size-setting square" for=gif-size-square-checkbox title="250x250"></label>
	        <input checked id=gif-size-normal-checkbox name=gif-size tabindex=-1 type=radio value=normal ><label class="size-setting normal" for=gif-size-normal-checkbox title="320x240 (default)"></label>
	        <input id=gif-size-full-checkbox name=gif-size tabindex=-1 type=radio value=full ><label class="size-setting full" for=gif-size-full-checkbox title="640x480"></label>
	      </div>
	      <div class="gif-maker-controls">
	        <button class="ui-button recording-toggle" id=start-recording>start recording</button>
	        <button class="ui-button pause-recording recording-toggle" id=pause-recording>||</button>
	      </div>
	      <output id=gifs-go-here></output>
	      <div id=faq class="faq-container separate">
	        <dl class="faqesq">

	          <dt class="faq">Show us your butt
	          <dd class="faqa">Record a gif to share in Trendspace

	        </dl>
	        </div>
	      </div>
	    </div>

	    <div id="controls-template" class="controls">
	      <a class="ui-button download img control" download=your-giffed-face.gif>Download gif</a>
	      <a class="ui-button upload img control to-imgur" href=http://imgur.com target=_blank>Trendspace</a>
	      <a class="ui-button remove img control to-danger">x</a>
	    </div>
	  <script src="/js/facetogif/js/vendor/gif.js"></script>
	  <script src="/js/facetogif/js/app.js"></script>
	  </body>
	</html>

	"""