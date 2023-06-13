Class {
	#name : #SquareGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
SquareGeneratorTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
SquareGeneratorTest >> test001ASquareGeneratorCanGenerateANumberBetween1And100 [

	| randomSquareGenerator anAmountOfSquares squaresToUse distribution values aValue1 |
	anAmountOfSquares := 100.
	values := OrderedCollection new.
	aValue1 := Parsec with: 4.
	values add: aValue1.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: values).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	distribution := #( 2 8 10 20 20 40 ) asOrderedCollection.
	randomSquareGenerator := SquareGenerator
		                         with: anAmountOfSquares 
		                         of: squaresToUse
		                         using: distribution.
	
	self assert: ((randomSquareGenerator generateNumber) between: 1 and: 100). 
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test002ASquareGeneratorCanGenerateSquaresBasedOnAGivenAmountOfSquares [

	| randomSquareGenerator anAmountOfSquares squaresToUse distribution values aValue1 |
	anAmountOfSquares := 100.
	values := OrderedCollection new.
	aValue1 := Parsec with: 4.
	values add: aValue1.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: values).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	distribution := #( 2 8 10 20 20 40 ) asOrderedCollection.
	randomSquareGenerator := SquareGenerator
		                         with: anAmountOfSquares 
		                         of: squaresToUse
		                         using: distribution.
	
	self assert: ((randomSquareGenerator generateSquares) size) equals: 100. 
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test003ASquareGeneratorCannotGenerateZeroOrLowerAmountOfSquares [
	
	| randomSquareGenerator anAmountOfSquares squaresToUse distribution values aValue1 |
	anAmountOfSquares := -5.
	values := OrderedCollection new.
	aValue1 := Parsec with: 4.
	values add: aValue1.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: values).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	distribution := #( 2 8 10 20 20 40 ) asOrderedCollection.
	
	self
		should: [ randomSquareGenerator := SquareGenerator
		                         with: anAmountOfSquares 
		                         of: squaresToUse
		                         using: distribution. ]
		raise: Error
		withMessage: 'Amount of squares cannot be 0 or lower'
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test004ASquareGeneratorCannotGenerateWithInvalidDistribution [
	
	| randomSquareGenerator anAmountOfSquares squaresToUse distribution values aValue1 |
	anAmountOfSquares := 100.
	values := OrderedCollection new.
	aValue1 := Parsec with: 4.
	values add: aValue1.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: values).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	distribution := #( 2 8 10 20 20 91 ) asOrderedCollection.
	
	self
		should: [ randomSquareGenerator := SquareGenerator
		                         with: anAmountOfSquares 
		                         of: squaresToUse
		                         using: distribution. ]
		raise: Error
		withMessage: 'Distribution must add up 100%'
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test005ASquareGeneratorCannotGenerateWithoutAnyTypeOfSquare [
	
	| randomSquareGenerator anAmountOfSquares squaresToUse distribution |
	anAmountOfSquares := 100.
	squaresToUse := OrderedCollection new.
	distribution := #( 2 8 10 20 20 40 ) asOrderedCollection.
	
	self
		should: [ randomSquareGenerator := SquareGenerator
		                         with: anAmountOfSquares 
		                         of: squaresToUse
		                         using: distribution. ]
		raise: Error
		withMessage: 'Cannot generate wihtout any type of square'
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test006ASquareGeneratorCanFollowADistributionGiven [

	| randomSquareGenerator anAmountOfSquares randomSquares found squaresToUse distribution values aValue1 |
	anAmountOfSquares := 100.
	values := OrderedCollection new.
	aValue1 := Parsec with: 4.
	values add: aValue1.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: values).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	distribution := #( 2 8 10 20 20 40 ) asOrderedCollection.
	randomSquareGenerator := SquareGenerator
		                         with: 100
		                         of: squaresToUse
		                         using: distribution.
	randomSquares := randomSquareGenerator generateSquares.
	found := OrderedCollection new.
	1000 timesRepeat: [ 
		randomSquares := randomSquareGenerator generateSquares.
		found addAll:
			(randomSquares select: [ :aSquare | 
				 aSquare isKindOf: HyperJumpSquare ]) ].
	self assert: (((found size) / 1000) between: 7 and: 9).
]

{ #category : #tests }
SquareGeneratorTest >> test007ASquareGeneratorCanFollowADifferentDistributionGiven [

	| randomSquareGenerator anAmountOfSquares randomSquares found squaresToUse distribution values aValue1 |
	anAmountOfSquares := 100.
	values := OrderedCollection new.
	aValue1 := Parsec with: 4.
	values add: aValue1.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: values).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	squaresToUse add: CardSquare new.
	distribution := #( 2 8 10 20 20 30 10 ) asOrderedCollection.
	randomSquareGenerator := SquareGenerator
		                         with: 100
		                         of: squaresToUse
		                         using: distribution.
	randomSquares := randomSquareGenerator generateSquares.
	found := OrderedCollection new.
	1000 timesRepeat: [ 
		randomSquares := randomSquareGenerator generateSquares.
		found addAll:
			(randomSquares select: [ :aSquare | 
				 aSquare isKindOf: HyperJumpSquare ]) ].
	self assert: (((found size) / 1000) between: 7 and: 9).
]
