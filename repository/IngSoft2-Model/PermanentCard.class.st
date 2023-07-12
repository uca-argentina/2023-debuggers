Class {
	#name : #PermanentCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'card playability' }
PermanentCard >> checkPlayedBy: aPlayerCards matches: currentTurnPlayerCards [

	(aPlayerCards equals: currentTurnPlayerCards) ifFalse: [ Error signal: 'Unable to play permanent card when its not your turn' ]
]

{ #category : #'playing card' }
PermanentCard >> playIn: aGameEventManager from: aPlayerCards to: aTargetPlayer [

	self checkPlayedBy: aPlayerCards matches: (PlayerCards from: aGameEventManager currentTurn).
	aGameEventManager addPermanent: self to: (PlayerCards from: aTargetPlayer).
]
