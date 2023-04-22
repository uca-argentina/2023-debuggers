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
	aShip := Ship withPosition: 3.
	aBoard := 10.
	aGame := Game with: aShip and: aBoard.
	self assert: aGame isStarted.
]

{ #category : #tests }
GameTest >> test002AGameCanStartWithManyShipsAndABoard [
	
	| aShip1 aBoard aGame aShip2 aShip3 aCollectionOfShips |
	aShip1 := Ship withPosition: 5.
	aShip2 := Ship withPosition: 3.
	aShip3 := Ship withPosition: 2.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := 10.
	aGame := Game with: aCollectionOfShips and: aBoard.
	self assert: aGame isStarted.
]

{ #category : #tests }
GameTest >> test003AGameCanStartWithASingleShipAndABoardAndCanPlayARound [
	
	| aShip aBoard aGame |
	aShip := Ship withPosition: 3.
	aBoard := 10.
	aGame := Game with: (OrderedCollection with: aShip) and: aBoard.
	aGame playARound.
	
	self assert: aShip position equals: 10.
]

{ #category : #tests }
GameTest >> test004AGameCanStartWithManyShipsAndABoardAndCanPlayARound [
	
	| aShip1 aBoard aGame aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 3.
	aShip2 := Ship withPosition: 2.
	aShip3 := Ship withPosition: 1.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := 10.
	aGame := Game with: aCollectionOfShips and: aBoard.
	aGame playARound.
	
	self assert: aShip1 position equals: 10.
	self assert: aShip2 position equals: 9.
	self assert: aShip3 position equals: 8.
]

{ #category : #tests }
GameTest >> test005AGameCanTellTheWinner [
	
	| aShip1 aBoard aGame aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 3.
	aShip2 := Ship withPosition: 2.
	aShip3 := Ship withPosition: 1.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := 10.
	aGame := Game with: aCollectionOfShips and: aBoard.
	aGame play.
	
	self assert: aGame winner equals: aShip1.
]

{ #category : #tests }
GameTest >> test006AGameWithAWinnerCanNoLongerBePlayed [
	
	| aShip1 aBoard aGame aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 3.
	aShip2 := Ship withPosition: 2.
	aShip3 := Ship withPosition: 1.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := 10.
	aGame := Game with: aCollectionOfShips and: aBoard.
	aGame play.
	
	self should: [aGame play] raise: Error withMessage: 'No se puede seguir jugando'.
]

{ #category : #tests }
GameTest >> test007AGameCanBePlayedMultipleRoundsUntilItHasAWinner [
	
	| aShip1 aBoard aGame aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 3.
	aShip2 := Ship withPosition: 2.
	aShip3 := Ship withPosition: 1.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := 24.
	aGame := Game with: aCollectionOfShips and: aBoard.
	aGame play.
	
	self assert: aShip1 position equals: 24.
	self assert: aShip2 position equals: 23.
	self assert: aShip3 position equals: 22.
]

{ #category : #tests }
GameTest >> test008AGameCanBePlayedAndItsShipsWontGetPastTheLastSquareWhenMoving [
	
	| aShip1 aBoard aGame aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 5.
	aShip2 := Ship withPosition: 2.
	aShip3 := Ship withPosition: 1.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := 24.
	aGame := Game with: aCollectionOfShips and: aBoard.
	aGame play.
	
	self assert: aShip1 position equals: 24.
	self assert: aShip2 position equals: 23.
	self assert: aShip3 position equals: 22.
]

{ #category : #tests }
GameTest >> test009AGameCanOnlyHaveASingleWinner [
	
	| aShip1 aBoard aGame aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 3.
	aShip2 := Ship withPosition: 3.
	aShip3 := Ship withPosition: 3.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := 10.
	aGame := Game with: aCollectionOfShips and: aBoard.
	aGame play.
	
	self assert: aGame winner equals: aShip1.
	self deny: aGame winner equals: aShip2.
	self deny: aGame winner equals: aShip3.
]
