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

{ #category : #comparing }
Ship >> equals: anotherShip [

	^ (name = (anotherShip name)).
]

{ #category : #initialize }
Ship >> intializeWith: aName [ 
	name := aName.
]

{ #category : #accessing }
Ship >> name [
	^ name.
]
