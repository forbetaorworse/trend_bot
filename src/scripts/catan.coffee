# Description:
# 	Play Settlers of Catan in Trendspace. No fucking joke
#
# Commands:
#	hubot catan link - Send the link to the Catan page
# 	hubot catan games - Send me the links to my Settler's games
#	hubot catan challenge Users - Challenge a comma separated list of users to a game
#	hubot catan stats - Display catan player stats
#
#
# Author:
#	Eric Motherfucking Westbrook
#


# Object Classes

# Default game config

default_game_config = 
	landTilePlacement: 'default'
	portTilePlacement: 'default'


# App wrapper object
class Catan
	@cache = []
	constructor: (@robot) ->
		@cache = []
		@robot.brain.on 'loaded', =>
			if @robot.brain.data.catan
				@cache = @robot.brain.data.catan
	addGame: (game) ->
		@cache.push game
		@robot.brain.data.catan = @cache

# Game object
class Game
	# @game_config - The configuration of the game
	# @board - The board of the game
	# @dice - The dice of the game
	# @dev_deck - The deck of development cards

	# build_deck - Builds the development card deck
	build_deck: ->
		devDeckTemp = []
		for [1..@game_config.devDeck.knight]
			devCard = new DevCard 'knight'
			devDeckTemp.push devCard
		for [1..@game_config.devDeck.victoryPoint]
			devCard = new DevCard 'victoryPoint'
			devDeckTemp.push devCard
		for [1..@game_config.devDeck.road]
			devCard = new DevCard 'road'
			devDeckTemp.push devCard
		for [1..@game_config.devDeck.monopoly]
			devCard = new DevCard 'monopoly'
			devDeckTemp.push devCard
		devDeckTemp.shuffle()

	constructor: (game_config) ->
		@game_config = 
			landTilePlacement:
				game_config.landTilePlacement || default_game_config.landTilePlacement
			portTilePlacement:
				game_config.portTilePlacement || default_game_config.portTilePlacement
			landTileTypes:
				brick: 3
				desert: 1
				livestock: 4
				lumber: 4
				ore: 3
				wheat: 4
			portTileTypes:
				brickDeal: 1
				livestockDeal: 1
				lumberDeal: 1
				oreDeal: 1
				wheatDeal: 1
				wildcard: 4
			tileNumbers: [5,2,6,3,8,10,9,12,11,4,8,10,9,4,5,6,3,11]
			devDeck:
				knight: 14
				victoryPoint: 5
				road: 2
				monopoly: 2
				yearOfPlenty: 2
		@board = new Board @gameconfig
		@dice = new Dice
		@dev_deck = @build_deck()


# Player object
class Player
	constructor: (@game, @user) ->


# Board object
class Board
	# @landTiles - A collection of all the land tiles on the board
	# @portTiles - A collection of all the port tiles on the board
	# @thief - The thief
	constructor: (game_config) ->
		@thief = new Thief
		landTilesTemp = []
		if game_config.landTilePlacement == 'default'
				for [1..game_config.landTileTypes.brick]
					tile = new Tile 'brick'
					landTilesTemp.push tile
				for [1..game_config.landTileTypes.desert]
					tile = new Tile 'desert'
					landTilesTemp.push tile
				for [1..game_config.landTileTypes.livestock]
					tile = new Tile 'livestock'
					landTilesTemp.push tile
				for [1..game_config.landTileTypes.lumber]
					tile = new Tile 'lumber'
					landTilesTemp.push tile
				for [1..game_config.landTileTypes.ore]
					tile = new Tile 'ore'
					landTilesTemp.push tile
				for [1..game_config.landTileTypes.wheat]
					tile = new Tile 'wheat'
					landTilesTemp.push tile
			landTilesTemp.shuffle()
			count = 0
			countTwo = 0
			for [0..18]
				if landTilesTemp[count].type == 'desert'
					@thief.setLocation count
				else
					landTilesTemp[count].setTileNumber game_config.tileNumbers[countTwo]
					countTwo += 1

				count += 1
			@landTiles = landTilesTemp


		portTilesTemp = []
		if game_config.portTilePlacement == 'default'
				for [1..game_config.portTileTypes.brickDeal]
					tile = new Tile 'brickDeal'
					portTilesTemp.push tile
				for [1..game_config.portTileTypes.livestockDeal]
					tile = new Tile 'livestockDeal'
					portTilesTemp.push tile
				for [1..game_config.portTileTypes.lumberDeal]
					tile = new Tile 'lumberDeal'
					portTilesTemp.push tile
				for [1..game_config.portTileTypes.oreDeal]
					tile = new Tile 'oreDeal'
					portTilesTemp.push tile
				for [1..game_config.portTileTypes.wheatDeal]
					tile = new Tile 'wheatDeal'
					portTilesTemp.push tile
			portTilesTemp.shuffle()
			@portTiles = portTilesTemp;



