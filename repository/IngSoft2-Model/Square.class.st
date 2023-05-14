Class {
	#name : #Square,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Square class >> with: anEffect [
	^ (self new) initializeWith: anEffect.
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
