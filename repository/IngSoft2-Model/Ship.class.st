Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'position',
		'lap',
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Ship class >> with: aName [

	^((self new) intializeWith: aName).
]

{ #category : #comparing }
Ship >> equals: anotherShip [

	^ (owner = (anotherShip owner)).
]

{ #category : #initialize }
Ship >> intializeWith: aName [ 
	owner := aName.
	lap := 1.
	position := 1.
]

{ #category : #accessing }
Ship >> lap [
	^ lap
]

{ #category : #accessing }
Ship >> move: steps [

	position := position + steps
]

{ #category : #accessing }
Ship >> moveLaps: someLaps and: aNewPosition [
	lap := lap + someLaps.
	position := aNewPosition.
]

{ #category : #accessing }
Ship >> owner [

	^ owner.
]

{ #category : #accessing }
Ship >> position [
	^ position.
]

{ #category : #accessing }
Ship >> resetPosition [
	position := 1.
]
