Class {
	#name : #SmockPickingFromPointResult,
	#superclass : #SmockPickingResult,
	#instVars : [
		'localPoint',
		'globalPoint',
		'distanceInPixels'
	],
	#category : #'OpenSmock-Picking'
}

{ #category : #accessing }
SmockPickingFromPointResult >> distanceInPixels [

	^ distanceInPixels ifNil:[ distanceInPixels := 0 ]
]

{ #category : #accessing }
SmockPickingFromPointResult >> distanceInPixels: anObject [

	distanceInPixels := anObject
]

{ #category : #accessing }
SmockPickingFromPointResult >> globalPoint [

	^ globalPoint
]

{ #category : #accessing }
SmockPickingFromPointResult >> globalPoint: anObject [

	globalPoint := anObject
]

{ #category : #testing }
SmockPickingFromPointResult >> isPointPicking [

	^ true
]

{ #category : #accessing }
SmockPickingFromPointResult >> localPoint [

	^ localPoint
]

{ #category : #accessing }
SmockPickingFromPointResult >> localPoint: anObject [

	localPoint := anObject
]

{ #category : #accessing }
SmockPickingFromPointResult >> radiusInPixels [

	self
		deprecated: 'Use distanceInPixels'
		transformWith: '`@receiver radiusInPixels'
			-> '`@receiver distanceInPixels'.
	
	^ self distanceInPixels
]

{ #category : #accessing }
SmockPickingFromPointResult >> radiusInPixels: anObject [
	
	self
		deprecated: 'Use distanceInPixels:'
		transformWith: '`@receiver radiusInPixels: `@anObject'
			-> '`@receiver distanceInPixels: `@anObject'.

	self distanceInPixels: anObject 
]
