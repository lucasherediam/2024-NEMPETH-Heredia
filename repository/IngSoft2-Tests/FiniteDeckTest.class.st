Class {
	#name : 'FiniteDeckTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
FiniteDeckTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
FiniteDeckTest >> test001WhenTheFiniteDeckIsAskedForACardThenGivesACard [

	| aCardsGenerator cards aDeck cardOne cardTwo |
	aCardsGenerator := CardsGenerator createWith: 10.
	cards := aCardsGenerator cards.
 	aDeck := FiniteDeck createWith: cards.
	
	cardOne := aDeck giveACard.
	cardTwo := aDeck giveACard.
	
	self assert: (cardOne isKindOf: Card).
	self assert: cardOne id equals: 1.
	self assert: (cardTwo isKindOf: Card).
	self assert: cardTwo id equals: 2.
	
	self assert: (aDeck cards) size equals: 8. 
]

{ #category : 'tests' }
FiniteDeckTest >> test002WhenAnSpaceshipPlaysAnInstantCardThenTheCardGoesToDiscardDeck [

	| aDie dices cards aDeck aNormalBoxOne aNormalBoxTwo aPath aBoard aGame cardArguments |
	aDie := Die of: 10.
	dices := OrderedCollection with: aDie.

	cards := OrderedCollection new.
	cards add: (Double createWithId: 1).
	cards add: (Defend createWithId: 2).
	cards add: (Defend createWithId: 3).
	cards add: (Double createWithId: 4).
	cards add: (Defend createWithId: 5).
	cards add: (Double createWithId: 6).
	cards add: (Defend createWithId: 7).
	cards add: (Double createWithId: 8).
	cards add: (Defend createWithId: 9).
	cards add: (Double createWithId: 10).
	
	
	aDeck := FiniteDeck createWith: cards.

	aNormalBoxOne := NormalBox new.
	aNormalBoxTwo := NormalBox new.
	aPath := OrderedCollection with: aNormalBoxOne with: aNormalBoxTwo.
	aBoard := Board createWith: aPath.
	
	aGame := Game
		         createWithNumberOfSpaceships: 2
		         and: dices
		         and: aDeck
		         and: aBoard
		         andLapsToWin: 1.
		
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 2).
		
	self assert: (aDeck cards) size equals: 6. 
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 1.
	cardArguments at: 'idTargetSpaceship' put: 2.

	aGame playCard: cardArguments.
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 2.
	cardArguments at: 'idTargetSpaceship' put: 1.
	
	aGame playCard: cardArguments.
	
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 0 with: 2).	
			
	self assert:  (aDeck discardDeck) size equals: 2
]

{ #category : 'tests' }
FiniteDeckTest >> test003WhenTheFiniteDeckIsEmptyThenReturnsFalseWhenIsAskedForACard [

	| aCardsGenerator cards aDeck cardOne cardTwo |
	aCardsGenerator := CardsGenerator createWith: 10.
	
	cards := OrderedCollection new.
	cards add: (Speed createWithId: 1).
	
 	aDeck := FiniteDeck createWith: cards.
	
	cardOne := aDeck giveACard.
	cardTwo := aDeck giveACard.
	
	self assert: (cardOne isKindOf: Speed).
	self assert: cardOne id equals: 1.
	self assert: cardTwo equals: nil.
	
]

{ #category : 'tests' }
FiniteDeckTest >> test004WhenTheFiniteDeckDoesNotHaveMoreCardsThenShufflesTheDiscardDeckAndUsesThatDeck [

	| aDie dices cards aDeck aCardBoxOne aCardBoxTwo aPath aBoard aGame cardArguments |
	aDie := LoadedDie of: 10.
	aDie add: (OrderedCollection
			 with: 1
			 with: 2
			 with: 1
			 with: 2
			 with: 3).
	dices := OrderedCollection with: aDie.

	cards := OrderedCollection new.
	cards add: (Double createWithId: 1).
	cards add: (Cancellation  createWithId: 2).
	cards add: (Speed createWithId: 3).
	cards add: (Defend createWithId: 4).
	
	aDeck := FiniteDeck createWith: cards.

	aCardBoxOne := CardBox createWith: aDeck.
	aCardBoxTwo := CardBox createWith: aDeck.
	aPath := OrderedCollection with: aCardBoxOne with: aCardBoxTwo.
	aBoard := Board createWith: aPath.
	
	aGame := Game
		         createWithNumberOfSpaceships: 2
		         and: dices
		         and: aDeck
		         and: aBoard
		         andLapsToWin: 1.
		
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 2).
		
	self assert: (aDeck cards) isEmpty. 
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 1.
	cardArguments at: 'idTargetSpaceship' put: 2.

	aGame playCard: cardArguments.
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 2.
	cardArguments at: 'idCardToUse' put: 4.
	cardArguments at: 'idTargetSpaceship' put: 2.
	
	aGame playCard: cardArguments.
	
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 1 with: 1).	
			
	self assert:  (aDeck discardDeck) size equals: 2.
	
	aGame playTurn.
	
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 1).
]

