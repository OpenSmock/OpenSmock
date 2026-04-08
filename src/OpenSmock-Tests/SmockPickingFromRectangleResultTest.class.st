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
SmockPickingFromRectangleResultTest >> testGlobalRectangle [

	self assert: result globalRectangle isNil.
]

{ #category : #tests }
SmockPickingFromRectangleResultTest >> testGlobalStartPoint [

	self assert: result globalStartPoint isNil.
]

{ #category : #tests }
SmockPickingFromRectangleResultTest >> testIsRectanglePicking [

	self assert: result isRectanglePicking 
]

{ #category : #tests }
SmockPickingFromRectangleResultTest >> testLocalRectangle [

	self assert: result localRectangle isNil.
]

{ #category : #tests }
SmockPickingFromRectangleResultTest >> testLocalStartPoint [

	self assert: result localStartPoint isNil.
]
