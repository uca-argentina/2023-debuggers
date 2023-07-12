Class {
	#name : #PlayerCards,
	#superclass : #Object,
	#instVars : [
		'owner',
		'hand',
		'permanents'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PlayerCards class >> from: aPlayerName [

	^ (self new) initializeFrom: aPlayerName
]

{ #category : #adding }
PlayerCards >> addCard: aDraw [

	hand add: aDraw.
]

{ #category : #adding }
PlayerCards >> addToPermanentPile: aPermanentCard [

	permanents add: aPermanentCard.
]

{ #category : #comparing }
PlayerCards >> equals: anotherPlayerCards [

	^ (owner = (anotherPlayerCards owner)).
]

{ #category : #checking }
PlayerCards >> hasInHand: aCard [

	^ hand anySatisfy: [ :aHandCard | aHandCard equals: aCard ].
]

{ #category : #initialization }
PlayerCards >> initializeFrom: aPlayerName [

	owner := aPlayerName.
	hand := OrderedCollection new. 
	permanents := OrderedCollection new.
]

{ #category : #accessing }
PlayerCards >> owner [

	^ owner.
]

{ #category : #accessing }
PlayerCards >> permanents [

	^ permanents.
]

{ #category : #removing }
PlayerCards >> removeFromHand: aCard [

	| cardToRemove |
	
	cardToRemove := hand detect: [ :aHandCard | aHandCard equals: aCard ].
	hand remove: cardToRemove.
]

{ #category : #removing }
PlayerCards >> removePermanent: aPermanentCardToCancel [

	| aCardToRemove |
	
	aCardToRemove := permanents detect: [ :aCard | aCard equals: aPermanentCardToCancel ].
	permanents remove: aCardToRemove.
]

{ #category : #using }
PlayerCards >> usePermanents [

	^ permanents sumNumbers: [ :aPermanentCard | aPermanentCard effect ]
]
