Class {
	#name : #SmockPickingFromPointResultTest,
	#superclass : #SmockPickingResultTest,
	#category : #'OpenSmock-Tests-Picking'
}

{ #category : #testing }
SmockPickingFromPointResultTest class >> shouldInheritSelectors [

	^ true
]

{ #category : #running }
SmockPickingFromPointResultTest >> pickingResultClass [

	^ SmockPickingFromPointResult
]

{ #category : #tests }
SmockPickingFromPointResultTest >> testDistanceInPixels [

	self assert: result distanceInPixels equals: 0.

	result distanceInPixels: 10.
	self assert: result distanceInPixels equals: 10.
	
	result distanceInPixels: nil.
	self assert: result distanceInPixels equals: 0
]

{ #category : #tests }
SmockPickingFromPointResultTest >> testGlobalPoint [

	self assert: result globalPoint isNil.

	result globalPoint: 10 asPoint.
	self assert: result globalPoint equals: 10 asPoint
]

{ #category : #tests }
SmockPickingFromPointResultTest >> testLocalPoint [

	self assert: result localPoint isNil.

	result localPoint: 5 asPoint.
	self assert: result localPoint equals: 5 asPoint
]
