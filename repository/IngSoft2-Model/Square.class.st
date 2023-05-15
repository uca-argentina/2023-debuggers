Class {
	#name : #Square,
	#superclass : #Object,
	#instVars : [
		'effect',
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Square class >> with: anEffect [
	^ (self new) initializeWith: anEffect.
]

{ #category : #'as yet unclassified' }
Square >> haveCollectionOfHyperJumpSquares [

	effect typeOfEffect = 'HyperJump'
		ifTrue: [ ^ effect collectionOfSquares ]
		ifFalse: [ ^ 1 ]
]

{ #category : #'as yet unclassified' }
Square >> haveParsecs [

	effect typeOfEffect = 'HyperJump'
		ifTrue: [ ^ effect haveParsecs ]
		ifFalse: [ ^ 1 ]
]

{ #category : #initialization }
Square >> initializeWith: anEffect [ 
	effect := anEffect.
]

{ #category : #accessing }
Square >> position [
	^ effect position.
]

{ #category : #accessing }
Square >> typeOfEffect [
	^ effect typeOfEffect.
	
]
