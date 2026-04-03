Class {
	#name : #SmockPickingFromRectangleResult,
	#superclass : #SmockPickingFromShapeResult,
	#instVars : [
		'localRectangle',
		'globalRectangle'
	],
	#category : #'OpenSmock-Picking'
}

{ #category : #accessing }
SmockPickingFromRectangleResult >> globalRectangle [

	^ globalRectangle
]

{ #category : #accessing }
SmockPickingFromRectangleResult >> globalRectangle: anObject [

	globalRectangle := anObject
]

{ #category : #testing }
SmockPickingFromRectangleResult >> isRectanglePicking [ 

	^ true
]

{ #category : #accessing }
SmockPickingFromRectangleResult >> localRectangle [

	^ localRectangle
]

{ #category : #accessing }
SmockPickingFromRectangleResult >> localRectangle: anObject [

	localRectangle := anObject
]