{ #category : 'tests' }
FiniteDeckTest >> test005WhenTheFiniteDeckDoesNotHaveMoreCardsAndTheDiscardDeckNeitherThenTheCardBoxDoesNotGiveACard [
	| aDie dices cards aDeck aCardBoxOne aCardBoxTwo aPath aBoard aGame |
	aDie := LoadedDie of: 10.
	aDie add: (OrderedCollection
			 with: 1
			 with: 2
			 with: 1
			 with: 2
			 with: 3).
	dices := OrderedCollection with: aDie.

	cards := OrderedCollection new.
	cards add: (Double createWithId: 1).
	cards add: (Cancellation  createWithId: 2).
	cards add: (Speed createWithId: 3).
	cards add: (Defend createWithId: 4).
	
	aDeck := FiniteDeck createWith: cards.

	aCardBoxOne := CardBox createWith: aDeck.
	aCardBoxTwo := CardBox createWith: aDeck.
	aPath := OrderedCollection with: aCardBoxOne with: aCardBoxTwo.
	aBoard := Board createWith: aPath.
	
	aGame := Game
		         createWithNumberOfSpaceships: 2
		         and: dices
		         and: aDeck
		         and: aBoard
		         andLapsToWin: 1.
		
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 2).
		
	self assert: (aDeck cards) isEmpty. 
		
	self assert:  (aDeck discardDeck) isEmpty.
	
	aGame playTurn.
	
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 2).
]

{ #category : 'tests' }
FiniteDeckTest >> test006WhenAFiniteDeckIsCreatedWithNoCardsThenThrowError [

	| cards |
	cards := OrderedCollection new.
	self
		should: [ FiniteDeck createWith: cards ]
		raise: Error
		withMessage: 'The deck should be created with at least one card'
]

{ #category : 'tests' }
FiniteDeckTest >> test007WhenAnSpaceshipPlaysAPermanentCardThenTheCardDoesNotGoToDiscardDeckWhenIsPlayed [

	| aDie dices cards aDeck aNormalBoxOne aNormalBoxTwo aPath aBoard aGame cardArguments |
	aDie := Die of: 10.
	dices := OrderedCollection with: aDie.

	cards := OrderedCollection new.
	cards add: (Speed createWithId: 1).
	cards add: (Speed createWithId: 2).
	cards add: (Speed createWithId: 3).
	cards add: (Speed createWithId: 4).
	cards add: (Speed createWithId: 5).
	cards add: (Speed createWithId: 6).
	cards add: (Speed createWithId: 7).
	cards add: (Speed createWithId: 8).
	cards add: (Speed createWithId: 9).
	cards add: (Speed createWithId: 10).


	aDeck := FiniteDeck createWith: cards.

	aNormalBoxOne := NormalBox new.
	aNormalBoxTwo := NormalBox new.
	aPath := OrderedCollection with: aNormalBoxOne with: aNormalBoxTwo.
	aBoard := Board createWith: aPath.

	aGame := Game
		         createWithNumberOfSpaceships: 2
		         and: dices
		         and: aDeck
		         and: aBoard
		         andLapsToWin: 1.

	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 2).

	self assert: aDeck cards size equals: 6.

	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 1.
	cardArguments at: 'idTargetSpaceship' put: 2.

	aGame playCard: cardArguments.

	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 2.
	cardArguments at: 'idTargetSpaceship' put: 1.

	aGame playCard: cardArguments.

	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 0 with: 2).

	self assert: aDeck discardDeck size equals: 0
]

{ #category : 'tests' }
FiniteDeckTest >> test008WhenACancellationIsPlayedThenTheCancellationCardAndThePermanentCardAffectedGoToTheDiscardDeck [

	| aDie dices cards aDeck aNormalBoxOne aNormalBoxTwo aPath aBoard aGame cardArguments |
	aDie := Die of: 10.
	dices := OrderedCollection with: aDie.

	cards := OrderedCollection new.
	cards add: (Speed createWithId: 1).
	cards add: (Cancellation createWithId: 2).
	cards add: (Speed createWithId: 3).
	cards add: (Cancellation createWithId: 4).
	cards add: (Speed createWithId: 5).
	cards add: (Cancellation createWithId: 6).
	cards add: (Speed createWithId: 7).
	cards add: (Cancellation createWithId: 8).
	cards add: (Speed createWithId: 9).
	cards add: (Cancellation createWithId: 10).


	aDeck := FiniteDeck createWith: cards.

	aNormalBoxOne := NormalBox new.
	aNormalBoxTwo := NormalBox new.
	aPath := OrderedCollection with: aNormalBoxOne with: aNormalBoxTwo.
	aBoard := Board createWith: aPath.

	aGame := Game
		         createWithNumberOfSpaceships: 2
		         and: dices
		         and: aDeck
		         and: aBoard
		         andLapsToWin: 1.

	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 2).

	self assert: aDeck cards size equals: 6.

	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 1.
	cardArguments at: 'idTargetSpaceship' put: 2.

	aGame playCard: cardArguments.

	self assert: aDeck discardDeck size equals: 0.
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 2.
	cardArguments at: 'idTargetCard' put: 1.

	aGame playCard: cardArguments.

	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 0 with: 2).

	self assert: aDeck discardDeck size equals: 2
]

