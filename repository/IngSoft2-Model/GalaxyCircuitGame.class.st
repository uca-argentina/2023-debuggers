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
		'hyperJumpValues',
		'board',
		'turnOrder',
		'deck',
		'permanentCards',
		'lastCardplayed'
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

{ #category : #'card effects' }
GalaxyCircuitGame >> add: aPermanentCard to: aTargetShip [

	(permanentCards at: aTargetShip) add: aPermanentCard.
]

{ #category : #'card effects' }
GalaxyCircuitGame >> addToAllPermanentPiles: aPermanentCard [

	permanentCards do: [ :aPermanentCardPile | aPermanentCardPile add: aPermanentCard ].
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyAtomicBomb [

	ships do: [ :aShip | aShip resetPosition ].
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyEffect [
	
	| landedSquare |
	
	landedSquare := ((ships at: currentTurn) position).
	board effectTo: self at: landedSquare.
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyMoonwalk: steps [

	ships withIndexDo: [ :aShip :aShipTurnOrder | 
		aShipTurnOrder = currentTurn ifFalse: [ 
			aShip move: steps. 
			self updateLapTo: aShip ] ].
]

{ #category : #'as yet unclassified' }
GalaxyCircuitGame >> checkCancel: aPermanentCardToCancel to: targetShip [

	((permanentCards at: targetShip) anySatisfy: [ :aCard | 
		 aCard equals: aPermanentCardToCancel ]) ifFalse: [ 
		Error signal: 'Unable to cancel the permanent card because there is no such card in effect' ]
]

{ #category : #'as yet unclassified' }
GalaxyCircuitGame >> checkHandFrom: aCardOwner [
	
	| cardOwner |
	
	cardOwner := ships at: aCardOwner.
	
	(cardOwner emptyHand) ifTrue: [ Error signal: 'Unable to play card when the player has no cards' ]
]

{ #category : #'as yet unclassified' }
GalaxyCircuitGame >> checkPlayed: aCard from: aCardOwner [

	(aCardOwner = currentTurn or: aCard playableOnAnyTurn) ifFalse: [ Error signal: 'Unable to play permanent card when its not your turn' ]
]

{ #category : #'as yet unclassified' }
GalaxyCircuitGame >> checkThat: aCardOwner has: aCard [
	
	| cardOwner |
	
	cardOwner := ships at: aCardOwner.
	
	(cardOwner has: aCard) ifFalse: [ Error signal: 'Unable to play card when the player does not own the card' ]
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
	lastCardplayed := nil.
	permanentCards := OrderedCollection new.
	somePlayersNames size timesRepeat: [ permanentCards add: OrderedCollection new. ].
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

{ #category : #playing }
GalaxyCircuitGame >> play: aCardPlay from: aCardOwner [ 
	
	self checkHandFrom: aCardOwner.
	self checkThat: aCardOwner has: aCardPlay card.
	self checkPlayed: aCardPlay card from: aCardOwner.
	aCardPlay playIn: self.
	self remove: (aCardPlay card) from: aCardOwner.
]

{ #category : #playing }
GalaxyCircuitGame >> playTurn [

	self checkThereIsNoWinner.
	self updatePosition: (diceCup throw + (self usePermanentCards)).
	self applyEffect.
	self updateTurn
]

{ #category : #removing }
GalaxyCircuitGame >> remove: aCard from: aCardOwner [

	(ships at: aCardOwner) removeFromHand: aCard.
]

{ #category : #'card effects' }
GalaxyCircuitGame >> remove: aPermanentCardToCancel to: aTargetShip [
	
	| targetShipPile cardToRemove |
	
	"cardToRemove := hand detect: [ :aHandCard | aHandCard equals: aCard ].
	hand remove: cardToRemove."
	
	targetShipPile := permanentCards at: aTargetShip.
	cardToRemove := targetShipPile detect: [ :aCard | aCard equals: aPermanentCardToCancel ].
	targetShipPile remove: cardToRemove.
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
GalaxyCircuitGame >> updateParsecs: parsecSteps [

	| turnShip steps |
	turnShip := ships at: currentTurn.
	steps := board parsecMovementToSquare: ((parsecSteps + turnShip parsec) - 1).
	steps := steps > 0
		         ifTrue: [ steps truncated ]
		         ifFalse: [ steps floor ].
	turnShip move: steps.
	turnShip parsecMove: (board checkParsecLandedWith: parsecSteps).
	self updateLapTo: turnShip
]

{ #category : #playing }
GalaxyCircuitGame >> updatePosition: steps [

	| turnShip |
	
	turnShip := ships at: currentTurn.
	turnShip move: steps.
	self updateLapTo: turnShip.
]

{ #category : #playing }
GalaxyCircuitGame >> updateTurn [

	currentTurn := turnOrder next.
]

{ #category : #'card effects' }
GalaxyCircuitGame >> usePermanentCards [
	
	^ (permanentCards at: currentTurn) sumNumbers: [ :aPermanentCard | aPermanentCard effect ]
]

{ #category : #'game status' }
GalaxyCircuitGame >> winner [

	^ ships detect: [ :aShip | aShip lap > laps ] ifNone: [ ^ nil ]
]
