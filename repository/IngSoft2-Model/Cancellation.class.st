Class {
	#name : 'Cancellation',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cancellation >> applyCardEffect: aCardArguments and: aGame [

	| idTargetCard cardAffected |
	idTargetCard := aCardArguments at: 'idTargetCard'.
	cardAffected := aGame getPermanentCardPlayed detect: [ :aCard |
		                aCard id = idTargetCard ].

	cardAffected removeCardEffect: aCardArguments and: aGame.

	cardAffected isCreatedByRedo
		ifTrue: [
		aGame addToDiscardDeck: (Redo createWithId: cardAffected id) ]
		ifFalse: [ aGame addToDiscardDeck: cardAffected ]
]
