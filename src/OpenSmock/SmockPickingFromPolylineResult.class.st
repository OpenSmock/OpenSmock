Class {
	#name : #SmockPickingFromPolylineResult,
	#superclass : #SmockPickingFromShapeResult,
	#instVars : [
		'localStartPoint',
		'globalStartPoint',
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

{ #category : #accessing }
SmockPickingFromPolylineResult >> globalStartPoint [

	^ globalStartPoint
]

{ #category : #accessing }
SmockPickingFromPolylineResult >> globalStartPoint: anObject [

	globalStartPoint := anObject
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

{ #category : #accessing }
SmockPickingFromPolylineResult >> localStartPoint [

	^ localStartPoint
]

{ #category : #accessing }
SmockPickingFromPolylineResult >> localStartPoint: anObject [

	localStartPoint := anObject
]
