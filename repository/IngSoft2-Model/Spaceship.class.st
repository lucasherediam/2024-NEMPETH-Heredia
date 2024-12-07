Class {
	#name : 'Spaceship',
	#superclass : 'Object',
	#instVars : [
		'lapsCompleted',
		'state',
		'id',
		'cards',
		'physicalAttributes',
		'battleAttributes'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Spaceship class >> createWithId: anId [
	^ self new initializeWith: anId.
]

{ #category : 'comparing' }
Spaceship >> > aSpaceship [

	^ self lapsCompleted > aSpaceship lapsCompleted
		  ifTrue: [ true ]
		  ifFalse: [
			  self lapsCompleted = aSpaceship lapsCompleted
				  ifTrue: [ self position > aSpaceship position ]
				  ifFalse: [ false ] ]
]

{ #category : 'adding' }
Spaceship >> addLap [
	lapsCompleted := lapsCompleted + 1
]

{ #category : 'adding' }
Spaceship >> addMercenary: aSpaceship [
	battleAttributes addMercenary: aSpaceship.
	aSpaceship changeAvailabilityForMercenary.
]

{ #category : 'adding' }
Spaceship >> addSpeed [
	physicalAttributes addSpeed.
]

{ #category : 'as yet unclassified' }
Spaceship >> applyDefend [
	physicalAttributes applyDefendTo: self.
]

{ #category : 'accessing' }
Spaceship >> battleMultiplier [

	^ battleAttributes battleMultiplier
]

{ #category : 'as yet unclassified' }
Spaceship >> cards [
	^ cards
]

{ #category : 'as yet unclassified' }
Spaceship >> changeAvailabilityForMercenary [
	battleAttributes changeAvailabilityForMercenary.
]

{ #category : 'as yet unclassified' }
Spaceship >> changeShieldStateTo: aShieldState [
	physicalAttributes changeShieldStateTo: aShieldState.
]

{ #category : 'as yet unclassified' }
Spaceship >> changeTo: anState [ 
	state := anState.
]

{ #category : 'accessing' }
Spaceship >> id [
	^ id
]

{ #category : 'initialization' }
Spaceship >> initializeWith: anId [

	id := anId.
	physicalAttributes := PhysicalAttributes create.
	battleAttributes := BattleAttributes create.
	lapsCompleted := 0.
	cards := OrderedCollection new.
	state := AvailableState create
]

{ #category : 'testing' }
Spaceship >> isAvaliableForMercenary [
	^ battleAttributes availableForMercenary.
]

{ #category : 'accessing' }
Spaceship >> lapsCompleted [
	^ lapsCompleted
]

{ #category : 'accessing' }
Spaceship >> maxShields [
	^ physicalAttributes maxShields.
]

{ #category : 'accessing' }
Spaceship >> mercenaries [

	^ battleAttributes mercenaries.
]

{ #category : 'accessing' }
Spaceship >> move: positionsToMove [

	physicalAttributes move: positionsToMove.
]

{ #category : 'accessing' }
Spaceship >> movementBySpeed [
	^ physicalAttributes movementBySpeed.
]

{ #category : 'as yet unclassified' }
Spaceship >> obtain: aCard [

	cards add: aCard
]

{ #category : 'as yet unclassified' }
Spaceship >> playTurn [

	^ state playTurn: self.
]

{ #category : 'accessing' }
Spaceship >> position [

	^ physicalAttributes position.
]

{ #category : 'as yet unclassified' }
Spaceship >> reachedMaxShields [
	^ physicalAttributes reachedMaxShields.
]

{ #category : 'as yet unclassified' }
Spaceship >> recoverShields [

	physicalAttributes recoverShields.
]

{ #category : 'removing' }
Spaceship >> removeMercenary: aSpaceship [ 
	battleAttributes removeMercenary: aSpaceship.
]

{ #category : 'as yet unclassified' }
Spaceship >> removeSpeed [
	physicalAttributes removeSpeed.
]

{ #category : 'removing' }
Spaceship >> removeThis: aCard [
	self cards remove: aCard.
]

{ #category : 'as yet unclassified' }
Spaceship >> restoreMultiplier [
	battleAttributes restoreMultiplier.
]

{ #category : 'accessing' }
Spaceship >> shield [
	^ physicalAttributes shield.
]

{ #category : 'accessing' }
Spaceship >> state [
	^ state
]

{ #category : 'as yet unclassified' }
Spaceship >> subtractLap [

	lapsCompleted := lapsCompleted - 1
]

{ #category : 'as yet unclassified' }
Spaceship >> updateBattleMultiplier: aValue [ 
	battleAttributes updateBattleMultiplier: aValue.
]

{ #category : 'as yet unclassified' }
Spaceship >> updateMaxShields: amount [
	physicalAttributes updateMaxShields: amount.
]

{ #category : 'as yet unclassified' }
Spaceship >> updateShield: amount [

	physicalAttributes updateShield: amount
]
