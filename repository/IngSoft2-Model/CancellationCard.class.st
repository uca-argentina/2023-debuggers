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
CancellationCard >> playIn: aGame from: aCardOwner cancels: aCard to: aTargetShip [
	
	aGame checkCancel: aCard to: aTargetShip.
	aGame checkThat: aCardOwner has: self.
	aGame remove: aCard to: aTargetShip.
	aGame remove: self from: aCardOwner.
]

{ #category : #'as yet unclassified' }
CancellationCard >> playIn: aGame from: aCardOwner to: aTargetPlayedPermanentCard [
	
	| targetCard targetShip |
	
	targetCard := aTargetPlayedPermanentCard card.
	targetShip := aTargetPlayedPermanentCard target.
	aGame checkCancel: targetCard to: targetShip.
	aGame remove: targetCard to: targetShip.
]
