Class {
	#name : #LightYearMovement,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LightYearMovement class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #'unit conversion' }
LightYearMovement >> convertToParsec [

	^ value / 3
]

{ #category : #initialization }
LightYearMovement >> initializeWith: aValue [
	value := aValue
]
