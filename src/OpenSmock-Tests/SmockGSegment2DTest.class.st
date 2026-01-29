Class {
	#name : #SmockGSegment2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGSegment2DTest >> beDrawable [

	super beDrawable.

	gShape position: 0 @ 0.
	gShape extent: 10 @ 10
]

{ #category : #running }
SmockGSegment2DTest >> gShapeClass [

	^ SmockGSegment2D
]
