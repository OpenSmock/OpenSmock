Class {
	#name : #SmockPickingFromRectangleResultTest,
	#superclass : #SmockPickingFromShapeResultTest,
	#category : #'OpenSmock-Tests-Picking'
}

{ #category : #testing }
SmockPickingFromRectangleResultTest class >> shouldInheritSelectors [

	^ true
]

{ #category : #running }
SmockPickingFromRectangleResultTest >> pickingResultClass [

	^ SmockPickingFromRectangleResult
]

{ #category : #tests }
SmockPickingFromRectangleResultTest >> testIsRectanglePicking [

	self assert: result isRectanglePicking 
]
