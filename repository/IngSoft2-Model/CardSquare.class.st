Class {
	#name : #CardSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
CardSquare >> effectTo: aTargetHand in: aGameEventManager [ 
	
	aGameEventManager drawCardTo: aTargetHand.
]
