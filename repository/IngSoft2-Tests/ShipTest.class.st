Class {
	#name : #ShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ShipTest >> test001AShipCreatedWithPositionCanTellMeItsOwnPosition [

	| aShip |
	
	aShip := Ship withPosition: 3.
	
	self assert: aShip position equals: 3
]

{ #category : #tests }
ShipTest >> test002AShipCreatedWithADifferentPositionCanTellMeItsOwnPosition [

	| aShip |
	
	aShip := Ship withPosition: 5.
	
	self assert: aShip position equals: 5
]

{ #category : #tests }
ShipTest >> test003AShipCanMoveFowardTwoSteps [

	| aShip anAmountOfSteps |
	
	anAmountOfSteps := 2. 
	aShip := Ship withPosition: 5.
	aShip move: anAmountOfSteps.
	
	self assert: aShip position equals: 7
]

{ #category : #tests }
ShipTest >> test004AShipCanMoveBackwardsFourSteps [

	| aShip anAmountOfSteps |
	
	anAmountOfSteps := -4. 
	aShip := Ship withPosition: 5.
	aShip move: anAmountOfSteps.
	
	self assert: aShip position equals: 1
]
