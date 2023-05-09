Class {
	#name : #ShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ShipTest >> test001AShipCanMoveFowardTwoSteps [

	| aShip anAmountOfSteps |
	anAmountOfSteps := 2.
	aShip := Ship with: 'PlayerOne'.
	aShip move: anAmountOfSteps.

	self assert: aShip position equals: 2
]

{ #category : #tests }
ShipTest >> test002AShipCanMoveBackwardsFourSteps [

	| aShip anAmountOfSteps1  anAmountOfSteps2 |
	anAmountOfSteps1 := -4.
	anAmountOfSteps2 := 6.
	aShip := Ship with: 'PlayerOne'.
	aShip move: anAmountOfSteps2.
	aShip move: anAmountOfSteps1.

	self assert: aShip position equals: 2.
]

{ #category : #tests }
ShipTest >> test003AShipWillAlwaysBeCreatedWithPositionAtZeroCanTellMeItsOwnPosition [

	| aShip |
	aShip := Ship with: 'PlayerOne'.

	self assert: aShip position equals: 0
]

{ #category : #tests }
ShipTest >> test004AShipCanBeCreatedWithAName [

	| aShip |
	aShip := Ship with: 'PlayerOne'.

	self assert: aShip name equals: 'PlayerOne'.
]

{ #category : #tests }
ShipTest >> test005TwoShipsAreEqualIfTheirNamesAreEqual [

	| aShip1 aShip2 |

	aShip1 := Ship with: 'PlayerOne'.
	aShip2 := Ship with: 'PlayerOne'.
	
	self assert: (aShip1 equals: aShip2).
]
