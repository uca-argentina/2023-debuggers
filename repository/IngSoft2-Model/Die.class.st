Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> with: anAmountOfFaces [ 
	^(self new) initalizeWith: anAmountOfFaces.
]

{ #category : #accessing }
Die >> faces [
	^ faces.
]

{ #category : #initialization }
Die >> initalizeWith: anAmountOfFaces [
	faces:=anAmountOfFaces.
]

{ #category : #'dice rolling' }
Die >> throw [
	^faces atRandom.
]
