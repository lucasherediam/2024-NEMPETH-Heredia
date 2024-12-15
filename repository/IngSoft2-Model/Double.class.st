Class {
	#name : 'Double',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Double >> applyCardEffect: aCardArguments and: aGame [ 
	 
	| idOfTargetSpaceship |
	
	idOfTargetSpaceship := aCardArguments at: 'idTargetSpaceship'.
	
	aGame applyDoubleTo: idOfTargetSpaceship.
]
