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

{ #category : #'as yet unclassified' }
Game >> hasAWinner [

	^ ships anySatisfy: [ :aShip | aShip isWinner: board ]. 
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

	self validatePlay.
	[ self hasAWinner ] whileFalse: [ self playARound ]
]

{ #category : #playing }
Game >> playARound [

	^ ships do: [ :aShip | aShip move: 7 in: board]
]

{ #category : #playing }
Game >> validatePlay [

	self hasAWinner ifTrue: [ Error signal: 'No se puede seguir jugando' ]
]

{ #category : #'as yet unclassified' }
Game >> winner [

	^ ships detect: [ :aShip | aShip isWinner: board ]
]
