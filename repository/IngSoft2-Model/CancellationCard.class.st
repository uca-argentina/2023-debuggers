Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
CancellationCard >> equals: anotherCard [

	^ anotherCard isKindOf: self class.
]

{ #category : #'as yet unclassified' }
CancellationCard >> playIn: aCardManager from: aCardOwner to: aTargetPlayedPermanentCard [
	
	| targetCard targetShip |
	
	targetCard := aTargetPlayedPermanentCard card.
	targetShip := aTargetPlayedPermanentCard target.
	aCardManager checkCancel: targetCard to: targetShip.
	aCardManager remove: targetCard to: targetShip.
]
