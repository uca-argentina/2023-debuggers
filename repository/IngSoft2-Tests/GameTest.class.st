Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
GameTest >> test001AGameCanStartWithASingleShipAndABoard [

	| aShip aBoard aGame |
	aShip := Ship atZero.
	aBoard := 10.
	aGame := Game with: aShip and: aBoard.
	self assert: aGame isStarted
]

{ #category : #tests }
GameTest >> test002AGameCanStartWithManyShipsAndABoard [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	aGame := Game with: aCollectionOfShips and: anAmountofSquares.
	self assert: aGame isStarted
]

{ #category : #tests }
GameTest >> test003AGameCanStartWithASingleShipAndABoardAndCanPlayARound [

	| aShip anAmountofSquares aGame die1 die2 dice |
	aShip := Ship atZero.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: (OrderedCollection with: aShip)
		         and: anAmountofSquares
		         uses: dice.
	aGame playARound.

	self assert: aShip position equals: 10
]

{ #category : #tests }
GameTest >> test004AGameCanStartWithManyShipsAndABoardAndCanPlayARound [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.
	aGame playARound.

	self assert: aShip1 position equals: 10.
	self assert: aShip2 position equals: 0.
	self assert: aShip3 position equals: 0
]

{ #category : #tests }
GameTest >> test005AGameCanTellTheWinner [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.
	aGame play.

	self assert: aGame winner equals: aShip1
]

{ #category : #tests }
GameTest >> test006AGameWithAWinnerCanNoLongerBePlayed [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.
	aGame play.

	self
		should: [ aGame play ]
		raise: Error
		withMessage: 'Unable to play, Game has already finished'
]

{ #category : #tests }
GameTest >> test007AGameCanBePlayedMultipleRoundsUntilItHasAWinner [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 24.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.
	aGame play.

	self assert: aShip1 position equals: 24.
	self assert: aShip2 position equals: 14.
	self assert: aShip3 position equals: 14
]

{ #category : #tests }
GameTest >> test008AGameCanBePlayedAndItsShipsWontGetPastTheLastSquareWhenMoving [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 24.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.
	aGame play.

	self assert: aShip1 position equals: 24.
	self assert: aShip2 position equals: 14.
	self assert: aShip3 position equals: 14
]

{ #category : #tests }
GameTest >> test009AGameCanOnlyHaveASingleWinner [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.
	aGame play.

	self assert: aGame winner equals: aShip1.
	self deny: aGame winner equals: aShip2.
	self deny: aGame winner equals: aShip3
]

{ #category : #tests }
GameTest >> test010AGameWithManyShipsCanTellMeItsShipsPositions [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.

	self
		assert: aGame shipPositions
		equals: #( 0 0 0 ) asOrderedCollection
]

{ #category : #tests }
GameTest >> test011AGameCanThrowADie [

	| aShip1 anAmountofSquares aGame dice die1 aCollectionOfShips aShip2 aShip3 |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.
	aGame playARound.

	self assert: aGame throwDice equals: 7
]

{ #category : #tests }
GameTest >> test012AGameCanThrowDice [

	| aShip1 anAmountofSquares aGame die1 die2 dice aShip2 aShip3 aCollectionOfShips |
	aShip1 := Ship atZero.
	aShip2 := Ship atZero.
	aShip3 := Ship atZero.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.
	aGame := Game
		         with: aCollectionOfShips
		         and: anAmountofSquares
		         uses: dice.

	self assert: aGame throwDice equals: 14
]

{ #category : #tests }
GameTest >> test013AGameCanStartWithShipInitializedAlwaysAtPositionZeroAndABoard [

	| aShip aBoard aGame |
	aShip := Ship atZero.
	aBoard := 10.
	aGame := Game with: aShip and: aBoard.
	self assert: aGame isStarted
]
