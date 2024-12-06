Class {
	#name : 'PhysicalAttributes',
	#superclass : 'Object',
	#instVars : [
		'position',
		'shield',
		'movementBySpeed',
		'shieldsState',
		'maxShields'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
PhysicalAttributes class >> create [
	^ self new initializeWith
]

{ #category : 'adding' }
PhysicalAttributes >> addSpeed [
	movementBySpeed := movementBySpeed + 1.
]

{ #category : 'as yet unclassified' }
PhysicalAttributes >> applyDefendTo: aSpaceship [ 
	shieldsState applyDefendTo: aSpaceship.
]

{ #category : 'as yet unclassified' }
PhysicalAttributes >> changeShieldStateTo: aShieldState [ 
	shieldsState := aShieldState.
]

{ #category : 'initialization' }
PhysicalAttributes >> initializeWith [

	position := 1.
	shield := 3.
	maxShields := 3.
	shieldsState := DoesHaveMaxShieldsState create.
	movementBySpeed := 0
]

{ #category : 'accessing' }
PhysicalAttributes >> maxShields [
	^ maxShields.
]

{ #category : 'accessing' }
PhysicalAttributes >> move: positionsToMove [ 
	position := position + positionsToMove
]

{ #category : 'accessing' }
PhysicalAttributes >> movementBySpeed [
	^ movementBySpeed
]

{ #category : 'accessing' }
PhysicalAttributes >> position [
	^ position
]

{ #category : 'as yet unclassified' }
PhysicalAttributes >> reachedMaxShields [
	^ shield = maxShields.
]

{ #category : 'as yet unclassified' }
PhysicalAttributes >> recoverShields [
	shield := maxShields.
]

{ #category : 'removing' }
PhysicalAttributes >> removeSpeed [
	movementBySpeed := movementBySpeed - 1.
]

{ #category : 'accessing' }
PhysicalAttributes >> shield [
	^ shield
]

{ #category : 'as yet unclassified' }
PhysicalAttributes >> updateMaxShields: amount [ 
	maxShields := maxShields + amount.
]

{ #category : 'as yet unclassified' }
PhysicalAttributes >> updateShield: amount [ 
	shield := shield + amount.
]
