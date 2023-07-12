Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
CancellationCard >> playIn: aGameEventManager from: aPlayerCards to: aTargetPlayedPermanentCard [
	
	| targetCard targetPlayerCards |
	
	targetCard := aTargetPlayedPermanentCard card.
	targetPlayerCards := PlayerCards from: aTargetPlayedPermanentCard target.
	aGameEventManager cancel: targetCard to: targetPlayerCards.
]
