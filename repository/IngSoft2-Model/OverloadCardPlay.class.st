Class {
	#name : #OverloadCardPlay,
	#superclass : #Object,
	#instVars : [
		'card',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
OverloadCardPlay class >> with: aTargetShip [ 
	^ (self new) initializeWith: aTargetShip.
]

{ #category : #'as yet unclassified' }
OverloadCardPlay >> card [
	^ card
]

{ #category : #initialization }
OverloadCardPlay >> initializeWith: aTargetShip [

	card := OverloadCard new.
	target := aTargetShip.
]

{ #category : #'as yet unclassified' }
OverloadCardPlay >> playIn: aGame [

	aGame add: card to: target.
]
