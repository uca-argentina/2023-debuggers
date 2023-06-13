Class {
	#name : #PermanentCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'card playability' }
PermanentCard >> checkPlayedBy: aCardOwner matches: currentTurnShip [

	(aCardOwner = currentTurnShip) ifFalse: [ Error signal: 'Unable to play permanent card when its not your turn' ]
]
