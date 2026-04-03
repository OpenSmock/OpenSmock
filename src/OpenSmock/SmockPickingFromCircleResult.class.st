Class {
	#name : #SmockPickingFromCircleResult,
	#superclass : #SmockPickingFromShapeResult,
	#instVars : [
		'radiusInPixels',
		'localCenter',
		'globalCenter'
	],
	#category : #'OpenSmock-Picking'
}

{ #category : #accessing }
SmockPickingFromCircleResult >> globalCenter [

	^ globalCenter
]

{ #category : #accessing }
SmockPickingFromCircleResult >> globalCenter: anObject [

	globalCenter := anObject
]

{ #category : #testing }
SmockPickingFromCircleResult >> isCirclePicking [

	^ true
]

{ #category : #accessing }
SmockPickingFromCircleResult >> localCenter [

	^ localCenter
]

{ #category : #accessing }
SmockPickingFromCircleResult >> localCenter: anObject [

	localCenter := anObject
]

{ #category : #accessing }
SmockPickingFromCircleResult >> radiusInPixels [

	^ radiusInPixels ifNil:[ radiusInPixels := 0 ]
]

{ #category : #accessing }
SmockPickingFromCircleResult >> radiusInPixels: anObject [

	radiusInPixels := anObject
]
