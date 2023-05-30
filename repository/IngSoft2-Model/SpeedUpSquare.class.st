Class {
	#name : #SpeedUpSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
SpeedUpSquare >> effect: aGame [
	^ aGame updatePosition: 4.
]

{ #category : #accessing }
SpeedUpSquare >> type [
	^ 'Speed Up Effect'.
]
