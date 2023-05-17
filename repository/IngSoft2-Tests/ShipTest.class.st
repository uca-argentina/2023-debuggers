Class {
	#name : #ShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ShipTest >> test001AShipCanBeCreatedWithAName [

	| aShip |
	aShip := Ship with: 'PlayerOne'.

	self assert: aShip name equals: 'PlayerOne'.
]

{ #category : #tests }
ShipTest >> test002TwoShipsAreEqualIfTheirNamesAreEqual [

	| aShip1 aShip2 |

	aShip1 := Ship with: 'PlayerOne'.
	aShip2 := Ship with: 'PlayerOne'.
	
	self assert: (aShip1 equals: aShip2).
]
