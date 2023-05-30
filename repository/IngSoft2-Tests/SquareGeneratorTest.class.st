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

	| randomSquareGenerator anAmountOfSquares |
	
	anAmountOfSquares := 100.
	randomSquareGenerator := SquareGenerator with: 100.
	
	self assert: ((randomSquareGenerator generateNumber) between: 1 and: 100). 
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test002ASquareGeneratorCanGenerateSquaresBasedOnAGivenAmountOfSquares [

	| randomSquareGenerator anAmountOfSquares |
	
	anAmountOfSquares := 100.
	randomSquareGenerator := SquareGenerator with: 100.
	
	self assert: (((randomSquareGenerator generateSquares) size) = 100). 
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test003ASquareGeneratorCannotGenerateZeroOrLowerAmountOfSquares [
	
	self
		should: [ SquareGenerator with: -5 ]
		raise: Error
		withMessage: 'Amount of squares cannot be 0 or lower'
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test005ASquareGeneratorCanFollowADistributionGiven [

	| randomSquareGenerator anAmountOfSquares randomSquares found squaresToUse distribution |
	anAmountOfSquares := 100.
	squaresToUse := OrderedCollection new.
	squaresToUse add: AtomicBombSquare new.
	squaresToUse add: (HyperJumpSquare with: #( 4 1 ) asOrderedCollection).
	squaresToUse add: (MoonwalkSquare with: 3).
	squaresToUse add: SpeedUpSquare new.
	squaresToUse add: WormholeSquare new.
	squaresToUse add: NoEffectSquare new.
	distribution := #( 2 8 10 20 20 40 ) asOrderedCollection.
	randomSquareGenerator := SquareGenerator
		                         with: 100
		                         of: squaresToUse
		                         using: distribution.
	randomSquares := randomSquareGenerator generateSquaresNew.
	found := OrderedCollection new.
	1000 timesRepeat: [ 
		randomSquares := randomSquareGenerator generateSquaresNew.
		found add:
			(randomSquares select: [ :aSquare | 
				 aSquare type = 'Hyper Jump Effect' ]) ].
	self assert: (((found size) / 1000) between: 1 and: 8).
]
