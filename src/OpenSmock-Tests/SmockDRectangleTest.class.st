"
A SmockDRectangleTest is a test class for testing the behavior of SmockDRectangle
"
Class {
	#name : #SmockDRectangleTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDRectangleTest >> dShapeClass [

	^ SmockDRectangle
]

{ #category : #tests }
SmockDRectangleTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDRectangleTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: dShape length1 equals: nil.
	self assert: dShape length2 equals: nil.
	self assert: dShape orientation equals: nil.
]
