Class {
	#name : #SquaresTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SquaresTest >> test001ASquareWithNormalEffectDoesNotChangePosition [

| normal square |
normal := NormalSquare new.
square := Square with: normal.

self assert: square position = 0.
]

{ #category : #tests }
SquaresTest >> test002ASquareWithSpeedUpEffectAdd4Squares [

| speedUp square |
speedUp := SpeedUpSquare new.
square := Square with: speedUp.

self assert: square position = 4.
]

{ #category : #tests }
SquaresTest >> test003ASquareWithAtomicBombEffectAdd4Squares [

| atomicBomb square |
atomicBomb := AtomicBomb new.
square := Square with: atomicBomb.

self assert: square position = 0.
]

{ #category : #tests }
SquaresTest >> test004ASquareWithMoonWalkEffectCanHavePositiveNumberOfSquaresToGoBack [

| moonWalk square |
moonWalk := MoonWalk new.
square := Square with: (moonWalk with: 1).

self assert: square position = -1 .
]
