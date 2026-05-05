"
A SmockDCircleTest is a test class for testing the behavior of SmockDCircle
"
Class {
	#name : #SmockDCircleTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDCircleTest >> dShapeClass [

	^ SmockDCircle
]

{ #category : #tests }
SmockDCircleTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDCircleTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: dShape radius equals: nil.
]
