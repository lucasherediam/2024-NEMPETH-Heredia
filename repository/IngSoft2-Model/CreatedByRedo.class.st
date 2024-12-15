Class {
	#name : 'CreatedByRedo',
	#superclass : 'RedoState',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CreatedByRedo >> discard: aCard in: aGame [

	aGame addToDiscardDeck: (Redo createWithId: aCard id)
]
