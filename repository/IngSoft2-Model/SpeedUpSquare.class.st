Class {
	#name : #SpeedUpSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
SpeedUpSquare >> effect: aGame [
	^ aGame updatePosition: 4.
]

{ #category : #'as yet unclassified' }
SpeedUpSquare >> effectTo: aTargetShip in: aGame [

	^ aGame updatePosition: 4 to: aTargetShip.
]
