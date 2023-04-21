Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

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
GameTest >> test003AGameCanStartWithASingleShipAndABoardAndCanBePlayed [
	
	| aShip aBoard aGame |
	aShip := Ship withPosition: 3.
	aBoard := 10.
	aGame := Game with: aShip and: aBoard.
	aShip move: 7.
	"aGame play."
	
	self assert: aShip position == 10.
]

{ #category : #tests }
GameTest >> test004AGameCanStartWithManyShipsAndABoardAndCanBePlayed [
	
	| aShip1 aBoard aGame aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 3.
	aShip2 := Ship withPosition: 2.
	aShip3 := Ship withPosition: 1.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := 10.
	aGame := Game with: aCollectionOfShips and: aBoard.
	aGame play.
	
	self assert: aShip1 position == 10.
	self assert: aShip2 position == 9.
	self assert: aShip3 position == 8.
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
	
	self assert: aGame winner == aShip1.
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
