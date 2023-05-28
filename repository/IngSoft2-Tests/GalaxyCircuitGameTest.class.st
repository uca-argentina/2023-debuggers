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
GalaxyCircuitGameTest >> aGameWith: anAmountOfSquares of: square and: parsecSize [

	| aGame aCollectionOfPlayerNames dice aDiceCup squares aBoard amountOfLaps |
	
	aCollectionOfPlayerNames := OrderedCollection
		                      with: aPlayerName1
		                      with: aPlayerName2
		                      with: aPlayerName3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	squares := OrderedCollection new.
	anAmountOfSquares timesRepeat: [ squares add: square. ].
	aBoard := Board with: squares.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfPlayerNames
		         and: aBoard
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithRandomSquares [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize aBoard randomSquareGenerator |
	
	aCollectionOfShips := OrderedCollection
		                      with: aPlayerName1
		                      with: aPlayerName2
		                      with: aPlayerName3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	randomSquareGenerator := SquareGenerator with: 30.
	squares := randomSquareGenerator generateSquares.
	aBoard := Board with: squares.
	parsecSize := 5.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
		         and: aBoard
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
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
GalaxyCircuitGameTest >> test001AGameCanStartWithASingleShipAndCanPlayATurn [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test002AGameCanStartWithManyShipsAndCanPlayATurnAndTheCurrentTurnAdvancesByOne [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 4.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: aGame currentTurn equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test003AGameCanPlayEveryPlayersTurnAtLeastOnce [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
	self assert: ((aGame shipPositions) at: 2) equals: 12.
	self assert: ((aGame shipPositions) at: 3) equals: 6.
	self assert: aGame currentTurn equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test004AGameCanBePlayEveryPlayersTurnAndThenStartAnotherRound [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame currentTurn equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test005AGameCanTellMeTheWinner [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 2.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame winner) name) equals: aPlayerName1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test006AGameWithoutAWinnerWillReturnNothing [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 20.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.
	
	aGame playTurn.
		
	self assert: ((aGame winner) isNil).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test007AGameWithAWinnerCannotBePlayed [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 1.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.

	aGame playTurn..

	self
		should: [ aGame playTurn ]
		raise: Error
		withMessage: 'Unable to play, Game has already finished'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test008AGameWithManyShipsCanTellMeItsShipsPositions [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.

	self
		assert: aGame shipPositions 
		equals: #( 1 1 1 ) asOrderedCollection
]

{ #category : #tests }
GalaxyCircuitGameTest >> test011AGameCannotStartWithDuplicatedShips [
	
	| aCollectionOfShips dice aDiceCup noEffectSquare squares aParsecSize aBoard |
	
	aCollectionOfShips := OrderedCollection with: aPlayerName1 with: aPlayerName1.
	dice := OrderedCollection with: die1.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	aBoard := Board with: squares.
	aParsecSize := 1.
	
	self
		should: [ GalaxyCircuitGame
				with: aCollectionOfShips
				and: aBoard
				and: anAmountOfLaps
				and: aParsecSize
				uses: aDiceCup ]
		raise: Error
		withMessage: 'Ship already exists with that name'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test012AGameCannotStartWithZeroOrLowerAmountOfLaps [

	| aCollectionOfShips dice aDiceCup noEffectSquare squares aParsecSize aBoard invalidAmountOfLaps |
	
	aCollectionOfShips := OrderedCollection with: aPlayerName1.
	dice := OrderedCollection with: die1.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	aBoard := Board with: squares.
	aParsecSize := 1.
	invalidAmountOfLaps := -2.

	self
		should: [ 
			GalaxyCircuitGame
				with: aCollectionOfShips
				and: aBoard
				and: invalidAmountOfLaps
				and: aParsecSize
				uses: aDiceCup ]
		raise: Error
		withMessage: 'Amount of laps cannot be 0 or lower'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test013AGameWithOnlyNoEffectSquaresWontMoveShipsWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test014AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: SpeedUpSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 19.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test015AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquaresAndShipsCanAdvanceLapsWithTheEffect [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 16.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: SpeedUpSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 3.
	self assert: ((aGame shipLaps) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test016AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: WormholeSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test017AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquaresAndShipsCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 12.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: WormholeSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
	self assert: ((aGame shipLaps) at: 1) equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test018AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: AtomicBombSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 1.
	self assert: ((aGame shipPositions) at: 2) equals: 1.
	self assert: ((aGame shipPositions) at: 3) equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test019AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquaresButTheyKeepTheLapsDone [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 10.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: AtomicBombSquare new and: aParsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipLaps) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test020AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aMoonwalkSquare aParsecSize |
	
	amountOfSquares := 30.
	aMoonwalkSquare := MoonwalkSquare with: 4.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: aMoonwalkSquare and: aParsecSize.

	aGame playTurn.
	aGame playTurn.
	
	self assert: (aGame shipPositions at: 1) equals: 11.
	self assert: (aGame shipPositions at: 2) equals: 8
]

{ #category : #tests }
GalaxyCircuitGameTest >> test021AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquaresCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares aMoonwalkSquare aParsecSize |
	
	amountOfSquares := 12.
	aMoonwalkSquare := MoonwalkSquare with: 4.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: aMoonwalkSquare and: aParsecSize.
	
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
	self assert: ((aGame shipLaps) at: 1) equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test022AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aHyperJumpSquare parsecSize |
	
	amountOfSquares := 30.
	aHyperJumpSquare := HyperJumpSquare with: (#(2 1) asOrderedCollection).
	parsecSize := 5.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: parsecSize.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 25.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test023AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquaresCanAdvanceLapsWithTheEffect [

	| aGame amountOfSquares aHyperJumpSquare parsecSize |
	
	amountOfSquares := 30.
	aHyperJumpSquare := HyperJumpSquare with: (#(4 1) asOrderedCollection).
	parsecSize := 5.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: parsecSize.

	aGame playTurn.

	self assert: (aGame shipLaps at: 1) equals: 2
]

{ #category : #tests }
GalaxyCircuitGameTest >> test024AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquaresCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares aHyperJumpSquare parsecSize |
	
	amountOfSquares := 20.
	aHyperJumpSquare := HyperJumpSquare with: (#(1 -4) asOrderedCollection).
	parsecSize := 5.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: parsecSize.

	aGame playTurn.

	self assert: (aGame shipLaps at: 1) equals: 1
]

{ #category : #tests }
GalaxyCircuitGameTest >> test025AGameCanGiveMeARankingOfItsShips [

	| aGame amountOfSquares aParsecSize |
	
	amountOfSquares := 30.
	aParsecSize := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: aParsecSize.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipRanking at: 1) name) equals: aPlayerName1.
	self assert: ((aGame shipRanking at: 2) name) equals: aPlayerName2.
	self assert: ((aGame shipRanking at: 3) name) equals: aPlayerName3.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test026AGameCanPlayUsingABoardThatHasRandomSquares [

	| aGame |
	
	aGame := self aGameWithRandomSquares.
	
	aGame playTurn.
	aGame playTurn.
	
	self assert: (aGame currentTurn) equals: 3.
	
]

{ #category : #tests }
GalaxyCircuitGameTest >> test027AAGameCannotStartWithZeroOrLowerParsecSize [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares invalidParsecSize aBoard |
	
	aCollectionOfShips := OrderedCollection with: aPlayerName1.
	dice := OrderedCollection with: die1.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	aBoard := Board with: squares.
	invalidParsecSize := -5.

	self
		should: [ 
			GalaxyCircuitGame
				with: aCollectionOfShips
				and: aBoard
				and: anAmountOfLaps
				and: invalidParsecSize
				uses: aDiceCup ]
		raise: Error
		withMessage: 'Parsec size cannot be 0 or lower'
]
