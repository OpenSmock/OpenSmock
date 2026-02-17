Class {
	#name : #SmockGPolygon2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGPolygon2DTest >> beDrawable [

	super beDrawable.

	gShape points: #( 0@0 1@1 2@2 ).
]

{ #category : #running }
SmockGPolygon2DTest >> gShapeClass [

	^ SmockGPolygon2D
]
