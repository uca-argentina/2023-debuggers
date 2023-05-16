Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'aShip1',
		'aShip2',
		'aShip3',
		'aShip4',
		'anAmountofSquares',
		'die1',
		'die2',
		'anAmountOfLaps',
		'aSmallAmountOfSquares'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'set up' }
GameTest >> aGameWithASingleDie [

	| aGame aCollectionOfShips noEffectSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: die1.
	^ aGame.
]

{ #category : #'set up' }
GameTest >> aGameWithASingleShip [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize |
	aCollectionOfShips := OrderedCollection with: aShip1.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
		         and: anAmountOfLaps
		         and: parsecSize
		         uses: aDiceCup.
	^ aGame
]

{ #category : #'set up' }
GameTest >> aGameWithDuplicatedShips [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip2.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithInvalidAmountOfLaps [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize invalidAmountOfLaps |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	invalidAmountOfLaps := -5.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: invalidAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.
]

{ #category : #'set up' }
GameTest >> aGameWithInvalidAmountOfSquares [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.
]

{ #category : #'set up' }
GameTest >> aGameWithOnlyAtomicBombSquares [

	| aGame aCollectionOfShips dice aDiceCup atomicBombSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	atomicBombSquare := AtomicBombSquare new.
	squares := OrderedCollection new.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	squares add: atomicBombSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithOnlyHyperJumpSquares [

	| aGame aCollectionOfShips dice aDiceCup hyperJumpSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	hyperJumpSquare := HyperJumpSquare with: (#(2 1) asOrderedCollection).
	squares := OrderedCollection new.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	squares add: hyperJumpSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithOnlyMoonwalkSquares [

	| aGame aCollectionOfShips dice aDiceCup moonwalkSquare1 moonwalkSquare2 squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	moonwalkSquare1 := MoonwalkSquare with: 3.
	moonwalkSquare2 := MoonwalkSquare with: 5.
	squares := OrderedCollection new.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare2.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare2.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare2.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare2.
	squares add: moonwalkSquare2.
	squares add: moonwalkSquare2.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare2.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare2.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare1.
	squares add: moonwalkSquare1.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithOnlyNoEffectSquares [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithOnlySpeedUpSquares [

	| aGame aCollectionOfShips dice aDiceCup speedUpSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	speedUpSquare := SpeedUpSquare new.
	squares := OrderedCollection new.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	squares add: speedUpSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithOnlyWormholeSquares [

	| aGame aCollectionOfShips dice aDiceCup wormholeSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	wormholeSquare := WormholeSquare new.
	squares := OrderedCollection new.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	squares add: wormholeSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aShortGameWithOnlyNoEffectSquares [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	squares add: noEffectSquare.
	parsecSize := 5.
	aGame := Game
		         with: aCollectionOfShips
		         and: squares
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #running }
GameTest >> setUp [
	
	super setUp.	
		
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
	aShip4 := Ship with: 'Martin'.
	anAmountofSquares := 30.
	aSmallAmountOfSquares:= 10.
	anAmountOfLaps := 2.
	die1 := LoadedDie with: #( 7 5 3).
	die2 := LoadedDie with: #( 7 6 2).

	

	
	

]

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
GameTest >> test001AGameCanStartWithASingleShipAndCanPlayATurn [

	| aGame |
	
	aGame := self aGameWithASingleShip.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
]

{ #category : #tests }
GameTest >> test002AGameCanStartWithManyShipsAndCanPlayATurnAndTheCurrentTurnAdvancesByOne [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
	self assert: aGame currentTurn = 2.
]

{ #category : #tests }
GameTest >> test003AGameCanPlayEveryPlayersTurnAtLeastOnce [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
	self assert: (((aGame shipPositions) at: 2) = 12).
	self assert: (((aGame shipPositions) at: 3) = 6).
	self assert: aGame currentTurn = 1.
]

{ #category : #tests }
GameTest >> test004AGameCanBePlayEveryPlayersTurnAndThenStartAnotherRound [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame currentTurn = 1.
]

{ #category : #tests }
GameTest >> test005AGameCanTellMeTheWinner [

	| aGame |
	
	aGame := self aShortGameWithOnlyNoEffectSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame winner equals: aShip1.
]

{ #category : #tests }
GameTest >> test006AGameWithoutAWinnerWillReturnAnEmptyShip [

	| aGame aNonPlayerShip |
	
	aGame := self aShortGameWithOnlyNoEffectSquares.
	
	aGame playTurn.
	aNonPlayerShip := Ship with: 'Nadie Gano'.
	
	self assert: ((aGame winner) equals: aNonPlayerShip).
]

{ #category : #tests }
GameTest >> test007AGameWithAWinnerCannotBePlayed [

	| aGame |
	aGame := self aShortGameWithOnlyNoEffectSquares.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self
		should: [ aGame playTurn ]
		raise: Error
		withMessage: 'Unable to play, Game has already finished'
]

{ #category : #tests }
GameTest >> test008AGameWithManyShipsCanTellMeItsShipsPositions [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.

	self
		assert: aGame shipPositions 
		equals: #( 1 1 1 ) asOrderedCollection
]

{ #category : #tests }
GameTest >> test009AGameCanThrowADie [

	| aGame |
	
	aGame := self aGameWithASingleDie.

	self assert: aGame throw equals: 7.
]

{ #category : #tests }
GameTest >> test010AGameCanThrowADiceCup [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.

	self assert: aGame throw equals: 14.
]

{ #category : #tests }
GameTest >> test011DuplicatedShipCantBeCreated [

	self
		should: [ self aGameWithDuplicatedShips ]
		raise: Error
		withMessage: 'Ship already exists with that name'
]

{ #category : #tests }
GameTest >> test012AGameCannotStartWithZeroOrLowerAmountOfSquares [

	self
		should: [ self aGameWithInvalidAmountOfSquares ]
		raise: Error
		withMessage: 'Amount of squares cannot be 0'
]

{ #category : #tests }
GameTest >> test013AGameCannotStartWithZeroOrLowerAmountOfLaps [

	self
		should: [ self aGameWithInvalidAmountOfLaps ]
		raise: Error
		withMessage: 'Amount of laps cannot be 0 or lower'
]

{ #category : #tests }
GameTest >> test014AGameWithOnlyNoEffectSquaresWontMoveShipsWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
]

{ #category : #tests }
GameTest >> test015AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlySpeedUpSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 19).
]

{ #category : #tests }
GameTest >> test016AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquaresAndShipsCanAdvanceLapsWithTheEffect [

	| aGame |
	
	aGame := self aGameWithOnlySpeedUpSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 3).
	self assert: (((aGame shipLaps) at: 1) = 2).
]

{ #category : #tests }
GameTest >> test017AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyWormholeSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 11).
]

{ #category : #tests }
GameTest >> test018AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquaresAndShipsCanGoBackLapsWithTheEffect [

	| aGame |
	
	aGame := self aGameWithOnlyWormholeSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 21).
	self assert: (((aGame shipLaps) at: 1) = 1).
]

{ #category : #tests }
GameTest >> test019AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyAtomicBombSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 1).
]

{ #category : #tests }
GameTest >> test020AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquaresButTheyKeepTheLapsDone [

	| aGame |
	
	aGame := self aGameWithOnlyAtomicBombSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 1).
	self assert: (((aGame shipLaps) at: 1) = 2).
]

{ #category : #tests }
GameTest >> test021AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyMoonwalkSquares.
	
	aGame playTurn.
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 10).
	self assert: (((aGame shipPositions) at: 2) = 9).
]

{ #category : #tests }
GameTest >> test022AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquaresCanGoBackLapsWithTheEffect [

	| aGame |
	
	aGame := self aGameWithOnlyMoonwalkSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 16).
	self assert: (((aGame shipPositions) at: 2) = 14).
	self assert: (((aGame shipPositions) at: 3) = 10).
	self assert: (((aGame shipLaps) at: 1) = 1).
]

{ #category : #tests }
GameTest >> test023AGameWithOnlySpeedUpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyHyperJumpSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 3).
	self assert: (((aGame shipLaps) at: 1) = 2).
]

{ #category : #tests }
GameTest >> test024AGameWithOnlySpeedUpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquaresCanAdvanceLapsWithTheEffect [

	| aGame |
	
	aGame := self aGameWithOnlyHyperJumpSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 3).
	self assert: (((aGame shipLaps) at: 1) = 2).
]

{ #category : #tests }
GameTest >> test025AGameCanGiveMeARankingOfItsShips [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: (((aGame shipRanking) at: 1) equals: aShip1).
	self assert: (((aGame shipRanking) at: 2) equals: aShip2).
	self assert: (((aGame shipRanking) at: 3) equals: aShip3).
	
]
