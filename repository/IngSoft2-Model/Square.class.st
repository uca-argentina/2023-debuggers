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

{ #category : #accessing }
Square >> effect: aGame [
	^ self subclassResponsibility.
]
