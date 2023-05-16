Class {
	#name : #SpeedUpSquare,
	#superclass : #Square,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
SpeedUpSquare >> effect: aGame [
	^ aGame applySpeedUp.
]
