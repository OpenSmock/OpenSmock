Class {
	#name : #SmockPickingFromShapeResult,
	#superclass : #SmockPickingResult,
	#instVars : [
		'isInclusive'
	],
	#category : #'OpenSmock-Picking'
}

{ #category : #testing }
SmockPickingFromShapeResult class >> isAbstract [ 

	^ self == SmockPickingFromShapeResult 
]

{ #category : #testing }
SmockPickingFromShapeResult >> isCirclePicking [

	^ false
]

{ #category : #accessing }
SmockPickingFromShapeResult >> isInclusive [

	^ isInclusive ifNil:[ isInclusive := true ] 
]

{ #category : #accessing }
SmockPickingFromShapeResult >> isInclusive: anObject [

	isInclusive := anObject
]

{ #category : #testing }
SmockPickingFromShapeResult >> isPolygonPicking [ 

	^ false
]

{ #category : #testing }
SmockPickingFromShapeResult >> isPolylinePicking [ 

	^ false
]

{ #category : #testing }
SmockPickingFromShapeResult >> isRectanglePicking [

	^ false
]

{ #category : #testing }
SmockPickingFromShapeResult >> isShapePicking [

	^ true
]
