Class {
	#name : #SmockGSquare2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGSquare2DTest >> beDrawable [

	super beDrawable.

	gShape position: 0 @ 0
]

{ #category : #running }
SmockGSquare2DTest >> gShapeClass [

	^ SmockGSquare2D
]
