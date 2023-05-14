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
GameTest >> aGame [

	| aGame aCollectionOfShips dice aDiceCup |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
					and: anAmountOfLaps 
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithASingleDie [

	| aGame aCollectionOfShips dice aDiceCup |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
					and: anAmountOfLaps 
		         uses: die1.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithASingleShip [

	| aGame aCollectionOfShips dice aDiceCup |
	
	aCollectionOfShips := OrderedCollection with: aShip1.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         and: anAmountOfLaps
		         uses: aDiceCup.
	^ aGame
]

{ #category : #'set up' }
GameTest >> aGameWithDuplicatedShips [

	| aGame aCollectionOfShips dice aDiceCup |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip2.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
					and: anAmountOfLaps 
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithInvalidAmountOfLaps [

	| aGame aCollectionOfShips dice aDiceCup invalidAmountOfLaps |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	invalidAmountOfLaps := -5.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares 
					and: invalidAmountOfLaps 
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aGameWithInvalidAmountOfSquares [

	| aGame aCollectionOfShips dice aDiceCup invalidAmountOfSquares |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	invalidAmountOfSquares := -5.
	aGame := Game
		         with: aCollectionOfShips
		         and: invalidAmountOfSquares
					and: anAmountOfLaps 
		         uses: aDiceCup.
	^ aGame.	
]

{ #category : #'set up' }
GameTest >> aShortGame [

	| aGame aCollectionOfShips dice aDiceCup |
	
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	aGame := Game
		         with: aCollectionOfShips
		         and: aSmallAmountOfSquares
					and: anAmountOfLaps 
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
	
	aGame := self aGame.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
	self assert: aGame currentTurn = 2.
]

{ #category : #tests }
GameTest >> test003AGameCanPlayEveryPlayersTurnAtLeastOnce [

	| aGame |
	
	aGame := self aGame.
	
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
	
	aGame := self aGame.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame currentTurn = 1.
]

{ #category : #tests }
GameTest >> test005AGameCanTellMeTheWinner [

	| aGame |
	
	aGame := self aShortGame.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame winner equals: aShip1.
]

{ #category : #tests }
GameTest >> test006AGameWithoutAWinnerWillReturnAnEmptyShip [

	| aGame aNonPlayerShip |
	
	aGame := self aShortGame.
	
	aGame playTurn.
	aNonPlayerShip := Ship with: 'Nadie Gano'.
	
	self assert: ((aGame winner) equals: aNonPlayerShip).
]

{ #category : #tests }
GameTest >> test007AGameWithAWinnerCannotBePlayed [

	| aGame |
	aGame := self aShortGame.

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
	
	aGame := self aGame.

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
	
	aGame := self aGame.

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
		withMessage: 'Amount of squares cannot be 0 or lower'
]

{ #category : #tests }
GameTest >> test013AGameCannotStartWithZeroOrLowerAmountOfLaps [

	self
		should: [ self aGameWithInvalidAmountOfLaps ]
		raise: Error
		withMessage: 'Amount of laps cannot be 0 or lower'
]

{ #category : #tests }
GameTest >> test014AGameWithSquaresWithNoEffectsDoesNotMoveCurrentPositionOfASingleShip [

	| aGame normal square aCollectionOfShips dice aDiceCup|
	
	normal := NormalSquare new.
	square := Square with: normal.
	aCollectionOfShips := OrderedCollection with: aShip1.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         and: anAmountOfLaps
					and: square
		         uses: aDiceCup.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 15).
]

{ #category : #tests }
GameTest >> test015AGameWithSquaresWithSpeedUpEffectMove4SquaresToCurrentPositionOfASingleShip [

	| aGame speedUp square aCollectionOfShips dice aDiceCup|
	
	speedUp := SpeedUpSquare new.
	square := Square with: speedUp.
	aCollectionOfShips := OrderedCollection with: aShip1.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         and: anAmountOfLaps
					and: square
		         uses: aDiceCup.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 19).
]

{ #category : #tests }
GameTest >> test016AGameWithSquaresWithWormHoleEffectGoBack4SquaresOfADestinationOfASingleShip [

	| aGame wormHole square aCollectionOfShips dice aDiceCup|
	
	wormHole := WormHole new.
	square := Square with: wormHole.
	aCollectionOfShips := OrderedCollection with: aShip1.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         and: anAmountOfLaps
					and: square
		         uses: aDiceCup.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 11).
]

{ #category : #tests }
GameTest >> test017AGameWithSingleShipAndSquaresWithAtomicBombEffectGoBackToFirstSquare [

	| aGame atomicBomb square aCollectionOfShips dice aDiceCup|
	
	atomicBomb := AtomicBomb new.
	square := Square with: atomicBomb.
	aCollectionOfShips := OrderedCollection with: aShip1.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         and: anAmountOfLaps
					and: square
		         uses: aDiceCup.
	
	aGame playTurn.

	self assert: (((aGame shipPositions) at: 1) = 1).
]
