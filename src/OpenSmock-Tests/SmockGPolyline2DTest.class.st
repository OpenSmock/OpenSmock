Class {
	#name : #SmockGPolyline2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #running }
SmockGPolyline2DTest >> gShapeClass [

	^ SmockGPolyline2D
]

{ #category : #tests }
SmockGPolyline2DTest >> testIsDrawable [

	super testIsDrawable.

	gShape fillStyle: Color blue asSmockFillStyle.
	gShape points: #( 0@0 1@1 2@2 ).
	self assert: gShape isDrawable
]
