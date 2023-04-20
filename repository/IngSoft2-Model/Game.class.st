Class {
	#name : #Game,
	#superclass : #Object,
	#classInstVars : [
		'ships',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Game class >> start [
	^true.
]

{ #category : #'instance creation' }
Game class >> with: aShip [ 
	ships:= aShip .
]

{ #category : #initialization }
Game class >> with: aShip and: aBoard [ 
	ships := aShip.
	board := aBoard.
]

{ #category : #initialization }
Game >> start [
	^true.
]
