Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> test001TwoShipsAreEqualIfTheirNamesAreEqual [

	| aShip1 aShip2 |

	aShip1 := Ship with: 'PlayerOne'.
	aShip2 := Ship with: 'PlayerOne'.
	
	self assert: (aShip1 equals: aShip2).
]

{ #category : #tests }
PlayerTest >> test002TwoPlayerCardsAreEqualIfTheirNamesAreEqual [

	| aPlayerCards1 aPlayerCards2 |

	aPlayerCards1 := PlayerCards from: 'PlayerOne'.
	aPlayerCards2 := PlayerCards from: 'PlayerOne'.
	
	self assert: (aPlayerCards1 equals: aPlayerCards2).
]

{ #category : #tests }
PlayerTest >> test003APlayerCardsAndAShipAreEqualIfTheirNamesAreEqual [

	| aPlayerCards aShip |

	aPlayerCards := PlayerCards from: 'PlayerOne'.
	aShip := PlayerCards from: 'PlayerOne'.
	
	self assert: (aPlayerCards equals: aShip).
]
