Class {
	#name : #SpeedUpSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedUpSquare >> effectTo: aTargetShip in: aGame [

	aGame updatePosition: 4 to: aTargetShip.
]
