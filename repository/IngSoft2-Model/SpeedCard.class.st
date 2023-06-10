Class {
	#name : #SpeedCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedCard >> effect [

	^ 1.
]

{ #category : #'as yet unclassified' }
SpeedCard >> equals: anotherCard [

	^ anotherCard isKindOf: SpeedCard.
]

{ #category : #'playing card' }
SpeedCard >> playIn: aGame from: aCardOwner to: aTargetShip [
	
	self checkPlayedBy: aCardOwner matches: aGame currentTurn.
	aGame add: self to: aTargetShip.
	
]
