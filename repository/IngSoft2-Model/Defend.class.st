Class {
	#name : #Defend,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Defend >> applyCardEffect: aCardArguments and: aGame [ 
	
	| idOfTargetSpaceship |
	
	idOfTargetSpaceship := aCardArguments at: 'idTargetSpaceship'.
	
	aGame applyDefendTo: idOfTargetSpaceship.
]
