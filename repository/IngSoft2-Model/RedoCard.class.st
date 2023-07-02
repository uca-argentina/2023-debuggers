Class {
	#name : #RedoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
RedoCard >> playIn: aGameEventManager from: aPlayerCards to: aTargetPlayer [
	
	aGameEventManager redoLastCardPlayedFrom: aPlayerCards to: aTargetPlayer.
	
]
