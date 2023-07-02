Class {
	#name : #GalaxyCircuitGameTest,
	#superclass : #TestCase,
	#instVars : [
		'die1',
		'die2',
		'anAmountOfLaps',
		'aSmallAmountOfSquares',
		'aPlayerName1',
		'aPlayerName2',
		'aPlayerName3'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWith: anAmountOfSquares of: square and: anAmountOfAUnit using: cards [

	| aGame aCollectionOfPlayerNames dice aDiceCup squares aBoard aDeck |
	
	aCollectionOfPlayerNames := OrderedCollection
		                      with: aPlayerName1
		                      with: aPlayerName2
		                      with: aPlayerName3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	squares := OrderedCollection new.
	anAmountOfSquares timesRepeat: [ squares add: square. ].
	aBoard := Board with: squares and: anAmountOfAUnit.
	aDeck := LoadedDeck with: cards.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfPlayerNames
		         and: aBoard
					and: anAmountOfLaps
		         uses: aDiceCup
					uses: aDeck.
	^ aGame.
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithRandomSquaresAndRandomCards [

	| aGame aCollectionOfShips dice aDiceCup squares anAmountOfParsecs aBoard randomSquareGenerator anAmountOfSquares squaresToUse distribution aSpeedCard anOverloadCard cards aDeck values aValue1 |
	
	aCollectionOfShips := OrderedCollection
		                      with: aPlayerName1
		                      with: aPlayerName2
		                      with: aPlayerName3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	anAmountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	values := OrderedCollection new.
	aValue1 := Parsec with: 4.
	values add: aValue1.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: values).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	distribution := #( 2 8 10 20 20 40 ) asOrderedCollection.
	randomSquareGenerator := SquareGenerator
		                         with: anAmountOfSquares 
		                         of: squaresToUse
		                         using: distribution.
	squares := randomSquareGenerator generateSquares.
	aSpeedCard := SpeedCard new.
	anOverloadCard := OverloadCard new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	cards add: anOverloadCard.
	aDeck := Deck with: cards.
	aBoard := Board with: squares and: anAmountOfParsecs.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
		         and: aBoard
					and: anAmountOfLaps
		         uses: aDiceCup
					uses: aDeck.
	^ aGame.	
]

{ #category : #running }
GalaxyCircuitGameTest >> setUp [
	
	super setUp.	
		
	aPlayerName1 := 'Mafalda'.
	aPlayerName2 := 'Juan'.
	aPlayerName3 := 'Martin'.
	anAmountOfLaps := 5.
	die1 := LoadedDie with: #( 7 5 3) asOrderedCollection.
	die2 := LoadedDie with: #( 7 6 2) asOrderedCollection.

	

	
	

]

{ #category : #asserting }
GalaxyCircuitGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
GalaxyCircuitGameTest >> test001AGameCanStartWithManyShipsAndCanPlayATurnAndTheCurrentTurnAdvancesByOne [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 4.
	anAmountOfParsecs := Parsec with: 4.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: aGame currentTurn equals: 'Juan'.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test002AGameCanPlayEveryPlayersTurnAtLeastOnce [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
	self assert: ((aGame shipPositions) at: 2) equals: 12.
	self assert: ((aGame shipPositions) at: 3) equals: 6.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test003AGameCanBePlayEveryPlayersTurnAndThenStartAnotherRound [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame currentTurn equals: 'Mafalda'.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test004AGameCanTellMeTheWinner [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 2.
	anAmountOfParsecs := Parsec with: 2.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame winner) owner) equals: aPlayerName1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test005AGameWithoutAWinnerWillReturnNothing [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 20.
	anAmountOfParsecs := Parsec with: 20.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.
		
	self assert: ((aGame winner) isNil).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test006AGameWithAWinnerCannotBePlayed [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 2.
	anAmountOfParsecs := Parsec with: 2.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.

	aGame playTurn.

	self
		should: [ aGame playTurn ]
		raise: Error
		withMessage: 'Unable to play, Game has already finished'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test007AGameWithManyShipsCanTellMeItsShipsPositions [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.

	self
		assert: aGame shipPositions 
		equals: #( 1 1 1 ) asOrderedCollection
]

{ #category : #tests }
GalaxyCircuitGameTest >> test008AGameCannotStartWithDuplicatedShips [
	
	| aCollectionOfShips dice aDiceCup noEffectSquare squares anAmountOfParsecs aBoard aCard cards aDeck |
	
	aCollectionOfShips := OrderedCollection with: aPlayerName1 with: aPlayerName1.
	dice := OrderedCollection with: die1.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	aCard := SpeedCard new.
	cards := OrderedCollection with: aCard.
	aDeck := LoadedDeck with: cards.
	anAmountOfParsecs := Parsec with: 1.
	aBoard := Board with: squares and: anAmountOfParsecs.
	
	self
		should: [ GalaxyCircuitGame
				with: aCollectionOfShips
				and: aBoard
				and: anAmountOfLaps
				uses: aDiceCup
				uses: aDeck ]
		raise: Error
		withMessage: 'Ship already exists with that name'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test009AGameCannotStartWithZeroOrLowerAmountOfLaps [

	| aCollectionOfShips dice aDiceCup noEffectSquare squares anAmountOfParsecs aBoard invalidAmountOfLaps aCard cards aDeck |
	
	aCollectionOfShips := OrderedCollection with: aPlayerName1.
	dice := OrderedCollection with: die1.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	aCard := SpeedCard new.
	cards := OrderedCollection with: aCard.
	aDeck := LoadedDeck with: cards.
	anAmountOfParsecs := Parsec with: 4.
	aBoard := Board with: squares and: anAmountOfParsecs.
	invalidAmountOfLaps := -2.

	self
		should: [ 
			GalaxyCircuitGame
				with: aCollectionOfShips
				and: aBoard
				and: invalidAmountOfLaps
				uses: aDiceCup 
				uses: aDeck]
		raise: Error
		withMessage: 'Amount of laps cannot be 0 or lower'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test010AGameBoardIsCircularPlayersCanAdvanceLaps [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 10.
	anAmountOfParsecs := Parsec with: 10.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 5.
	self assert: ((aGame shipLaps) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test011AGameBoardIsCircularPlayersCanAdvanceManyLaps [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 4.
	anAmountOfParsecs := Parsec with: 4.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 3.
	self assert: ((aGame shipLaps) at: 1) equals: 4.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test012AGameWithOnlyNoEffectSquaresWontMoveShipsWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test013AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: SpeedUpSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 19.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test014AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquaresAndShipsCanAdvanceLapsWithTheEffect [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 16.
	anAmountOfParsecs := Parsec with: 16.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: SpeedUpSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 3.
	self assert: ((aGame shipLaps) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test015AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: WormholeSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test016AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquaresAndShipsCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	amountOfSquares := 12.
	anAmountOfParsecs := Parsec with: 12.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self
		         aGameWith: amountOfSquares
		         of: WormholeSquare new
		         and: anAmountOfParsecs
					using: cards.
	aGame playTurn.

	self assert: (aGame shipPositions at: 1) equals: 11.
	self assert: (aGame shipLaps at: 1) equals: 1
]

{ #category : #tests }
GalaxyCircuitGameTest >> test017AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquaresAndShipsCanGoBackManyLapsWithTheEffect [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	amountOfSquares := 2.
	anAmountOfParsecs := Parsec with: 2.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self
		         aGameWith: amountOfSquares
		         of: WormholeSquare new
		         and: anAmountOfParsecs
					using: cards.

	aGame playTurn.

	self assert: (aGame shipPositions at: 1) equals: 1.
	self assert: (aGame shipLaps at: 1) equals: 6.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test018AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: AtomicBombSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 1.
	self assert: ((aGame shipPositions) at: 2) equals: 1.
	self assert: ((aGame shipPositions) at: 3) equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test019AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquaresButTheyKeepTheLapsDone [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 10.
	anAmountOfParsecs := Parsec with: 10.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: AtomicBombSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipLaps) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test020AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aMoonwalkSquare anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	aMoonwalkSquare := MoonwalkSquare with: 4.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: aMoonwalkSquare and: anAmountOfParsecs using: cards.

	aGame playTurn.
	aGame playTurn.
	
	self assert: (aGame shipPositions at: 1) equals: 11.
	self assert: (aGame shipPositions at: 2) equals: 8
]

{ #category : #tests }
GalaxyCircuitGameTest >> test021AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquaresCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares aMoonwalkSquare anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 12.
	aMoonwalkSquare := MoonwalkSquare with: 4.
	anAmountOfParsecs := Parsec with: 12.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: aMoonwalkSquare and: anAmountOfParsecs using: cards.
	
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
	self assert: ((aGame shipLaps) at: 1) equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test022AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aHyperJumpSquare anAmountOfParsecs aSpeedCard cards values aValue1 |
	
	amountOfSquares := 30.
	values := OrderedCollection new.
	aValue1 := Parsec with: 21.
	values add: aValue1.
	aHyperJumpSquare := HyperJumpSquare with: values.
	anAmountOfParsecs := Parsec with: 60.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 25.5.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test023AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquaresCanAdvanceLapsWithTheEffect [

	| aGame amountOfSquares aHyperJumpSquare anAmountOfParsecs aSpeedCard cards values aValue1 |
	
	amountOfSquares := 30.
	values := OrderedCollection new.
	aValue1 := Parsec with: 40.
	values add: aValue1.
	aHyperJumpSquare := HyperJumpSquare with: values.
	anAmountOfParsecs := Parsec with: 60.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: anAmountOfParsecs using: cards.

	aGame playTurn.

	self assert: (aGame shipLaps at: 1) equals: 2
]

{ #category : #tests }
GalaxyCircuitGameTest >> test024AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsBackwardsWhenTheyLandOnThoseSquaresCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares aHyperJumpSquare anAmountOfParsecs aSpeedCard cards values aValue1 |
	
	amountOfSquares := 10.
	values := OrderedCollection new.
	aValue1 := Parsec with: -21.
	values add: aValue1.
	aHyperJumpSquare := HyperJumpSquare with: values.
	anAmountOfParsecs := Parsec with: 20.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: anAmountOfParsecs using: cards.

	aGame playTurn.

	self assert: (aGame shipLaps at: 1) equals: 1.
	self assert: ((aGame shipPositions) at: 1) equals: 4.5.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test025AGameCanGiveMeARankingOfItsShips [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipRanking at: 1) owner) equals: aPlayerName1.
	self assert: ((aGame shipRanking at: 2) owner) equals: aPlayerName2.
	self assert: ((aGame shipRanking at: 3) owner) equals: aPlayerName3.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test026AGameCanPlayUsingABoardThatHasRandomSquares [

	| aGame |
	
	aGame := self aGameWithRandomSquaresAndRandomCards.
	
	aGame playTurn.
	aGame playTurn.
	
	self assert: (aGame currentTurn) equals: 'Martin'.
	
]

{ #category : #tests }
GalaxyCircuitGameTest >> test027AGameShipCanLandOnTheLastSquareWhenMovingLaps [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards |
	
	amountOfSquares := 5.
	anAmountOfParsecs := Parsec with: 5.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 5.
	self assert: ((aGame shipLaps) at: 1) equals: 3.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test028AGameCanPlayASpeedPermanentCardUsingADeckWithOnlySpeedCardsThenTheTargetShipMovesAnExtraSquareWhenItMoves [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aCardOwner aTargetShip cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 16.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test029AGameCanPlayManySpeedPermanentCardAndItsEffectStacks [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aCardOwner aTargetShip cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 17.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test030AGameCanPlayAnOverloadPermanentCardUsingADeckWithOnlyPermanentCardsThenTheTargetShipMovesTwoSquaresLessWhenItMoves [

	| aGame amountOfSquares anAmountOfParsecs anOverloadCard aCardOwner aTargetShip cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	anOverloadCard := OverloadCard new.
	cards := OrderedCollection with: anOverloadCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: anOverloadCard from: aCardOwner to: aTargetShip.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 13.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test031AGameCanPlayManyOverLoadPermanentCardAndItsEffectStacks [

	| aGame amountOfSquares anAmountOfParsecs anOverloadCard aCardOwner aTargetShip cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	anOverloadCard := OverloadCard new.
	cards := OrderedCollection with: anOverloadCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: anOverloadCard from: aCardOwner to: aTargetShip.
	aGame play: anOverloadCard from: aCardOwner to: aTargetShip.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test032AGameCanPlayAnAccelerationPermanentCardUsingADeckWithOnlyPermanentCardsThenAllShipsMoveAnExtraSquareWhenTheyMove [

	| aGame amountOfSquares anAmountOfParsecs anAccelerationCard aCardOwner aTargetShip cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	anAccelerationCard := AccelerationCard new.
	cards := OrderedCollection with: anAccelerationCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: anAccelerationCard from: aCardOwner to: aTargetShip.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 16.
	self assert: ((aGame shipPositions) at: 2) equals: 13.
	self assert: ((aGame shipPositions) at: 3) equals: 7.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test033AGameCanPlayManyAccelerationPermanentCardsAndItsEffectStacks [

	| aGame amountOfSquares anAmountOfParsecs anAccelerationCard aCardOwner aTargetShip cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	anAccelerationCard := AccelerationCard new.
	cards := OrderedCollection with: anAccelerationCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: anAccelerationCard from: aCardOwner to: aTargetShip.
	aGame play: anAccelerationCard from: aCardOwner to: aTargetShip.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 17.
	self assert: ((aGame shipPositions) at: 2) equals: 14.
	self assert: ((aGame shipPositions) at: 3) equals: 8.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test034AGameCannotPlayAPermanentCardIfTheOneUsingItIsNotTheCurrentTurnShip [

	| aGame amountOfSquares anAmountOfParsecs anAccelerationCard aCardOwner cards aTargetShip |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Juan'.
	aTargetShip := 'Mafalda'.
	anAccelerationCard := AccelerationCard new.
	cards := OrderedCollection with: anAccelerationCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	self
		should: [ aGame play: anAccelerationCard from: aCardOwner to: aTargetShip. ]
		raise: Error
		withMessage: 'Unable to play permanent card when its not your turn'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test035AGameCannotPlayAPermanentCardIfTheOneTryingToUseItDoesNotHaveTheCardInHand [

	| aGame amountOfSquares anAmountOfParsecs anAccelerationCard aTargetShip aCardOwner cards aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	anAccelerationCard := AccelerationCard new.
	cards := OrderedCollection with: anAccelerationCard.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	self
		should: [ aGame play: SpeedCard new from: aCardOwner to: aTargetShip. ]
		raise: Error
		withMessage: 'Unable to play card when the player does not own the card'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test036AGameInWhichPlayersStartWithTwoCardsRemovesThemFromTheirHandWhenPlayedAndTheyCantPlayCardsWithAnEmptyHand [

	| aGame amountOfSquares anAmountOfParsecs aTargetShip aCardOwner aSpeedCard cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	
	self
		should: [ aGame play: aSpeedCard from: aCardOwner to: aTargetShip.]
		raise: Error
		withMessage: 'Unable to play card when the player does not own the card'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test037AGameCanPlayACancellationInstantCardUsingALoadedDeckThenTheTargetCardIsRemoved [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aCancellationCard aCardOwner aTargetShip cards aTargetPlayedPermanent |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	aCancellationCard := CancellationCard new.
	aTargetPlayedPermanent := PlayedPermanent with: aSpeedCard to: aTargetShip.
	cards := OrderedCollection with: aSpeedCard with: aCancellationCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aCancellationCard from: aCardOwner to: aTargetPlayedPermanent.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test038AGameCanPlayACancellationInstantCardEvenWhenTheOwnerIsNotTheCurrentTurnShip [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aCancellationCard aCardOwner aTargetShip cards anotherCardOwner aTargetPlayedPermanent |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	anotherCardOwner := 'Juan'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	aCancellationCard := CancellationCard new.
	aTargetPlayedPermanent := PlayedPermanent with: aSpeedCard to: aTargetShip.
	cards := OrderedCollection with: aSpeedCard with: aCancellationCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aCancellationCard from: aCardOwner to: aTargetPlayedPermanent.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test039AGameCannotPlayACancellationInstantCardWhenTheTargetCardIsNotInEffect [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aCancellationCard aCardOwner aTargetShip cards aTargetPlayedPermanent |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	aCancellationCard := CancellationCard new.
	aTargetPlayedPermanent := PlayedPermanent with: aSpeedCard to: aTargetShip.
	cards := OrderedCollection with: aSpeedCard with: aCancellationCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	self
		should: [ aGame play: aCancellationCard from: aCardOwner to: aTargetPlayedPermanent. ]
		raise: Error
		withMessage: 'Unable to cancel the permanent card because there is no such card in effect'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test040AGameCanPlayARedoCardUsingALoadedDeckThenTheLastPermanentCardPlayedIsUsed [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aRedoCard aCardOwner aTargetShip cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	aRedoCard := RedoCard new.
	cards := OrderedCollection with: aSpeedCard with: aRedoCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aRedoCard from: aCardOwner to: aTargetShip.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 17.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test041AGameCanPlayARedoCardUsingALoadedDeckThenTheLastPermanentCardPlayedIsUsedAndCanTargetADifferentShip [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aRedoCard aCardOwner aTargetShip cards anotherTargetShip |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	anotherTargetShip := 'Juan'.
	aSpeedCard := SpeedCard new.
	aRedoCard := RedoCard new.
	cards := OrderedCollection with: aSpeedCard with: aRedoCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aRedoCard from: aCardOwner to: anotherTargetShip.
	aGame playTurn.
	aGame playTurn.
	
	self assert: ((aGame shipPositions) at: 1) equals: 16.
	self assert: ((aGame shipPositions) at: 2) equals: 13.	
]

{ #category : #tests }
GalaxyCircuitGameTest >> test042AGameCannotPlayARedoCardIfItRepeatsAPermanentCardOnTheWrongTurn [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aRedoCard aCardOwner aTargetShip cards anotherCardOwner |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	anotherCardOwner := 'Juan'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	aRedoCard := RedoCard new.
	cards := OrderedCollection with: aSpeedCard with: aRedoCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	
	self
		should: [ aGame play: aRedoCard from: anotherCardOwner to: aTargetShip. ]
		raise: Error
		withMessage: 'Unable to play permanent card when its not your turn'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test043AGameCanPlayARedoCardUsingALoadedDeckThenTheLastInstantCardPlayedIsUsed [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aRedoCard aCardOwner aTargetShip cards aCancellationCard anotherCardOwner aTargetPlayedPermanent |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	anotherCardOwner := 'Juan'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	aCancellationCard := CancellationCard new.
	aRedoCard := RedoCard new.
	aTargetPlayedPermanent := PlayedPermanent with: aSpeedCard to: aTargetShip.
	cards := OrderedCollection with: aSpeedCard with: aSpeedCard with: aRedoCard with: aCancellationCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aCancellationCard from: anotherCardOwner to: aTargetPlayedPermanent.
	aGame play: aRedoCard from: anotherCardOwner to: aTargetPlayedPermanent.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test044AGameCannotPlayARedoCardIfNoCardsWhereUsed [

	| aGame amountOfSquares anAmountOfParsecs aRedoCard aCardOwner aTargetShip cards |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aRedoCard := RedoCard new.
	cards := OrderedCollection with: aRedoCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	self
		should: [ aGame play: aRedoCard from: aCardOwner to: aTargetShip. ]
		raise: Error
		withMessage: 'Cannot Redo Card, no card has been played yet'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test045AGameCanPlayARepeatCardUsingALoadedDeckAndABoardWithOnlySpeedUpSquaresThenTheSquareEffectIsRepeated [

	| aGame amountOfSquares anAmountOfParsecs aCardOwner aTargetShip cards aRepeatCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aRepeatCard := RepeatCard new.
	cards := OrderedCollection with: aRepeatCard.
	aGame := self aGameWith: amountOfSquares of: SpeedUpSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.
	aGame play: aRepeatCard from: aCardOwner to: aTargetShip.

	self assert: ((aGame shipPositions) at: 1) equals: 23.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test046AGameCanPlayARepeatCardUsingALoadedDeckAndABoardWithOnlyMoonwalkSquaresThenTheSquareEffectIsRepeatedAndCenteredOnTargetShip [

	| aGame amountOfSquares anAmountOfParsecs aCardOwner aTargetShip cards aRepeatCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aRepeatCard := RepeatCard new.
	cards := OrderedCollection with: aRepeatCard.
	aGame := self aGameWith: amountOfSquares of: (MoonwalkSquare with: 4) and: anAmountOfParsecs using: cards.
	
	aGame playTurn.
	aGame playTurn.
	aGame play: aRepeatCard from: aCardOwner to: aTargetShip.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
	self assert: ((aGame shipPositions) at: 2) equals: 4.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test047AGameCanPlayARepeatInstantCardEvenWhenTheOwnerIsNotTheCurrentTurnShip [

	| aGame amountOfSquares anAmountOfParsecs aCardOwner aTargetShip cards aRepeatCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Juan'.
	aTargetShip := 'Mafalda'.
	aRepeatCard := RepeatCard new.
	cards := OrderedCollection with: aRepeatCard.
	aGame := self aGameWith: amountOfSquares of: SpeedUpSquare new and: anAmountOfParsecs using: cards.
	
	aGame playTurn.
	aGame play: aRepeatCard from: aCardOwner to: aTargetShip.

	self assert: ((aGame shipPositions) at: 1) equals: 23.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test048AGameCanPlayARepeatInstantCardEvenWhenNoOneHasPlayedThenRepeatsANoEffectSquare [

	| aGame amountOfSquares anAmountOfParsecs aCardOwner aTargetShip cards aRepeatCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 30.
	aCardOwner := 'Juan'.
	aTargetShip := 'Mafalda'.
	aRepeatCard := RepeatCard new.
	cards := OrderedCollection with: aRepeatCard.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs using: cards.
	
	aGame play: aRepeatCard from: aCardOwner to: aTargetShip.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test049AGameWithOnlyDrawCardSquaresGivesPlayersAnotherCardThenTheyCanPlayAnExtraCardBesidesTheirTwoStartingCards [
	| aGame amountOfSquares anAmountOfParsecs aSpeedCard cards aCardOwner aTargetShip |
	
	amountOfSquares := 30.
	anAmountOfParsecs := Parsec with: 60.
	aCardOwner := 'Mafalda'.
	aTargetShip := 'Mafalda'.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: CardSquare new and: anAmountOfParsecs using: cards.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame play: aSpeedCard from: aCardOwner to: aTargetShip.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test050AGameWithABoardInLightYearsAndWithOnlyHyperJumpSquaresMovesShipsAnAmountOfLightYearsFowardWhenTheyLandOnThoseSquares [
	| aGame amountOfSquares aHyperJumpSquare anAmountOfParsecs aSpeedCard cards values aValue1 |
	
	amountOfSquares := 30.
	values := OrderedCollection new.
	aValue1 := LightYear with: 20.
	values add: aValue1.
	aHyperJumpSquare := HyperJumpSquare with: values.
	anAmountOfParsecs := LightYear with: 180.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: anAmountOfParsecs using: cards.

	aGame playTurn.

	self assert: (aGame shipLaps at: 1) equals: 1.
	self assert: ((aGame shipPositions) at: 1) equals: (55/3).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test051AGameWithABoardInLightYearsAndWithOnlyHyperJumpSquaresMovesShipsAnAmountOfLightYearsOrParsecsFowardWhenTheyLandOnThoseSquares [
	| aGame amountOfSquares aHyperJumpSquare anAmountOfParsecs aSpeedCard cards values aValue1 aValue2 |
	
	amountOfSquares := 30.
	values := OrderedCollection new.
	aValue1 := LightYear with: 20.
	aValue2 := Parsec with: 5.
	values add: aValue1.
	values add: aValue2.
	aHyperJumpSquare := HyperJumpSquare with: values.
	anAmountOfParsecs := LightYear with: 180.
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection with: aSpeedCard.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: anAmountOfParsecs using: cards.

	aGame playTurn.
	aGame playTurn.
	
	self assert: ((aGame shipPositions) at: 1) equals: (55/3).
	self assert: ((aGame shipPositions) at: 2) equals: 14.5.
]
