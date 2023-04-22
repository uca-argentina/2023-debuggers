Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

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
	sequence:= #( 2  ).
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
]

{ #category : #tests }
DieTest >> test004ALoadedDieCanThrowAnExpectedSequenceOfNumbers [

	| aDie sequence |
	sequence:= #( 2 3 4 ).
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4.
	
]

{ #category : #tests }
DieTest >> test005ALoadedDieSequenceCanBeRepeated [

	| aDie sequence |
	sequence := #( 2 3 4 ).
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4
]
