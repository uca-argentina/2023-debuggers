Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Ship class >> withPosition: aPosition [
	^((self new) initializeWithPosition: aPosition).
]

{ #category : #intialization }
Ship >> initializeWithPosition: aPosition [  
	position := aPosition.
]

{ #category : #validation }
Ship >> isValid [
	^true.
]

{ #category : #accessing }
Ship >> move: anInteger [
	position := position + anInteger.
]

{ #category : #accessing }
Ship >> position [
	^ position.
]
