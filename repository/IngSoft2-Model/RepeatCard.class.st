Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
RepeatCard >> playIn: aGameEventManager from: aPlayerCards to: aTargetPlayer [
	
	aGameEventManager repeatLastSquareLandedTo: (Ship with: aTargetPlayer).
]