# Tile object
class Tile
	# @type - The type of tile (brick, livestock, etc...)
	# @tileNumber - The number the dice must hit to claim a resource
	setTileNumber: (tileNumber) ->
		@tileNumber = tileNumber
		if @type.indexOf "Deal" > -1
			# Handle port tile associations
		else
			# Handle land tile associations
			if tileNumber == 0
				addCommonLand "B", 1, "F"
				addCommonLand "C", 1, "E"
				addCommonLand "C", 12, "A"
				addCommonLand "D", 12, "F"
				addCommonLand "E", 11, "A"
			else if tileNumber == 1
				addCommonLand "B", 2, "F"
				addCommonLand "C", 13, "A"
				addCommonLand "D", 13, "F"
				addCommonLand "D", 12, "B"
				addCommonLand "E", 12, "A"
				addCommonLand "E", 0, "C"
				addCommonLand "F", 0, "B"
			else if tileNumber == 2
				addCommonLand "C", 3, "A"
				addCommonLand "D", 3, "F"
				addCommonLand "D", 13, "B"
				addCommonLand "E", 13, "A"
				addCommonLand "E", 1, "C"
				addCommonLand "F", 1, "B"
			else if tileNumber == 3
				addCommonLand "A", 2, "C"
				addCommonLand "C", 4, "A"
				addCommonLand "D", 4, "F"
				addCommonLand "D", 14, "B"
				addCommonLand "E", 14, "A"
				addCommonLand "E", 13, "C"
				addCommonLand "F", 13, "B"
				addCommonLand "F", 2, "D"
			else if tileNumber == 4
				addCommonLand "A", 3, "C"
				addCommonLand "D", 5, "B"
				addCommonLand "E", 5, "A"
				addCommonLand "E", 14, "C"
				addCommonLand "F", 14, "B"
				addCommonLand "F", 3, "D"
			else if tileNumber == 5
				addCommonLand "A", 4, "E"
				addCommonLand "D", 6, "B"
				addCommonLand "E", 6, "A"
				addCommonLand "E", 15, "C"
				addCommonLand "F", 15, "B"
				addCommonLand "F", 14, "D"
			else if tileNumber == 6
				addCommonLand "A", 15, "C"
				addCommonLand "A", 5, "E"
				addCommonLand "B", 5, "D"
				addCommonLand "E", 7, "C"
				addCommonLand "F", 7, "B"
				addCommonLand "F", 15, "D"
			else if tileNumber == 7
				addCommonLand "A", 16, "C"
				addCommonLand "A", 15, "E"
				addCommonLand "B", 15, "D"
				addCommonLand "B", 6, "F"
				addCommonLand "C", 6, "E"
				addCommonLand "E", 8, "C"
				addCommonLand "F", 8, "B"
				addCommonLand "F", 16, "D"
			else if tileNumber == 8
				addCommonLand "A", 9, "C"
				addCommonLand "A", 17, "E"
				addCommonLand "B", 16, "D"
				addCommonLand "B", 7, "F"
				addCommonLand "C", 7, "E"
				addCommonLand "F", 9, "D"
			else if tileNumber == 9
				addCommonLand "A", 10, "C"
				addCommonLand "A", 17, "E"
				addCommonLand "B", 17, "D"
				addCommonLand "B", 16, "F"
				addCommonLand "C", 16, "E"
				addCommonLand "C", 8, "A"
				addCommonLand "F", 10, "D"
			else if tileNumber == 10
				addCommonLand "A", 11, "E"
				addCommonLand "B", 11, "D"
				addCommonLand "B", 17, "F"
				addCommonLand "C", 17, "E"
				addCommonLand "C", 9, "A"
				addCommonLand "D", 9, "F"
			else if tileNumber == 11
				addCommonLand "A", 0, "E"
				addCommonLand "B", 0, "D"
				addCommonLand "B", 12, "F"
				addCommonLand "C", 12, "E"
				addCommonLand "D", 17, "F"
				addCommonLand "D", 10, "B"
				addCommonLand "E", 10, "A"
			else if tileNumber == 12
				addCommonLand "A", 0, "C"
				addCommonLand "A", 1, "E"
				addCommonLand "B", 1, "D"
				addCommonLand "B", 13, "F"
				addCommonLand "C", 13, "E"
				addCommonLand "C", 18, "A"
				addCommonLand "D", 18, "F"
				addCommonLand "D", 17, "B"
				addCommonLand "E", 17, "A"
				addCommonLand "E", 11, "C"
				addCommonLand "F", 11, "B"
				addCommonLand "F", 0, "D"
			else if tileNumber == 13
				addCommonLand "A", 1, "C"
				addCommonLand "A", 1, "E"
				addCommonLand "B", 2, "D"
				addCommonLand "B", 3, "F"
				addCommonLand "C", 3, "E"
				addCommonLand "C", 14, "A"
				addCommonLand "D", 14, "F"
				addCommonLand "D", 18, "B"
				addCommonLand "E", 18, "A"
				addCommonLand "E", 12, "C"
				addCommonLand "F", 12, "B"
				addCommonLand "F", 1, "D"
			else if tileNumber == 14
				addCommonLand "A", 13, "C"
				addCommonLand "A", 3, "E"
				addCommonLand "B", 3, "D"
				addCommonLand "B", 4, "F"
				addCommonLand "C", 4, "E"
				addCommonLand "C", 5, "A"
				addCommonLand "D", 5, "F"
				addCommonLand "D", 15, "B"
				addCommonLand "E", 15, "A"
				addCommonLand "E", 18, "C"
				addCommonLand "F", 18, "B"
				addCommonLand "F", 13, "D"
			else if tileNumber == 15
				addCommonLand "A", 18, "C"
				addCommonLand "A", 14, "E"
				addCommonLand "B", 14, "D"
				addCommonLand "B", 5, "F"
				addCommonLand "C", 5, "E"
				addCommonLand "C", 6, "A"
				addCommonLand "D", 6, "F"
				addCommonLand "D", 7, "B"
				addCommonLand "E", 7, "A"
				addCommonLand "E", 16, "C"
				addCommonLand "F", 16, "B"
				addCommonLand "F", 18, "D"
			else if tileNumber == 16
				addCommonLand "A", 17, "C"
				addCommonLand "A", 18, "E"
				addCommonLand "B", 18, "D"
				addCommonLand "B", 15, "F"
				addCommonLand "C", 15, "E"
				addCommonLand "C", 7, "A"
				addCommonLand "D", 7, "F"
				addCommonLand "D", 8, "B"
				addCommonLand "E", 8, "A"
				addCommonLand "E", 9, "C"
				addCommonLand "F", 9, "B"
				addCommonLand "F", 17, "D"
			else if tileNumber == 17
				addCommonLand "A", 11, "C"
				addCommonLand "A", 12, "E"
				addCommonLand "B", 12, "D"
				addCommonLand "B", 18, "F"
				addCommonLand "C", 18, "E"
				addCommonLand "C", 16, "A"
				addCommonLand "D", 16, "F"
				addCommonLand "D", 9, "B"
				addCommonLand "E", 9, "A"
				addCommonLand "E", 10, "C"
				addCommonLand "F", 10, "B"
				addCommonLand "F", 11, "D"
			else if tileNumber == 18
				addCommonLand "A", 12, "C"
				addCommonLand "A", 13, "A"
				addCommonLand "B", 13, "D"
				addCommonLand "B", 14, "F"
				addCommonLand "C", 14, "E"
				addCommonLand "C", 15, "A"
				addCommonLand "D", 15, "F"
				addCommonLand "D", 16, "B"
				addCommonLand "E", 16, "A"
				addCommonLand "E", 17, "C"
				addCommonLand "F", 17, "B"
				addCommonLand "F", 12, "D"
	setCommonLand: (corner, neighborTile, neighborCorner) ->
		# Create associations between shared corners
	constructor: (type) ->
		@type = type

# Resource Card object
class Resource
	# @type - The type of resource (brick, livestock, etc...)
	constructor: (@game) ->
		@type = type



# Development card object
class DevCard
	# @type - The type of development card
	# @description - The description of the development card
	constructor:  ->
		@type = type


# Bank object
class Bank



# Thief Object
class Thief
	# @location - The tile loceation of the thief (0..18)
	setLocation: (location) ->
		@location = location



# Dice object
class Dice
	# @dieA - The value of dieA
	# @dieB - The value of dieB

	# roll - Roll the dice
	# total - Calculate the total value of the dice combined
	roll: ->
		@dieA = Math.floor(Math.random() * 6) + 1
		@dieB = Math.floor(Math.random() * 6) + 1
	total: ->
		@dieA + @dieB
	constructor: ->
		@dieA = 1;
		@dieB = 1;

# Road object
class Road

# Settlement object
class Settlement

# Town object
class Town

module.exports = (robot) ->
	catan = new Catan robot


# Shuffle array method
do -> Array::shuffle ?= ->
  for i in [@length-1..1]
    j = Math.floor Math.random() * (i + 1)
    [@[i], @[j]] = [@[j], @[i]]
  @
