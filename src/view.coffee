# TRENDSPACE VIEWS

Fs = require 'fs'
iconvlite = require 'iconv-lite'

viewPath = __dirname + '/views'

class View
	getView: (name, data = {}) ->
		tempContent = Fs.readFileSync("#{viewPath}/#{name}.html", "utf-8")
		tempContent.replace /#{.*}/, (match) ->
			dataVar = data[match.replace(/\W/g, '')]
			tempContent = tempContent.replace match, dataVar
		return tempContent

module.exports = View

