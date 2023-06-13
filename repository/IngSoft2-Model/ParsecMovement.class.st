Class {
	#name : #ParsecMovement,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ParsecMovement class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #'unit conversion' }
ParsecMovement >> convertToParsec [

	^ value

]

{ #category : #initialization }
ParsecMovement >> initializeWith: aValue [

	value := aValue
]
