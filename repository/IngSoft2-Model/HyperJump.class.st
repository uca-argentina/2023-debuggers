Class {
	#name : #HyperJump,
	#superclass : #Object,
	#instVars : [
		'parsecs',
		'collectionSquares'
	],
	#classInstVars : [
		'parsecs',
		'collectionSquares'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
HyperJump class >> typeOfEffect [
	^'HyperJump'.
]

{ #category : #'instance creation' }
HyperJump class >> with: anAmountOfParsecs [ 
	parsecs := anAmountOfParsecs.
]

{ #category : #'instance creation - old' }
HyperJump class >> with: aCollection with: anAmountOfParsecs [ 
	^(self new) initalizeWith: aCollection and: anAmountOfParsecs.
]

{ #category : #'as yet unclassified' }
HyperJump >> collectionOfSquares [

	^ collectionSquares.
]

{ #category : #'as yet unclassified' }
HyperJump >> haveParsecs [
	^ parsecs.
]

{ #category : #initialization }
HyperJump >> initalizeWith: aCollection and: anAmountOfParsecs [ 
	collectionSquares := aCollection asSortedCollection: [:x :y| x>y ].
	parsecs := anAmountOfParsecs.
]

{ #category : #accessing }
HyperJump >> position [
	^ 0.
]

{ #category : #accessing }
HyperJump >> typeOfEffect [
	^'HyperJump'.
]

{ #category : #'instance creation' }
HyperJump >> with: anAmountOfParsecs [ 
	parsecs := anAmountOfParsecs.
]
