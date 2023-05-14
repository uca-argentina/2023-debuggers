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
