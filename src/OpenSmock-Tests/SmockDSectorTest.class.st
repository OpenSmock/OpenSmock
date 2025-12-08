"
A SmockDSectorTest is a test class for testing the behavior of SmockDSector
"
Class {
	#name : #SmockDSectorTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDSectorTest >> dShapeClass [

	^ SmockDSector
]

{ #category : #tests }
SmockDSectorTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDSectorTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: dShape aperture equals: nil.
	self assert: dShape orientation equals: nil.
	self assert: dShape radius equals: nil.
]
