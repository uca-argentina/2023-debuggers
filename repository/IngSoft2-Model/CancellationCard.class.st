Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
CancellationCard >> playIn: aGameEventManager from: aCardOwner to: aTargetPlayedPermanentCard [
	
	| targetCard targetShip aCardManager |
	
	aCardManager := aGameEventManager cardManager.
	targetCard := aTargetPlayedPermanentCard card.
	targetShip := aTargetPlayedPermanentCard target.
	aCardManager checkCancel: targetCard to: targetShip.
	aCardManager remove: targetCard to: targetShip.
]
