Class {
	#name : #GalaxyCircuitGame,
	#superclass : #Object,
	#instVars : [
		'diceCup',
		'turnOrder',
		'cardManager',
		'movementManager',
		'gameEventManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
GalaxyCircuitGame class >> checkForDuplicated: somePlayerNames [

	somePlayerNames do: [ :aName | 
		(somePlayerNames count: [ :anotherName | 
			 aName = anotherName ]) >= 2 ifTrue: [ 
			Error signal: 'Ship already exists with that name' ] ]
]

{ #category : #validation }
GalaxyCircuitGame class >> checkLaps: anAmountOfLaps [ 

	(anAmountOfLaps <= 0) ifTrue: [ Error signal: 'Amount of laps cannot be 0 or lower' ]
]

{ #category : #'instance creation' }
GalaxyCircuitGame class >> with: somePlayersName and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck [
	self checkForDuplicated: somePlayersName.
	self checkLaps: anAmountOfLaps.
	^((self new) initializeWith: somePlayersName and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck).
]

{ #category : #accessing }
GalaxyCircuitGame >> currentTurn [

	^ gameEventManager currentTurn.
]

{ #category : #initialization }
GalaxyCircuitGame >> initializeWith: somePlayersNames and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck [

	| counter turns |
	
	cardManager := CardManager with: somePlayersNames using: aDeck.
	movementManager := MovementManager with: somePlayersNames and: anAmountOfLaps using: aBoard.
	diceCup := aDiceCup.
	counter := 1.
	turns := OrderedCollection new.
	somePlayersNames size timesRepeat: [ 
		turns add: counter.
		counter := counter + 1 ].
	turnOrder := SequenceHandler with: turns.
	gameEventManager := GameEventManager with: cardManager and: movementManager and: turnOrder.
]

{ #category : #playing }
GalaxyCircuitGame >> playAccelerationFrom: aCardOwner to: aTargetShip [ 
	
	| anAccelerationCard |
	
	anAccelerationCard := AccelerationCard new.
	cardManager checkThat: aCardOwner has: anAccelerationCard.
	anAccelerationCard playIn: gameEventManager from: aCardOwner to: aTargetShip.
	cardManager remove: anAccelerationCard from: aCardOwner.
	cardManager updateLastCardPlayed: anAccelerationCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playCancellationFrom: aCardOwner to: aTargetPlayedPermanent [ 
	
	| aCancellationCard |
	
	aCancellationCard := CancellationCard new.
	cardManager checkThat: aCardOwner has: aCancellationCard.
	aCancellationCard playIn: gameEventManager from: aCardOwner to: aTargetPlayedPermanent.
	cardManager remove: aCancellationCard from: aCardOwner.
	cardManager updateLastCardPlayed: aCancellationCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playOverloadFrom: aCardOwner to: aTargetShip [ 
	
	| anOverloadCard |
	
	anOverloadCard := OverloadCard new.
	cardManager checkThat: aCardOwner has: anOverloadCard.
	anOverloadCard playIn: gameEventManager from: aCardOwner to: aTargetShip.
	cardManager remove: anOverloadCard from: aCardOwner.
	cardManager updateLastCardPlayed: anOverloadCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playRedoFrom: aCardOwner to: aTarget [ 
	
	| aRedoCard |
	
	aRedoCard := RedoCard new.
	cardManager checkThat: aCardOwner has: aRedoCard.
	aRedoCard playIn: gameEventManager from: aCardOwner to: aTarget.
	cardManager remove: aRedoCard from: aCardOwner.
	cardManager updateLastCardPlayed: aRedoCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playRepeatFrom: aCardOwner to: aTarget [ 
	
	| aRepeatCard |
	
	aRepeatCard := RepeatCard new.
	cardManager checkThat: aCardOwner has: aRepeatCard.
	aRepeatCard playIn: gameEventManager from: aCardOwner to: aTarget.
	cardManager remove: aRepeatCard from: aCardOwner.
	cardManager updateLastCardPlayed: aRepeatCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playSpeedFrom: aCardOwner to: aTargetShip [ 
	
	| aSpeedCard |
	
	aSpeedCard := SpeedCard new.
	cardManager checkThat: aCardOwner has: aSpeedCard.
	aSpeedCard playIn: gameEventManager from: aCardOwner to: aTargetShip.
	cardManager remove: aSpeedCard from: aCardOwner.
	cardManager updateLastCardPlayed: aSpeedCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playTurn [

	gameEventManager checkThereIsNoWinner.
	gameEventManager moveCurrentTurnPlayer: diceCup throw.
	gameEventManager applyEffectToCurrentTurnPlayer.
	gameEventManager updateTurn.
]

{ #category : #accessing }
GalaxyCircuitGame >> shipLaps [

	^ movementManager shipLaps
]

{ #category : #accessing }
GalaxyCircuitGame >> shipPositions [

	^ movementManager shipPositions.
]

{ #category : #'game status' }
GalaxyCircuitGame >> shipRanking [

	^ movementManager shipRanking.
]

{ #category : #'game status' }
GalaxyCircuitGame >> winner [

	^ movementManager winner.
]
