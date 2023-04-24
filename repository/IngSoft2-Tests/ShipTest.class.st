Class {
	#name : #ShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ShipTest >> test001AShipCreatedWithPositionCanTellMeItsOwnPosition [

	| aShip |
	aShip := Ship atZero.

	self assert: aShip position equals: 0
]

{ #category : #tests }
ShipTest >> test002AShipCreatedWithADifferentPositionCanTellMeItsOwnPosition [

	| aShip |
	aShip := Ship atZero.

	self assert: aShip position equals: 0
]

{ #category : #tests }
ShipTest >> test003AShipCanMoveFowardTwoSteps [

	| aShip anAmountOfSteps |
	anAmountOfSteps := 2.
	aShip := Ship atZero.
	aShip move: anAmountOfSteps.

	self assert: aShip position equals: 2
]

{ #category : #tests }
ShipTest >> test004AShipCanMoveBackwardsFourSteps [

	| aShip anAmountOfSteps |
	anAmountOfSteps := -4.
	aShip := Ship atZero.
	aShip move: anAmountOfSteps.

	self assert: aShip position equals: 0
]

{ #category : #tests }
ShipTest >> test005AShipCreatedWithPositionAtZeroCanTellMeItsOwnPosition [

	| aShip |
	aShip := Ship atZero.

	self assert: aShip position equals: 0
]
