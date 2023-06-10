Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'name',
		'position',
		'lap',
		'parsec',
		'hand'
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

{ #category : #'instance creation' }
Ship class >> with: aName and: aStartingHand [

	^((self new) intializeWith: aName and: aStartingHand).
]

{ #category : #comparing }
Ship >> emptyHand [
	
	^ hand isEmpty.
]

{ #category : #comparing }
Ship >> equals: anotherShip [

	^ (name = (anotherShip name)).
]

{ #category : #accessing }
Ship >> hasInHand: aCard [

	^ hand anySatisfy: [ :aHandCard | aHandCard isKindOf: aCard class].
]

{ #category : #initialize }
Ship >> intializeWith: aName [ 
	name := aName.
	lap := 1.
	position := 1.
	parsec := 1.
]

{ #category : #initialize }
Ship >> intializeWith: aName and: aStartingHand [
	name := aName.
	hand := aStartingHand.
	lap := 1.
	position := 1.
	parsec := 1.
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
Ship >> parsec [
	^ parsec.
]

{ #category : #accessing }
Ship >> parsecMove: parsecSteps [

	parsec := parsecSteps. 
]

{ #category : #accessing }
Ship >> position [
	^ position.
]

{ #category : #removing }
Ship >> removeFromHand: aCard [

	| cardToRemove |
	
	cardToRemove := hand detect: [ :aHandCard | aHandCard equals: aCard ].
	^ hand remove: cardToRemove.
]

{ #category : #accessing }
Ship >> resetPosition [
	position := 1.
]
