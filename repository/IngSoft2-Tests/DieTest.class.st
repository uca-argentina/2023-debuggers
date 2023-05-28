Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
DieTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
DieTest >> test001ARandomDieCanTellMeItsFaces [

| aDie |
aDie:= Die with:3.

self assert: aDie faces equals: 3.

]

{ #category : #tests }
DieTest >> test002ARandomDieCanThrowARandomNumber [

| aDie |
aDie:= Die with:3.

self assert: ((aDie throw) between: 1 and: 3).

]

{ #category : #tests }
DieTest >> test003ALoadedDieCanThrowAnExpectedNumber [

	| aDie sequence |
	
	sequence:= #( 2 ) asOrderedCollection.
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
]

{ #category : #tests }
DieTest >> test004ALoadedDieCanThrowAnExpectedSequenceOfNumbers [

	| aDie sequence |

	sequence:= #( 2 3 4 ) asOrderedCollection.
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4.
	
]

{ #category : #tests }
DieTest >> test005ALoadedDieSequenceCanBeRepeated [

	| aDie sequence |
	sequence := #( 2 3 4 ) asOrderedCollection.
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4
]

{ #category : #tests }
DieTest >> test006ARandomDieCanCannotHaveZeroFaces [

	| aDie |
	
	self
		should: [ aDie := Die with: 0 ]
		raise: Error
		withMessage: 'Unable to create dice with 0 or less faces'
]

{ #category : #tests }
DieTest >> test007ARandomDieCanCannotHaveNegativeAmountOfFaces [

	| aDie |
	
	self
		should: [ aDie := Die with: -3 ]
		raise: Error
		withMessage: 'Unable to create dice with 0 or less faces'
]

{ #category : #tests }
DieTest >> test008ALoadedDieCanCannotHaveZeroFaces [

	| aDie sequence |
	
	sequence := #( 0 ).

	self
		should: [ aDie := LoadedDie with: sequence ]
		raise: Error
		withMessage: 'Unable to create dice with 0 or less faces'
]

{ #category : #tests }
DieTest >> test009ALoadedDieCanCannotHaveANegativeAmountOfFaces [

	| aDie sequence |
	
	sequence := #( -5 ).

	self
		should: [ aDie := LoadedDie with: sequence ]
		raise: Error
		withMessage: 'Unable to create dice with 0 or less faces'
]

{ #category : #tests }
DieTest >> test010ALoadedDieCanTellMeItsFaces [

	| aDie sequence |
	
	sequence := #( 7 8 4 ) asOrderedCollection.
	aDie := LoadedDie with: sequence.

	self assert: aDie faces equals: 8
]
