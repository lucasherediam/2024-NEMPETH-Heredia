Class {
	#name : #BattleAttributes,
	#superclass : #Object,
	#instVars : [
		'battleMultiplier',
		'avaliableForMercenary',
		'mercenaries'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
BattleAttributes class >> create [
	^ self new initializeWith.
]

{ #category : #adding }
BattleAttributes >> addMercenary: aSpaceship [ 
	mercenaries add: aSpaceship.
]

{ #category : #'as yet unclassified' }
BattleAttributes >> availableForMercenary [
	^ avaliableForMercenary.
]

{ #category : #accessing }
BattleAttributes >> battleMultiplier [
	^ battleMultiplier
]

{ #category : #'as yet unclassified' }
BattleAttributes >> changeAvailabilityForMercenary [
	
	avaliableForMercenary := avaliableForMercenary not. 
]

{ #category : #initialization }
BattleAttributes >> initializeWith [
	battleMultiplier := 1.
	avaliableForMercenary := true.
	mercenaries := OrderedCollection new.

]

{ #category : #accessing }
BattleAttributes >> mercenaries [
	^ mercenaries
]

{ #category : #removing }
BattleAttributes >> removeMercenary: aSpaceship [ 
	
	mercenaries remove: aSpaceship.
]

{ #category : #'as yet unclassified' }
BattleAttributes >> updateBattleMultiplier: aValue [ 
	
	battleMultiplier := aValue.
]
