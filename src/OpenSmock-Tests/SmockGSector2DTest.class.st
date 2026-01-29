Class {
	#name : #SmockGSector2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGSector2DTest >> beDrawable [

	super beDrawable.

	gShape position: 0 @ 0.
	gShape from: 0 @ 0.
	gShape to: 10 @ 10.
	gShape radius: 10
]

{ #category : #running }
SmockGSector2DTest >> gShapeClass [

	^ SmockGSector2D
]
