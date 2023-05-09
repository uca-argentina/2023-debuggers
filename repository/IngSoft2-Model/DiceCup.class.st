Class {
	#name : #DiceCup,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
DiceCup class >> with: someDice [ 
	^((self new) initializeWith: someDice). 
]

{ #category : #initialization }
DiceCup >> initializeWith: someDice [

	dice := someDice
]

{ #category : #'dice rolling' }
DiceCup >> useDiceCup [

	^ dice sumNumbers:  [ :aDie | aDie throw ].
]
