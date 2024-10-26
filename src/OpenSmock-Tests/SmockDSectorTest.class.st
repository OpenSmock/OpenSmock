"
A SmockDSectorTest is a test class for testing the behavior of SmockDSector
"
Class {
	#name : #SmockDSectorTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDSectorTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDSector new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDSectorTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDSector new.
	self deny: dShape isDrawModeDevice.
	self deny: dShape isTranslatedByParent.
	self assert: dShape aperture equals: nil.
	self assert: dShape orientation equals: nil.
	self assert: dShape radius equals: nil.
	self deny: dShape isTranslatedByParent.
]
