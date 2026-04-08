Class {
	#name : #SmockPickingFromShapeResultTest,
	#superclass : #SmockPickingResultTest,
	#category : #'OpenSmock-Tests-Picking'
}

{ #category : #testing }
SmockPickingFromShapeResultTest class >> isAbstract [ 

	^ self == SmockPickingFromShapeResultTest 
]

{ #category : #tests }
SmockPickingFromShapeResultTest >> testIsCirclePicking [

	self deny: result isCirclePicking 
]

{ #category : #tests }
SmockPickingFromShapeResultTest >> testIsInclusive [

	self assert: result isInclusive.
	
	result isInclusive: false.
	self deny: result isInclusive. 
	
	result isInclusive: nil.
	self assert: result isInclusive.
]

{ #category : #tests }
SmockPickingFromShapeResultTest >> testIsPolygonPicking [

	self deny: result isPolygonPicking 
]

{ #category : #tests }
SmockPickingFromShapeResultTest >> testIsPolylinePicking [

	self deny: result isPolylinePicking 
]

{ #category : #tests }
SmockPickingFromShapeResultTest >> testIsRectanglePicking [

	self deny: result isRectanglePicking 
]

{ #category : #tests }
SmockPickingFromShapeResultTest >> testIsShapePicking [

	self assert: result isShapePicking
]
