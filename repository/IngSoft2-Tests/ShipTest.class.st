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

	| aShip anAmountOfSteps |
	anAmountOfSteps := -4.
	aShip := Ship with: 'PlayerOne'.
	aShip move: anAmountOfSteps.

	self assert: aShip position equals: 0
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
