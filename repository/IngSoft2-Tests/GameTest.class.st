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
GameTest >> test001AGameCanStartWithASingleShipAndABoardAndCanPlayARound [

	| aShip anAmountofSquares aGame die1 die2 dice |
	aShip := Ship with: 'Mafalda'.
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
GameTest >> test002AGameCanStartWithManyShipsAndABoardAndCanPlayARound [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test003AGameCanTellTheWinner [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test004AGameWithAWinnerCanNoLongerBePlayed [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test005AGameCanBePlayedMultipleRoundsUntilItHasAWinner [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test006AGameCanBePlayedAndItsShipsWontGetPastTheLastSquareWhenMoving [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test007AGameCanOnlyHaveASingleWinner [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test008AGameWithManyShipsCanTellMeItsShipsPositions [

	| aShip1 anAmountofSquares aGame aShip2 aShip3 aCollectionOfShips die1 die2 dice |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test009AGameCanThrowADie [

	| aShip1 anAmountofSquares aGame dice die1 aCollectionOfShips aShip2 aShip3 |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test010AGameCanThrowDice [

	| aShip1 anAmountofSquares aGame die1 die2 dice aShip2 aShip3 aCollectionOfShips |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Juan'.
	aShip3 := Ship with: 'Martin'.
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
GameTest >> test011DuplicatedShipCantBeCreated [

	| aShip1 aShip2 aCollectionOfShips anAmountofSquares die1 die2 dice aGame aShip3 |
	aShip1 := Ship with: 'Mafalda'.
	aShip2 := Ship with: 'Mafalda'.
	aShip3 := Ship with: 'Juan'.
	aCollectionOfShips := OrderedCollection
		                      with: aShip1
		                      with: aShip2
		                      with: aShip3.
	anAmountofSquares := 10.
	die1 := LoadedDie with: #( 7 ).
	die2 := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die1 with: die2.

	self
		should: [ 
			aGame := Game
				         with: aCollectionOfShips
				         and: anAmountofSquares
				         uses: dice ]
		raise: Error
		withMessage: 'Ship alredy exits with that name'
]
