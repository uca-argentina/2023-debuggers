Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'name',
		'position',
		'lap'
	],
	#classInstVars : [
		'position',
		'nameList'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Ship class >> with: aName [

	^((self new) intializeWith: aName).
]

{ #category : #accessing }
Ship >> advancedSquares [
	^ lap * position.
]

{ #category : #comparing }
Ship >> equals: anotherShip [

	^ (name = (anotherShip name)).
]

{ #category : #initialize }
Ship >> intializeWith: aName [ 
	name := aName.
	lap := 1.
	position := 1.
]

{ #category : #accessing }
Ship >> lap [
	^ lap
]

{ #category : #accessing }
Ship >> move: steps in: aBoard [

	| destination |
	destination := (position + (steps)).
	[ destination > (aBoard size)] whileTrue: [ 
		destination := destination - (aBoard size).
		lap := lap + 1 ].
	[ destination < 1 ] whileTrue: [ 
		destination := destination + (aBoard size).
		lap := lap - 1 ].
	position := destination.
]

{ #category : #accessing }
Ship >> name [
	^ name.
]

{ #category : #accessing }
Ship >> position [
	^ position.
]

{ #category : #accessing }
Ship >> resetPosition [
	position := 1.
]
