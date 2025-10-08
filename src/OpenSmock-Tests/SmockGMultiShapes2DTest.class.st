Class {
	#name : #SmockGMultiShapes2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #testing }
SmockGMultiShapes2DTest class >> isAbstract [ 

	^ self == SmockGMultiShapes2DTest
]

{ #category : #running }
SmockGMultiShapes2DTest >> gShapeClass [

	^ SmockGMultiShapes2D 
]
