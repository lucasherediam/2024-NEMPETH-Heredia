Class {
	#name : #Defend,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Defend >> applyCardEffect: aCardArguments and: aGame [ 
	
	| idOfAffectedSpaceship |
	
	idOfAffectedSpaceship := aCardArguments at: 'idTargetSpaceship'.
	
	aGame applyDefendWith: idOfAffectedSpaceship.
]
