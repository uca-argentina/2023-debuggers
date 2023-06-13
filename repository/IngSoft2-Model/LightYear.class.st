Class {
	#name : #LightYear,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LightYear class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #'unit conversion' }
LightYear >> convertToParsec [

	^ value / 3
]

{ #category : #initialization }
LightYear >> initializeWith: aValue [
	value := aValue
]
