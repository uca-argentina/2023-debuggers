Class {
	#name : #GalaxyCircuitGameTest,
	#superclass : #TestCase,
	#instVars : [
		'die1',
		'die2',
		'anAmountOfLaps',
		'aSmallAmountOfSquares',
		'aPlayerName1',
		'aPlayerName2',
		'aPlayerName3'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWith: anAmountOfSquares of: square and: anAmountOfParsecs [

	| aGame aCollectionOfPlayerNames dice aDiceCup squares aBoard |
	
	aCollectionOfPlayerNames := OrderedCollection
		                      with: aPlayerName1
		                      with: aPlayerName2
		                      with: aPlayerName3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	squares := OrderedCollection new.
	anAmountOfSquares timesRepeat: [ squares add: square. ].
	aBoard := Board with: squares and: anAmountOfParsecs.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfPlayerNames
		         and: aBoard
					and: anAmountOfLaps
		         uses: aDiceCup.
	^ aGame.
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWith: anAmountOfSquares of: square and: anAmountOfParsecs onlyUsing: aCard [

	| aGame aCollectionOfPlayerNames dice aDiceCup squares aBoard cards aDeck |
	
	aCollectionOfPlayerNames := OrderedCollection
		                      with: aPlayerName1
		                      with: aPlayerName2
		                      with: aPlayerName3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	squares := OrderedCollection new.
	anAmountOfSquares timesRepeat: [ squares add: square. ].
	cards := OrderedCollection with: aCard.
	aDeck := Deck with: cards.
	aBoard := Board with: squares and: anAmountOfParsecs.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfPlayerNames
		         and: aBoard
					and: anAmountOfLaps
		         uses: aDiceCup
					uses: aDeck.
	^ aGame.
]

{ #category : #'set up' }
GalaxyCircuitGameTest >> aGameWithRandomSquares [

	| aGame aCollectionOfShips dice aDiceCup squares anAmountOfParsecs aBoard randomSquareGenerator anAmountOfSquares squaresToUse distribution aSpeedCard anOverloadCard cards aDeck |
	
	aCollectionOfShips := OrderedCollection
		                      with: aPlayerName1
		                      with: aPlayerName2
		                      with: aPlayerName3.
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.
	anAmountOfSquares := 30.
	anAmountOfParsecs := 30.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: #( 4 1 ) asOrderedCollection).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	distribution := #( 2 8 10 20 20 40 ) asOrderedCollection.
	randomSquareGenerator := SquareGenerator
		                         with: anAmountOfSquares 
		                         of: squaresToUse
		                         using: distribution.
	squares := randomSquareGenerator generateSquares.
	aSpeedCard := SpeedCard new.
	anOverloadCard := OverloadCard new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	cards add: anOverloadCard.
	aDeck := Deck with:cards.
	aBoard := Board with: squares and: anAmountOfParsecs.
	aGame := GalaxyCircuitGame
		         with: aCollectionOfShips
		         and: aBoard
					and: anAmountOfLaps
		         uses: aDiceCup
					uses: aDeck.
	^ aGame.	
]

{ #category : #running }
GalaxyCircuitGameTest >> setUp [
	
	super setUp.	
		
	aPlayerName1 := 'Mafalda'.
	aPlayerName2 := 'Juan'.
	aPlayerName3 := 'Martin'.
	anAmountOfLaps := 5.
	die1 := LoadedDie with: #( 7 5 3) asOrderedCollection.
	die2 := LoadedDie with: #( 7 6 2) asOrderedCollection.

	

	
	

]

{ #category : #asserting }
GalaxyCircuitGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
GalaxyCircuitGameTest >> test001AGameCanStartWithManyShipsAndCanPlayATurnAndTheCurrentTurnAdvancesByOne [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 4.
	anAmountOfParsecs := 4.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: aGame currentTurn equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test002AGameCanPlayEveryPlayersTurnAtLeastOnce [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
	self assert: ((aGame shipPositions) at: 2) equals: 12.
	self assert: ((aGame shipPositions) at: 3) equals: 6.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test003AGameCanBePlayEveryPlayersTurnAndThenStartAnotherRound [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: aGame currentTurn equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test004AGameCanTellMeTheWinner [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 2.
	anAmountOfParsecs := 2.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame winner) name) equals: aPlayerName1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test005AGameWithoutAWinnerWillReturnNothing [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 20.
	anAmountOfParsecs := 20.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.
		
	self assert: ((aGame winner) isNil).
]

{ #category : #tests }
GalaxyCircuitGameTest >> test006AGameWithAWinnerCannotBePlayed [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 2.
	anAmountOfParsecs := 2.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.

	aGame playTurn.

	self
		should: [ aGame playTurn ]
		raise: Error
		withMessage: 'Unable to play, Game has already finished'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test007AGameWithManyShipsCanTellMeItsShipsPositions [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.

	self
		assert: aGame shipPositions 
		equals: #( 1 1 1 ) asOrderedCollection
]

{ #category : #tests }
GalaxyCircuitGameTest >> test008AGameCannotStartWithDuplicatedShips [
	
	| aCollectionOfShips dice aDiceCup noEffectSquare squares anAmountOfParsecs aBoard aCard cards aDeck |
	
	aCollectionOfShips := OrderedCollection with: aPlayerName1 with: aPlayerName1.
	dice := OrderedCollection with: die1.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	aCard := SpeedCard new.
	cards := OrderedCollection with: aCard.
	aDeck := Deck with: cards.
	anAmountOfParsecs := 1.
	aBoard := Board with: squares and: anAmountOfParsecs.
	
	self
		should: [ GalaxyCircuitGame
				with: aCollectionOfShips
				and: aBoard
				and: anAmountOfLaps
				uses: aDiceCup
				uses: aDeck ]
		raise: Error
		withMessage: 'Ship already exists with that name'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test009AGameCannotStartWithZeroOrLowerAmountOfLaps [

	| aCollectionOfShips dice aDiceCup noEffectSquare squares anAmountOfParsecs aBoard invalidAmountOfLaps aCard cards aDeck |
	
	aCollectionOfShips := OrderedCollection with: aPlayerName1.
	dice := OrderedCollection with: die1.
	aDiceCup := DiceCup with: dice.
	noEffectSquare := NoEffectSquare new.
	squares := OrderedCollection new.
	squares add: noEffectSquare.
	aCard := SpeedCard new.
	cards := OrderedCollection with: aCard.
	aDeck := Deck with: cards.
	anAmountOfParsecs := 1.
	aBoard := Board with: squares and: anAmountOfParsecs.
	invalidAmountOfLaps := -2.

	self
		should: [ 
			GalaxyCircuitGame
				with: aCollectionOfShips
				and: aBoard
				and: invalidAmountOfLaps
				uses: aDiceCup 
				uses: aDeck]
		raise: Error
		withMessage: 'Amount of laps cannot be 0 or lower'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test010AGameBoardIsCircularPlayersCanAdvanceLaps [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 10.
	anAmountOfParsecs := 10.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 5.
	self assert: ((aGame shipLaps) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test011AGameBoardIsCircularPlayersCanAdvanceManyLaps [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 4.
	anAmountOfParsecs := 4.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 3.
	self assert: ((aGame shipLaps) at: 1) equals: 4.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test012AGameWithOnlyNoEffectSquaresWontMoveShipsWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 15.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test013AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: SpeedUpSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 19.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test014AGameWithOnlySpeedUpSquaresMovesShipsFourSquaresFowardWhenTheyLandOnThoseSquaresAndShipsCanAdvanceLapsWithTheEffect [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 16.
	anAmountOfParsecs := 16.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: SpeedUpSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 3.
	self assert: ((aGame shipLaps) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test015AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: WormholeSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test016AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquaresAndShipsCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	amountOfSquares := 12.
	anAmountOfParsecs := 12.
	aSpeedCard := SpeedCard new.
	aGame := self
		         aGameWith: amountOfSquares
		         of: WormholeSquare new
		         and: anAmountOfParsecs
					onlyUsing: aSpeedCard.
	aGame playTurn.

	self assert: (aGame shipPositions at: 1) equals: 11.
	self assert: (aGame shipLaps at: 1) equals: 1
]

{ #category : #tests }
GalaxyCircuitGameTest >> test017AGameWithOnlyWormholeSquaresMovesShipsFourSquaresBackwardsWhenTheyLandOnThoseSquaresAndShipsCanGoBackManyLapsWithTheEffect [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	amountOfSquares := 2.
	anAmountOfParsecs := 2.
	aSpeedCard := SpeedCard new.
	aGame := self
		         aGameWith: amountOfSquares
		         of: WormholeSquare new
		         and: anAmountOfParsecs
					onlyUsing: aSpeedCard.

	aGame playTurn.

	self assert: (aGame shipPositions at: 1) equals: 1.
	self assert: (aGame shipLaps at: 1) equals: 6.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test018AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: AtomicBombSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 1.
	self assert: ((aGame shipPositions) at: 2) equals: 1.
	self assert: ((aGame shipPositions) at: 3) equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test019AGameWithOnlyAtomicBombSquaresMovesAllShipsBackToTheFirstSquareWhenTheyLandOnThoseSquaresButTheyKeepTheLapsDone [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 10.
	anAmountOfParsecs := 10.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: AtomicBombSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipLaps) at: 1) equals: 2.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test020AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aMoonwalkSquare anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	aMoonwalkSquare := MoonwalkSquare with: 4.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: aMoonwalkSquare and: anAmountOfParsecs onlyUsing: aSpeedCard.

	aGame playTurn.
	aGame playTurn.
	
	self assert: (aGame shipPositions at: 1) equals: 11.
	self assert: (aGame shipPositions at: 2) equals: 8
]

{ #category : #tests }
GalaxyCircuitGameTest >> test021AGameWithOnlyMoonwalkSquaresMovesAllOtherShipsBackAnAmountOfSquaresSpecifiedByTheSquareWhenTheyLandOnThoseSquaresCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares aMoonwalkSquare anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 12.
	aMoonwalkSquare := MoonwalkSquare with: 4.
	anAmountOfParsecs := 12.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: aMoonwalkSquare and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
	self assert: ((aGame shipLaps) at: 1) equals: 1.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test022AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquares [

	| aGame amountOfSquares aHyperJumpSquare anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	aHyperJumpSquare := HyperJumpSquare with: (#(20 10) asOrderedCollection).
	anAmountOfParsecs := 60.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 25.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test023AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsFowardWhenTheyLandOnThoseSquaresCanAdvanceLapsWithTheEffect [

	| aGame amountOfSquares aHyperJumpSquare anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	aHyperJumpSquare := HyperJumpSquare with: (#(40 5) asOrderedCollection).
	anAmountOfParsecs := 60.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: anAmountOfParsecs onlyUsing: aSpeedCard .

	aGame playTurn.

	self assert: (aGame shipLaps at: 1) equals: 2
]

{ #category : #tests }
GalaxyCircuitGameTest >> test024AGameWithOnlyHyperJumpSquaresMovesShipsAnAmountOfParsecsBackwardsWhenTheyLandOnThoseSquaresCanGoBackLapsWithTheEffect [

	| aGame amountOfSquares aHyperJumpSquare anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 10.
	aHyperJumpSquare := HyperJumpSquare with: (#(-20) asOrderedCollection).
	anAmountOfParsecs := 20.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: aHyperJumpSquare and: anAmountOfParsecs onlyUsing: aSpeedCard.

	aGame playTurn.

	self assert: (aGame shipLaps at: 1) equals: 1
]

{ #category : #tests }
GalaxyCircuitGameTest >> test025AGameCanGiveMeARankingOfItsShips [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.

	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipRanking at: 1) name) equals: aPlayerName1.
	self assert: ((aGame shipRanking at: 2) name) equals: aPlayerName2.
	self assert: ((aGame shipRanking at: 3) name) equals: aPlayerName3.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test026AGameCanPlayUsingABoardThatHasRandomSquares [

	| aGame |
	
	aGame := self aGameWithRandomSquares.
	
	aGame playTurn.
	aGame playTurn.
	
	self assert: (aGame currentTurn) equals: 3.
	
]

{ #category : #tests }
GalaxyCircuitGameTest >> test028AGameShipCanLandOnTheLastSquareWhenMovingLaps [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard |
	
	amountOfSquares := 5.
	anAmountOfParsecs := 5.
	aSpeedCard := SpeedCard new.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 5.
	self assert: ((aGame shipLaps) at: 1) equals: 3.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test029AGameCanPlayASpeedPermanentCardUsingADeckWithOnlySpeedCardsThenTheTargetShipMovesAnExtraSquareWhenItMoves [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aPlayerNumber |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aPlayerNumber := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame play: aSpeedCard from: 1 to: 1.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 16.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test030AGameCanPlayManySpeedPermanentCardAndItsEffectStacks [

	| aGame amountOfSquares anAmountOfParsecs aSpeedCard aPlayerNumber |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	aSpeedCard := SpeedCard new.
	aPlayerNumber := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: aSpeedCard.
	
	aGame play: aSpeedCard from: 1 to: 1.
	aGame play: aSpeedCard from: 1 to: 1.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 17.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test031AGameCanPlayAnOverloadPermanentCardUsingADeckWithOnlyPermanentCardsThenTheTargetShipMovesTwoSquaresLessWhenItMoves [

	| aGame amountOfSquares anAmountOfParsecs anOverloadCard aPlayerNumber |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	anOverloadCard := OverloadCard new.
	aPlayerNumber := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: anOverloadCard.
	
	aGame play: anOverloadCard from: 1 to: 1.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 13.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test032AGameCanPlayManyOverLoadPermanentCardAndItsEffectStacks [

	| aGame amountOfSquares anAmountOfParsecs anOverloadCard aPlayerNumber |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	anOverloadCard := OverloadCard new.
	aPlayerNumber := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: anOverloadCard.
	
	aGame play: anOverloadCard from: 1 to: 1.
	aGame play: anOverloadCard from: 1 to: 1.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 11.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test033AGameCanPlayAnAccelerationPermanentCardUsingADeckWithOnlyPermanentCardsThenAllShipsMoveAnExtraSquareWhenTheyMove [

	| aGame amountOfSquares anAmountOfParsecs anAccelerationCard aPlayerNumber |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	anAccelerationCard := AccelerationCard new.
	aPlayerNumber := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: anAccelerationCard.
	
	aGame play: anAccelerationCard from: 1 to: 1.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 16.
	self assert: ((aGame shipPositions) at: 2) equals: 13.
	self assert: ((aGame shipPositions) at: 3) equals: 7.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test034AGameCanPlayManyAccelerationPermanentCardsAndItsEffectStacks [

	| aGame amountOfSquares anAmountOfParsecs anAccelerationCard aPlayerNumber |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	anAccelerationCard := AccelerationCard new.
	aPlayerNumber := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: anAccelerationCard.
	
	aGame play: anAccelerationCard from: 1 to: 1.
	aGame play: anAccelerationCard from: 1 to: 1.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.

	self assert: ((aGame shipPositions) at: 1) equals: 17.
	self assert: ((aGame shipPositions) at: 2) equals: 14.
	self assert: ((aGame shipPositions) at: 3) equals: 8.
]

{ #category : #tests }
GalaxyCircuitGameTest >> test035AGameCannotPlayAPermanentCardIfTheOneUsingItIsNotTheCurrentTurnShip [

	| aGame amountOfSquares anAmountOfParsecs anAccelerationCard aPlayerNumber |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	anAccelerationCard := AccelerationCard new.
	aPlayerNumber := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: anAccelerationCard.
	
	self
		should: [ aGame play: anAccelerationCard from: 2 to: 1. ]
		raise: Error
		withMessage: 'Unable to play permanent card when its not your turn'
]

{ #category : #tests }
GalaxyCircuitGameTest >> test036AGameCannotPlayAPermanentCardIfTheOneTryingToUseItDoesNotHaveTheCardInHand [

	| aGame amountOfSquares anAmountOfParsecs anAccelerationCard aPlayerNumber aSpeedCard |
	
	amountOfSquares := 30.
	anAmountOfParsecs := 30.
	anAccelerationCard := AccelerationCard new.
	aSpeedCard := SpeedCard new.
	aPlayerNumber := 1.
	aGame := self aGameWith: amountOfSquares of: NoEffectSquare new and: anAmountOfParsecs onlyUsing: anAccelerationCard.
	
	self
		should: [ aGame play: aSpeedCard from: 1 to: 1. ]
		raise: Error
		withMessage: 'Unable to play card when the player does not own the card'
]
