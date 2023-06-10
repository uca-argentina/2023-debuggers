Class {
	#name : #GalaxyCircuitGame,
	#superclass : #Object,
	#instVars : [
		'ships',
		'diceCup',
		'currentTurn',
		'shipPositions',
		'shipLaps',
		'laps',
		'parsecSize',
		'board',
		'turnOrder',
		'deck',
		'permanentCards',
		'lastCardPlayed',
		'cardManager'
	],
	#classInstVars : [
		'ships',
		'board'
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

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyAtomicBomb [

	ships do: [ :aShip | aShip resetPosition ].
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyEffectTo: aTargetShip [
	
	| landedSquare |
	
	landedSquare := (ships at: aTargetShip) position.
	board effectTo: aTargetShip at: landedSquare in: self.
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyMoonwalk: steps to: aTargetShip [

	ships withIndexDo: [ :aShip :aShipTurnOrder | 
		aShipTurnOrder = aTargetShip ifFalse: [ 
			aShip move: steps. 
			self updateLapTo: aShip ] ].
]

{ #category : #validation }
GalaxyCircuitGame >> checkThereIsNoWinner [

	self hasAWinner ifTrue: [ Error signal: 'Unable to play, Game has already finished' ]
]

{ #category : #accessing }
GalaxyCircuitGame >> currentTurn [
	^ currentTurn
]

{ #category : #'game status' }
GalaxyCircuitGame >> hasAWinner [

	^ ships anySatisfy: [ :aShip | (aShip lap) > laps ]. 
]

{ #category : #initialization }
GalaxyCircuitGame >> initializeWith: somePlayersNames and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck [

	| counter turns |
	
	deck := aDeck.
	lastCardPlayed := NonPlayableCard new.
	permanentCards := OrderedCollection new.
	somePlayersNames size timesRepeat: [ permanentCards add: OrderedCollection new. ].
	cardManager := CardManager with: somePlayersNames using: aDeck.
	ships := somePlayersNames collect: [ :aName | 
		         | aStartingHand |
		         aStartingHand := OrderedCollection new.
		         aStartingHand add: aDeck draw.
		         aStartingHand add: aDeck draw.
		         Ship with: aName and: aStartingHand.].
	board := aBoard.
	laps := anAmountOfLaps.
	diceCup := aDiceCup.
	counter := 1.
	turns := OrderedCollection new.
	ships size timesRepeat: [ 
		turns add: counter.
		counter := counter + 1 ].
	turnOrder := SequenceHandler with: turns.
	currentTurn := turnOrder next
]

{ #category : #accessing }
GalaxyCircuitGame >> lastSquareLanded [

	^ board lastSquareLanded.
]

{ #category : #playing }
GalaxyCircuitGame >> playAccelerationFrom: aCardOwner to: aTargetShip [ 
	
	| anAccelerationCard |
	
	anAccelerationCard := AccelerationCard new.
	cardManager checkThat: aCardOwner has: anAccelerationCard.
	anAccelerationCard playIn: cardManager from: aCardOwner to: aTargetShip.
	cardManager remove: anAccelerationCard from: aCardOwner.
	cardManager updateLastCardPlayed: anAccelerationCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playCancellationFrom: aCardOwner to: aTargetPlayedPermanent [ 
	
	| aCancellationCard |
	
	aCancellationCard := CancellationCard new.
	aCancellationCard playIn: cardManager from: aCardOwner to: aTargetPlayedPermanent.
	cardManager remove: aCancellationCard from: aCardOwner.
	cardManager updateLastCardPlayed: aCancellationCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playOverloadFrom: aCardOwner to: aTargetShip [ 
	
	| anOverloadCard |
	
	anOverloadCard := OverloadCard new.
	cardManager checkThat: aCardOwner has: anOverloadCard.
	anOverloadCard playIn: cardManager from: aCardOwner to: aTargetShip.
	cardManager remove: anOverloadCard from: aCardOwner.
	cardManager updateLastCardPlayed: anOverloadCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playRedoFrom: aCardOwner to: aTarget [ 
	
	| aRedoCard |
	
	aRedoCard := RedoCard new.
	cardManager checkThat: aCardOwner has: aRedoCard.
	aRedoCard playIn: cardManager from: aCardOwner to: aTarget.
	cardManager remove: aRedoCard from: aCardOwner.
]

{ #category : #playing }
GalaxyCircuitGame >> playRepeatFrom: aCardOwner to: aTarget [ 
	
	| aRepeatCard |
	
	aRepeatCard := RepeatCard new.
	cardManager checkThat: aCardOwner has: aRepeatCard.
	aRepeatCard playIn: self from: aCardOwner to: aTarget.
	cardManager remove: aRepeatCard from: aCardOwner.
	cardManager updateLastCardPlayed: aRepeatCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playSpeedFrom: aCardOwner to: aTargetShip [ 
	
	| aSpeedCard |
	
	aSpeedCard := SpeedCard new.
	aSpeedCard checkPlayedBy: aCardOwner matches: currentTurn. 
	cardManager checkThat: aCardOwner has: aSpeedCard.
	aSpeedCard playIn: cardManager from: aCardOwner to: aTargetShip.
	cardManager remove: aSpeedCard from: aCardOwner.
	cardManager updateLastCardPlayed: aSpeedCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playTurn [

	self checkThereIsNoWinner.
	self updatePosition: (diceCup throw + (cardManager usePermanentCardsFrom: currentTurn)) to: currentTurn.
	self applyEffectTo: currentTurn.
	self updateTurn
]

{ #category : #accessing }
GalaxyCircuitGame >> shipLaps [
	^ ships collect: [ :aShip | aShip lap].
]

{ #category : #accessing }
GalaxyCircuitGame >> shipPositions [

	^ ships collect: [ :aShip | aShip position].
]

{ #category : #'game status' }
GalaxyCircuitGame >> shipRanking [

	| ranking |
	
	ranking := ships sort: [ :aShip :anotherShip | (((aShip lap) * board size) + aShip position) >= (((anotherShip lap) * board size) + anotherShip position) ].
	^ ranking
]

{ #category : #playing }
GalaxyCircuitGame >> updateLapTo: aShip [

	| lapAdded newPosition |
	(board outOfBoardBounds: aShip position) ifFalse: [ ^ self ].
	lapAdded := (aShip position / board size) floor.
	newPosition := aShip position % board size.
	newPosition = 0 ifTrue: [ 
		newPosition := board size.
		lapAdded := lapAdded - 1 ].
	aShip moveLaps: lapAdded and: newPosition
]

{ #category : #playing }
GalaxyCircuitGame >> updateParsecs: parsecSteps to: aTargetShip [

	| turnShip steps |
	turnShip := ships at: aTargetShip.
	steps := board parsecMovementToSquare: ((parsecSteps + turnShip parsec) - 1).
	steps := steps > 0
		         ifTrue: [ steps truncated ]
		         ifFalse: [ steps floor ].
	turnShip move: steps.
	turnShip parsecMove: (board checkParsecLandedWith: parsecSteps).
	self updateLapTo: turnShip
]

{ #category : #playing }
GalaxyCircuitGame >> updatePosition: steps to: aTargetShip [

	| targetShip |
	
	targetShip := ships at: aTargetShip.
	targetShip move: steps.
	self updateLapTo: targetShip.
]

{ #category : #playing }
GalaxyCircuitGame >> updateTurn [

	currentTurn := turnOrder next.
	cardManager updateTurn: currentTurn.
]

{ #category : #'game status' }
GalaxyCircuitGame >> winner [

	^ ships detect: [ :aShip | aShip lap > laps ] ifNone: [ ^ nil ]
]
