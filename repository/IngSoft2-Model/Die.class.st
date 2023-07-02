Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
Die class >> checkAmountOfFaces: anAmountOfFaces [

	(anAmountOfFaces <= 0)ifTrue:[Error signal: 'Unable to create dice with 0 or less faces'].
]

{ #category : #'instance creation' }
Die class >> with: anAmountOfFaces [ 
	self checkAmountOfFaces: anAmountOfFaces.
	^(self new) initalizeWith: anAmountOfFaces.
]

{ #category : #initialization }
Die >> initalizeWith: anAmountOfFaces [
	faces:=anAmountOfFaces.
]

{ #category : #'dice rolling' }
Die >> throw [
	^faces atRandom.
]
