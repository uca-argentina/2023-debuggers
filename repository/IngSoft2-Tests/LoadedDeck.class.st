Class {
	#name : #LoadedDeck,
	#superclass : #Object,
	#instVars : [
		'sequenceHandler'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDeck class >> with: aSetOfCards [ 
	^ (self new) initializeWith: aSetOfCards.
]

{ #category : #'drawing cards' }
LoadedDeck >> draw [
	^ sequenceHandler next.
]

{ #category : #initialization }
LoadedDeck >> initializeWith: aSetOfCards [
	
	sequenceHandler := SequenceHandler with: aSetOfCards.
]
