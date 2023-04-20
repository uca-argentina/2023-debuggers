Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> test005ABoardWithOneShipCanTellMeItsShipsPosition [

	| aShip aBoard |
	
	aShip := Ship withPosition: 5.
	aBoard := Board withShips: (OrderedCollection with: aShip).
	
	self assert: aBoard shipPositions = (#(5) asOrderedCollection).
]

{ #category : #tests }
BoardTest >> test006ABoardWithManyShipsCanTellMeItsShipsPositions [

	| aShip1 aBoard aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 5.
	aShip2 := Ship withPosition: 3.
	aShip3 := Ship withPosition: 2.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := Board withShips: aCollectionOfShips.
	
	self assert: aBoard shipPositions = (#(5 3 2) asOrderedCollection).
]

{ #category : #tests }
BoardTest >> test007ABoardWithManyShipsCanTellMeACertainShipsPosition [

	| aShip1 aBoard aShip2 aShip3 aCollectionOfShips |
	
	aShip1 := Ship withPosition: 5.
	aShip2 := Ship withPosition: 3.
	aShip3 := Ship withPosition: 2.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := Board withShips: aCollectionOfShips.
	
	self assert: (aBoard shipPosition: 1) == 5.
]

{ #category : #tests }
BoardTest >> test008ABoardWithManyShipsAndManySquaresCanTellMeTheWinner [

	| aShip1 aBoard aShip2 aShip3 aCollectionOfShips aCollectionOfSquares |
	
	aShip1 := Ship withPosition: 6.
	aShip2 := Ship withPosition: 3.
	aShip3 := Ship withPosition: 2.
	aCollectionOfSquares := #(1 2 3 4 5 6) asOrderedCollection.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := Board withShips: aCollectionOfShips andWithSquares: aCollectionOfSquares.
	
	self assert: (aBoard winner == aShip1).
]

{ #category : #tests }
BoardTest >> test009ABoardWithManyShipsAndManySquaresHasNoWinner [

	| aShip1 aBoard aShip2 aShip3 aCollectionOfShips aCollectionOfSquares |
	
	aShip1 := Ship withPosition: 6.
	aShip2 := Ship withPosition: 3.
	aShip3 := Ship withPosition: 2.
	aCollectionOfSquares := #(1 2 3 4 5 6) asOrderedCollection.
	aCollectionOfShips := OrderedCollection with: aShip1 with: aShip2 with: aShip3.
	aBoard := Board withShips: aCollectionOfShips andWithSquares: aCollectionOfSquares.
	
	self assert: (aBoard winner == aShip1).
]
