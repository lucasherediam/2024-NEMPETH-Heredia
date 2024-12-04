Class {
	#name : #DoesNotHaveMaxShieldsState,
	#superclass : #ShieldsState,
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
DoesNotHaveMaxShieldsState class >> create [
	^ self new.
]

{ #category : #'as yet unclassified' }
DoesNotHaveMaxShieldsState >> applyDefendTo: aSpaceship [ 
	aSpaceship updateShield: 1.
	aSpaceship reachedMaxShields ifTrue: [ 
		aSpaceship changeShieldStateTo: DoesHaveMaxShieldsState create. ]
]
