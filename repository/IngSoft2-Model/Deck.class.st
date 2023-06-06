Class {
	#name : #Deck,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Deck class >> with: aSetOfCards [ 
	^ (self new) initializeWith: aSetOfCards.
]

{ #category : #'drawing cards' }
Deck >> draw [
	^ cards at: (cards size atRandom).
]

{ #category : #initialization }
Deck >> initializeWith: aSetOfCards [
	
	cards := aSetOfCards.
]
