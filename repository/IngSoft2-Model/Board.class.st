Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'ships',
		'squares'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> withShips: aShip [ 
	^(self new initializeWithShips: aShip).
]

{ #category : #'instance creation' }
Board class >> withShips: aCollectionOfShips andWithSquares: aCollectionOfSquares [ 
	^(self new initializeWithShips: aCollectionOfShips InitializeWithSquares: aCollectionOfSquares).
]

{ #category : #initialization }
Board >> initializeWithShips: aShip [ 
	ships := aShip.
]

{ #category : #initialization }
Board >> initializeWithShips: aCollectionOfShips InitializeWithSquares: aCollectionOfSquares [ 
	ships := aCollectionOfShips.
	squares := aCollectionOfSquares.
]

{ #category : #'as yet unclassified' }
Board >> shipPosition: aPlayerNumber [
	^ (ships at: aPlayerNumber) position.
]

{ #category : #'as yet unclassified' }
Board >> shipPositions [

	^ships collect: [ :aShip | aShip position ].
]

{ #category : #'as yet unclassified' }
Board >> winner [
	^(ships detect: [ :aShip | aShip position == squares last]).
]
