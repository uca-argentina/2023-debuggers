Class {
	#name : #AccelerationCardPlay,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AccelerationCardPlay >> card [ 
	^ AccelerationCard new.
]

{ #category : #'as yet unclassified' }
AccelerationCardPlay >> playIn: aGame [

	aGame addToAllPermanentPiles: AccelerationCard new.
]
