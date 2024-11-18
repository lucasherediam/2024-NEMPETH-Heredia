Class {
	#name : #Double,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Double >> applyCardEffect: aCardArguments and: aGame [ 
	 
	| idOfAffectedSpaceship |
	
	idOfAffectedSpaceship := aCardArguments at: 'idTargetSpaceship'.
	
	aGame applyDoubleWith: idOfAffectedSpaceship.
]
