# Face to Gif
#
# Description:
#   Interfaces with our custom facetogif instance
#
# Commands:
#   gif me - Send me the link

		
module.exports = (robot) ->
	robot.respond /gif me$/i, (msg) ->
		console.log process.env
		host = process.env.HEROKU_URL || "http://localhost:8080"
		msg.send "#{host}/facetogif?user=#{msg.message.user.id}"

	robot.router.get '/catan/test', (request, response) ->
		response.end homeContents "TRENDSPACE - Face to GIF"


homeContents = (title) ->
	"""
	<!doctype html>
	<html>
	  <head>
	    <meta charset=utf-8>
	    <title>#{title}</title>
	    <link href=app.css?v=1 rel=stylesheet>
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

	          <dt class="faq">What is this?
	          <dd class="faqa">face to gif is a simple webapp that lets you record yourself and gives you an infinitely looping animated gif

	          <dt class="faq">What is the output?
	          <dd class="faqa">face to gif outputs a gif @ 10 frames per second. The file may be a bit big, but you can use a <a href=https://www.google.com/search?q=gif+compressor target=_blank>gif optimizer</a>.
	          <dd class=faqa>You can configure the size once you start streaming by clicking the toggles on the preview image. The current sizes are 320 &times; 240 (default), 200 &times; 150, 640 &times; 480 and 250 &times; 250.

	          <dt class=faq>How can I upload to imgur?
	          <dd class=faqa>Just click the imgur button on the image. After the upload is done, the button will lead you to the imgur page. The button seems kind of small, but I can't really tell without a banana.
	          <dd class=faqa>Because of imgur's 2MB limit for gifs, I will try to upload the original or an optimised one if the original is too big.

	          <dt class="faq">It says something bad about my browser...
	          <dd class="faqa">face to gif uses some <a href=http://caniuse.com/stream target=_blank>new-ish APIs</a> that may not yet be supported in your browser.

	          <dt class="faq">What happens to my data?
	          <dd class="faqa">The application is completely client side. That means that nobody else will see your gif, stream or other actions on this app. Unless you save the gif and give it to them, of course.
	          <dd class="faqa">View the source, <a href=//github.com/hdragomir/facetogif/>inspect the source</a>.

	          <dt class=faq>What happens when I reload the page?
	          <dd class=faqa>All the data you generated will be lost unless you download or save the image to imgur. I keep no records of what you generate.

	          <dt class="faq">Why is there a delete button?
	          <dd class="faqa">To save your browser the trouble of continuously rendering an image you don't want anymore. You can also just refresh the page.

	          <dt class="faq">This is slow!
	          <dd class="faqa">Because everything happens client side, out of anyone else's control, the app is only as fast as your machine. Sorry.

	          <dt class=faq>I have something to say!
	          <dd class=faqa>You can talk to <a href=http://twitter.com/intent/tweet?in_reply_to=349586325768376321>@hdragomir on twitter</a> or create an <a href=https://github.com/hdragomir/facetogif/issues/new>issue on the github repo</a> or just <a href=http://hdragomir.com>email me</a>.

	          <dt class="faq">Face to GIF
	          <dd class="faqa">... was made by <a href=http://hdragomir.com/ target=_blank>Horia Dragomir</a> - UI Developer, Hungry and Foolish.
	            <form class="textish-form" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top"> <input type="hidden" name="cmd" value="_s-xclick"> <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7----- ">
	            <input type=submit border="0" name="submit" alt="PayPal - The safer, easier way to pay online!" value="Buy him a coffee?" class="linklike ui-text">
	            <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1"> </form>

	        </dl>
	        </div>
	      </div>
	    </div>

	    <div id="controls-template" class="controls">
	      <a class="ui-button download img control" download=your-giffed-face.gif>download gif</a>
	      <a class="ui-button upload img control to-imgur" href=http://imgur.com target=_blank>imgur</a>
	      <a class="ui-button remove img control to-danger">x</a>
	    </div>
	  <script src=js/vendor/gif.js></script>
	  <script src=js/app.js?v=1></script>
	  <script>
	    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	    ga('create', 'UA-1745893-13', 'hdragomir.github.io');
	    ga('send', 'pageview');
	  </script>
	  </body>
	</html>

	"""