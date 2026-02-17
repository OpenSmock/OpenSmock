Class {
	#name : #SmockGMultiPolylines2DTest,
	#superclass : #SmockGMultiShapes2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGMultiPolylines2DTest >> beDrawable [

	super beDrawable.

	gShape addShape: SmockGPolyline2D new
]

{ #category : #running }
SmockGMultiPolylines2DTest >> gShapeClass [

	^ SmockGMultiPolylines2D
]
