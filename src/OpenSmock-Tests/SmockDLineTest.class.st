"
A SmockDLineTest is a test class for testing the behavior of SmockDLine
"
Class {
	#name : #SmockDLineTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDLineTest >> dShapeClass [ 

	^ SmockDLine
]

{ #category : #tests }
SmockDLineTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: dShape orientation equals: nil.
]
