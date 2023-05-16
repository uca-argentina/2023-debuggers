Class {
	#name : #Square,
	#superclass : #Object,
	#instVars : [
		'effect',
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
Square class >> isAbstract [
		
	^ self == Square
]

{ #category : #'instance creation' }
Square class >> with: anEffect [
	^ (self new) initializeWith: anEffect.
]

{ #category : #accessing }
Square >> effect: aGame [
	^ self subclassResponsibility.
]
