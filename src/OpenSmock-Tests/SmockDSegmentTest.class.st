"
A SmockDSegmentTest is a test class for testing the behavior of SmockDSegment
"
Class {
	#name : #SmockDSegmentTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDSegmentTest >> dShapeClass [

	^ SmockDSegment
]

{ #category : #tests }
SmockDSegmentTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: dShape coordinates equals: nil.
	self assert: dShape coordinates2 equals: nil.
]
