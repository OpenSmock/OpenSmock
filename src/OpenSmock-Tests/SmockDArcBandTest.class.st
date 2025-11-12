"
A SmockDArcBandTest is a test class for testing the behavior of SmockDArcBand
"
Class {
	#name : #SmockDArcBandTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDArcBandTest >> dShapeClass [

	^ SmockDArcBand
]

{ #category : #tests }
SmockDArcBandTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDArcBandTest >> testInitialize [ 
	
	super testInitialize.
		
	self assert: dShape aperture equals: nil.
	self deny: dShape isClosed.
	self assert: dShape orientation equals: nil.
	self assert: dShape radiusMin equals: nil.
	self assert: dShape radiusMax equals: nil.
]
