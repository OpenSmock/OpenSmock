Class {
	#name : #SmockGPolygon2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #running }
SmockGPolygon2DTest >> gShapeClass [

	^ SmockGPolygon2D
]

{ #category : #tests }
SmockGPolygon2DTest >> testIsDrawable [

	super testIsDrawable.

	gShape fillStyle: Color blue asSmockFillStyle.
	gShape points: #( 0@0 1@1 2@2 ).
	self assert: gShape isDrawable
]
