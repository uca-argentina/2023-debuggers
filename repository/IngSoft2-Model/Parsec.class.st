Class {
	#name : #Parsec,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Parsec class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #'unit conversion' }
Parsec >> convertToParsec [

	^ value

]

{ #category : #initialization }
Parsec >> initializeWith: aValue [

	value := aValue
]