{ #category : 'tests' }
FiniteDeckTest >> test009WhenARedoCardIsPlayedAfterAnInstantCardThenTheRedoCardGoesToDiscardDeck [

	| aDie dices cards aDeck aNormalBoxOne aNormalBoxTwo aPath aBoard aGame cardArguments |
	aDie := Die of: 10.
	dices := OrderedCollection with: aDie.

	cards := OrderedCollection new.
	cards add: (Defend createWithId: 1).
	cards add: (Redo createWithId: 2).
	cards add: (Defend createWithId: 3).
	cards add: (Redo createWithId: 4).
	cards add: (Defend createWithId: 5).
	cards add: (Redo createWithId: 6).
	cards add: (Defend createWithId: 7).
	cards add: (Redo createWithId: 8).
	cards add: (Defend createWithId: 9).
	cards add: (Redo createWithId: 10).
	
	
	aDeck := FiniteDeck createWith: cards.

	aNormalBoxOne := NormalBox new.
	aNormalBoxTwo := NormalBox new.
	aPath := OrderedCollection with: aNormalBoxOne with: aNormalBoxTwo.
	aBoard := Board createWith: aPath.
	
	aGame := Game
		         createWithNumberOfSpaceships: 2
		         and: dices
		         and: aDeck
		         and: aBoard
		         andLapsToWin: 1.
		
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 2).
		
	self assert: (aDeck cards) size equals: 6. 
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 1.
	cardArguments at: 'idTargetSpaceship' put: 2.

	aGame playCard: cardArguments.
	
	self assert:  (aDeck discardDeck) size equals: 1.
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 2.
	cardArguments at: 'idTargetSpaceship' put: 1.
	
	aGame playCard: cardArguments.
	
	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 0 with: 2).	
			
	self assert:  (aDeck discardDeck) size equals: 2.
	
	self assert: (aDeck discardDeck second isKindOf: Redo).
]

{ #category : 'tests' }
FiniteDeckTest >> test010WhenARedoCardIsPlayedAfterAPermenentCardThenTheRedoCardShouldBeDiscardedWhenCancellationIsPlayed [

	| aDie dices cards aDeck aNormalBoxOne aNormalBoxTwo aPath aBoard aGame cardArguments |
	aDie := Die of: 10.
	dices := OrderedCollection with: aDie.

	cards := OrderedCollection new.
	cards add: (Speed createWithId: 1).
	cards add: (Redo createWithId: 2).
	cards add: (Speed createWithId: 3).
	cards add: (Cancellation createWithId: 4).
	cards add: (Speed createWithId: 5).
	cards add: (Cancellation createWithId: 6).
	cards add: (Speed createWithId: 7).
	cards add: (Cancellation createWithId: 8).
	cards add: (Speed createWithId: 9).
	cards add: (Cancellation createWithId: 10).


	aDeck := FiniteDeck createWith: cards.

	aNormalBoxOne := NormalBox new.
	aNormalBoxTwo := NormalBox new.
	aPath := OrderedCollection with: aNormalBoxOne with: aNormalBoxTwo.
	aBoard := Board createWith: aPath.

	aGame := Game
		         createWithNumberOfSpaceships: 2
		         and: dices
		         and: aDeck
		         and: aBoard
		         andLapsToWin: 1.

	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 2 with: 2).

	self assert: aDeck cards size equals: 6.

	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 1.
	cardArguments at: 'idTargetSpaceship' put: 2.

	aGame playCard: cardArguments.

	self assert: aDeck discardDeck size equals: 0.
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 1.
	cardArguments at: 'idCardToUse' put: 2.
	cardArguments at: 'idTargetSpaceship' put: 1.

	aGame playCard: cardArguments.
	
	cardArguments := Dictionary new.
	cardArguments at: 'idSpaceship' put: 2.
	cardArguments at: 'idCardToUse' put: 4.
	cardArguments at: 'idTargetCard' put: 2.

	aGame playCard: cardArguments.

	self
		assert: aGame checkAmountOfCardsOfSpaceships
		equals: (OrderedCollection with: 0 with: 1).

	self assert: aDeck discardDeck size equals: 2.
	
	self assert: (aDeck discardDeck first isKindOf: Redo).
]
