Class {
	#name : #SmockPickingFromCircleResultTest,
	#superclass : #SmockPickingFromShapeResultTest,
	#category : #'OpenSmock-Tests-Picking'
}

{ #category : #testing }
SmockPickingFromCircleResultTest class >> shouldInheritSelectors [

	^ true
]

{ #category : #running }
SmockPickingFromCircleResultTest >> pickingResultClass [

	^ SmockPickingFromCircleResult
]

{ #category : #tests }
SmockPickingFromCircleResultTest >> testIsCirclePicking [

	self assert: result isCirclePicking 
]

{ #category : #tests }
SmockPickingFromCircleResultTest >> testRadiusInPixels [

	self assert: result radiusInPixels equals: 0.

	result radiusInPixels: 10.
	self assert: result radiusInPixels equals: 10.

	result radiusInPixels: nil.
	self assert: result radiusInPixels equals: 0
]
