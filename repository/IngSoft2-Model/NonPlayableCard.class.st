Class {
	#name : #NonPlayableCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
NonPlayableCard >> playIn: aGame from: aCardOwner to: aTarget [
	
	Error signal: 'Cannot Redo Card, no card has been played yet'
]
