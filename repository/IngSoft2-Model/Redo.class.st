Class {
	#name : 'Redo',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Redo >> applyCardEffect: aCardArguments and: aGame [

	| card lastCardPlayed |
	lastCardPlayed := aGame getLastCardPlayed.
	self lastCardPlayedValidation: lastCardPlayed.

	card := lastCardPlayed createWithId: self id.
	card changeRedoStateTo: CreatedByRedo create.
	card applyCardEffect: aCardArguments and: aGame.

	card discardByCardType: self in: aGame
]

{ #category : 'as yet unclassified' }
Redo >> lastCardPlayedValidation: lastCardPlayed [

	lastCardPlayed ifNil: [
		Error signal:
			'Redo card can not be played if no card was played before' ]
]
