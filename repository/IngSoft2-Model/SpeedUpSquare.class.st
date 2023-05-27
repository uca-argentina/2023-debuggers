Class {
	#name : #SpeedUpSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
SpeedUpSquare >> effect: aGame [
	^ aGame updatePosition: 4.
]
