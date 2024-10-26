"
A SmockDArcBandTest is a test class for testing the behavior of SmockDArcBand
"
Class {
	#name : #SmockDArcBandTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDArcBandTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDArcBand new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDArcBandTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDArcBand new.
	self deny: dShape isDrawModeDevice.
	self assert: dShape isTranslatedByParent.
	self assert: dShape aperture equals: nil.
	self deny: dShape isClosed.
	self assert: dShape orientation equals: nil.
	self assert: dShape radiusMin equals: nil.
	self assert: dShape radiusMax equals: nil.
]
