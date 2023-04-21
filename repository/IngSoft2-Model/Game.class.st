Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'ships',
		'board'
	],
	#classInstVars : [
		'ships',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: aShip and: aBoard [ 
	^((self new) initializeWith: aShip and: aBoard).
]

{ #category : #initialization }
Game >> initializeWith: aShip and: aBoard [ 
	ships := aShip.
	board := aBoard.
]

{ #category : #testing }
Game >> isFinished [
	^ true.
]

{ #category : #initialization }
Game >> isStarted [
	^true.
]

{ #category : #playing }
Game >> play [
	self winner isNil ifFalse: [ Error signal: 'No se puede seguir jugando'].
	ships do: [ :aShip | aShip move: 7].
]

{ #category : #'as yet unclassified' }
Game >> winner [
	^(ships detect: [ :aShip | aShip isWinner:  board]
		ifNone: nil).
]
