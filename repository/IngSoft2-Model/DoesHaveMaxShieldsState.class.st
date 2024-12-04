Class {
	#name : #DoesHaveMaxShieldsState,
	#superclass : #ShieldsState,
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
DoesHaveMaxShieldsState class >> create [
	^ self new.
]

{ #category : #'as yet unclassified' }
DoesHaveMaxShieldsState >> applyDefendTo: aSpaceship [ 
	aSpaceship updateMaxShields: 1.
	aSpaceship changeShieldStateTo: DoesNotHaveMaxShieldsState create.
]
