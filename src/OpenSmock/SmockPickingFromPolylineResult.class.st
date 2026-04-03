Class {
	#name : #SmockPickingFromPolylineResult,
	#superclass : #SmockPickingFromShapeResult,
	#instVars : [
		'localPoints',
		'globalPoints'
	],
	#category : #'OpenSmock-Picking'
}

{ #category : #accessing }
SmockPickingFromPolylineResult >> globalPoints [

	^ globalPoints
]

{ #category : #accessing }
SmockPickingFromPolylineResult >> globalPoints: anObject [

	globalPoints := anObject
]

{ #category : #testing }
SmockPickingFromPolylineResult >> isPolylinePicking [ 

	^ true
]

{ #category : #accessing }
SmockPickingFromPolylineResult >> localPoints [

	^ localPoints
]

{ #category : #accessing }
SmockPickingFromPolylineResult >> localPoints: anObject [

	localPoints := anObject
]
