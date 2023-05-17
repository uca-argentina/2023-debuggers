Class {
	#name : #GalaxyCircuitGameTest,
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
GalaxyCircuitGameTest >> aGameWithASingleDie [

	| aGame aCollectionOfShips noEffectSquare squares parsecSize aBoard |
	
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
	aBoard := Board with: squares.
	parsecSize := 5.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
		         and: aBoard
					and: anAmountOfLaps
					and: parsecSize
		         uses: die1.
	^ aGame.
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithASingleShip [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize aBoard|
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
	aBoard := Board with: squares.
	parsecSize := 5.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
		         and: aBoard
		         and: anAmountOfLaps
		         and: parsecSize
		         uses: aDiceCup.
	^ aGame
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithDuplicatedShips [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize aBoard |
	
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

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithInvalidAmountOfLaps [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize invalidAmountOfLaps aBoard |
	
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
	aBoard := Board with: squares.
	parsecSize := 5.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
		         and: aBoard
					and: invalidAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithInvalidAmountOfParsecs [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares invalidParsecSize amountOfLaps aBoard |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	amountOfLaps := 5.
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
	aBoard := Board with: squares.
	invalidParsecSize := -5.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
		         and: aBoard
					and: amountOfLaps
					and: invalidParsecSize
		         uses: aDiceCup.
	^ aGame.
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithOnlyAtomicBombSquares [

	| aGame aCollectionOfShips dice aDiceCup atomicBombSquare squares parsecSize aBoard|
	
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

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithOnlyHyperJumpSquares [

	| aGame aCollectionOfShips dice aDiceCup hyperJumpSquare squares parsecSize aBoard|
	
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

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithOnlyMoonwalkSquares [

	| aGame aCollectionOfShips dice aDiceCup moonwalkSquare1 moonwalkSquare2 squares parsecSize aBoard|
	
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

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithOnlyNoEffectSquares [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize aBoard |
	
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

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithOnlySpeedUpSquares [

	| aGame aCollectionOfShips dice aDiceCup speedUpSquare squares parsecSize aBoard |
	
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
	aBoard := Board with: squares.
	parsecSize := 1.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
		         and: aBoard
					and: anAmountOfLaps
					and: parsecSize
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithOnlyWormholeSquares [

	| aGame aCollectionOfShips dice aDiceCup wormholeSquare squares parsecSize aBoard |
	
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
	aBoard := Board with: squares.
	parsecSize := 1.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
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
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
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

{ #category : #'set up' }
GalaxyCircuitGameTest >> aShortGameWithOnlyNoEffectSquares [

	| aGame aCollectionOfShips dice aDiceCup noEffectSquare squares parsecSize aBoard |
	
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
GalaxyCircuitGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
GalaxyCircuitGameTest >> test001AGameCanStartWithASingleShipAndCanPlayATurn [

	| aGame |
	
	aGame := self aGameWithASingleShip.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test002AGameCanStartWithManyShipsAndCanPlayATurnAndTheCurrentTurnAdvancesByOne [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
	self assert: aGame currentTurn = 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test003AGameCanPlayEveryPlayersTurnAtLeastOnce [

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
GalaxyCircuitGameTest >> test004AGameCanBePlayEveryPlayersTurnAndThenStartAnotherRound [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame currentTurn = 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test005AGameCanTellMeTheWinner [

	| aGame |
	
	aGame := self aShortGameWithOnlyNoEffectSquares.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame winner equals: aShip1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test006AGameWithoutAWinnerWillReturnAnEmptyShip [

	| aGame aNonPlayerShip |
	
	aGame := self aShortGameWithOnlyNoEffectSquares.
	
	aGame playTurn.
	aNonPlayerShip := Ship with: 'Nadie Gano'.
	
	self assert: ((aGame winner) equals: aNonPlayerShip).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test007AGameWithAWinnerCannotBePlayed [

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
GalaxyCircuitGameTest >> test008AGameWithManyShipsCanTellMeItsShipsPositions [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.

	self
		assert: aGame shipPositions 
		equals: #( 1 1 1 ) asOrderedCollection
]

{ #category : #tests }
GalaxyCircuitGameTest >> test009AGameCanThrowADie [

	| aGame |
	
	aGame := self aGameWithASingleDie.

	self assert: aGame throw equals: 7.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test010AGameCanThrowADiceCup [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.

	self assert: aGame throw equals: 14.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test011DuplicatedShipCantBeCreated [

	self
		should: [ self aGameWithDuplicatedShips ]
		raise: Error
		withMessage: 'Ship already exists with that name'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test012AGameCannotStartWithZeroOrLowerAmountOfLaps [

	self
		should: [ self aGameWithInvalidAmountOfLaps ]
		raise: Error
		withMessage: 'Amount of laps cannot be 0 or lower'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test013AGameWithOnlyNoEffectSquaresWontMoveShipsWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test014AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlySpeedUpSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 19).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test015AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquaresAndShipsCanAdvanceLapsWithTheEffect [

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
GalaxyCircuitGameTest >> test016AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyWormholeSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 11).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test017AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquaresAndShipsCanGoBackLapsWithTheEffect [

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
GalaxyCircuitGameTest >> test018AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyAtomicBombSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 1).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test019AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquaresButTheyKeepTheLapsDone [

	| aGame |
	
	aGame := self aGameWithOnlyAtomicBombSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 1).
	self assert: (((aGame shipLaps) at: 1) = 2).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test020AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyMoonwalkSquares.
	
	aGame playTurn.
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 10).
	self assert: (((aGame shipPositions) at: 2) = 9).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test021AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquaresCanGoBackLapsWithTheEffect [

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
GalaxyCircuitGameTest >> test022AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquares [

	| aGame |
	
	aGame := self aGameWithOnlyHyperJumpSquares.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 5).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test023AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquaresCanAdvanceLapsWithTheEffect [

	| aGame |
	
	aGame := self aGameWithOnlyHyperJumpSquares.

	aGame playTurn.

	self assert: (aGame shipLaps at: 1) = 2
]

{ #category : #tests }
GalaxyCircuitGameTest >> test024AGameCanGiveMeARankingOfItsShips [

	| aGame |
	
	aGame := self aGameWithOnlyNoEffectSquares.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipRanking at: 1) equals: aShip1).
	self assert: ((aGame shipRanking at: 2) equals: aShip2).
	self assert: ((aGame shipRanking at: 3) equals: aShip3)
]

{ #category : #tests }
GalaxyCircuitGameTest >> test025AGameCanPlayUsingABoardThatHasRandomSquares [

	| aGame |
	
	aGame := self aGameWithRandomSquares.
	
	aGame playTurn.
	aGame playTurn.
	
	self assert: ((aGame currentTurn) = 3).
	
]

{ #category : #tests }
GalaxyCircuitGameTest >> test026AAGameCannotStartWithZeroOrLowerParsecSize [

	self
		should: [ self aGameWithInvalidAmountOfParsecs ]
		raise: Error
		withMessage: 'Parsec size cannot be 0 or lower'
	
]
