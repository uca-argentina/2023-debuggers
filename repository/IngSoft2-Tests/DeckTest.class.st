Class {
	#name : #DeckTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DeckTest >> test001ADeckCanDrawASpeedCard [

	| aSpeedCard cards aDeck |
	
	aSpeedCard := SpeedCard new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	aDeck := Deck with:cards. 
	
	self assert: (aDeck draw isKindOf: SpeedCard).
]

{ #category : #tests }
DeckTest >> test002ADeckCanDrawAnOverloadCard [

	| anOverloadCard cards aDeck |
	
	anOverloadCard := OverloadCard new.
	cards := OrderedCollection new.
	cards add: anOverloadCard.
	aDeck := Deck with:cards. 
	
	self assert: (aDeck draw isKindOf: OverloadCard).
]

{ #category : #tests }
DeckTest >> test003ADeckCanDrawAnyRandomCard [

	| anOverloadCard cards aDeck aSpeedCard aDraw |
	
	aSpeedCard := SpeedCard new.
	anOverloadCard := OverloadCard new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	cards add: anOverloadCard.
	aDeck := Deck with:cards. 
	aDraw := aDeck draw.
	
	self assert: ((aDraw isKindOf: OverloadCard) or: (aDraw isKindOf: SpeedCard)).
]

{ #category : #tests }
DeckTest >> test004ALoadedDeckWillDrawTheSameCardsInSequence [

	| anOverloadCard cards aDeck aSpeedCard aDraw |
	
	aSpeedCard := SpeedCard new.
	anOverloadCard := OverloadCard new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	cards add: anOverloadCard.
	aDeck := LoadedDeck with:cards. 
	
	self assert: (aDeck draw isKindOf: SpeedCard).
	self assert: (aDeck draw isKindOf: OverloadCard).
	self assert: (aDeck draw isKindOf: SpeedCard).
]
