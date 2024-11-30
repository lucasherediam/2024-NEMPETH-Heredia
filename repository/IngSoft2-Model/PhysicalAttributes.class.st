Class {
	#name : #PhysicalAttributes,
	#superclass : #Object,
	#instVars : [
		'position',
		'shield',
		'movementBySpeed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
PhysicalAttributes class >> create [
	^ self new initializeWith
]

{ #category : #adding }
PhysicalAttributes >> addSpeed [
	movementBySpeed := movementBySpeed + 1.
]

{ #category : #initialization }
PhysicalAttributes >> initializeWith [

	position := 1.
	shield := 3.
	movementBySpeed := 0
]

{ #category : #accessing }
PhysicalAttributes >> move: positionsToMove [ 
	position := position + positionsToMove
]

{ #category : #accessing }
PhysicalAttributes >> movementBySpeed [
	^ movementBySpeed
]

{ #category : #accessing }
PhysicalAttributes >> position [
	^ position
]

{ #category : #'as yet unclassified' }
PhysicalAttributes >> recoverShields [
	shield := 3
]

{ #category : #removing }
PhysicalAttributes >> removeSpeed [
	movementBySpeed := movementBySpeed - 1.
]

{ #category : #accessing }
PhysicalAttributes >> shield [
	^ shield
]

{ #category : #'as yet unclassified' }
PhysicalAttributes >> updateShield: amount [ 
	shield := shield + amount.
]
