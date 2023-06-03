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
	^ lap * position .
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
Ship >> move: steps [

	position := position + steps
]

{ #category : #accessing }
Ship >> moveLaps: someLaps and: aNewPosition [
	lap := lap + someLaps.
	position := aNewPosition.
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
