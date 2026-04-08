Class {
	#name : #SmockPickingFromRectangleResult,
	#superclass : #SmockPickingFromShapeResult,
	#instVars : [
		'localStartPoint',
		'globalStartPoint',
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

{ #category : #accessing }
SmockPickingFromRectangleResult >> globalStartPoint [

	^ globalStartPoint
]

{ #category : #accessing }
SmockPickingFromRectangleResult >> globalStartPoint: anObject [

	globalStartPoint := anObject
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

{ #category : #accessing }
SmockPickingFromRectangleResult >> localStartPoint [

	^ localStartPoint
]

{ #category : #accessing }
SmockPickingFromRectangleResult >> localStartPoint: anObject [

	localStartPoint := anObject
]
