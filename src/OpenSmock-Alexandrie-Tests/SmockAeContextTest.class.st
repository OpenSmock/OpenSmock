"
A SmockAeContextTest is a test class for testing the behavior of SmockAeContext
"
Class {
	#name : #SmockAeContextTest,
	#superclass : #SmockGraphicContextTest,
	#category : #'OpenSmock-Alexandrie-Tests'
}

{ #category : #running }
SmockAeContextTest >> graphicContextClass [

	^ SmockAeContext 
]

{ #category : #tests }
SmockAeContextTest >> testCairoScaledFont [

	self assert: context cairoScaledFont isNil.
]

{ #category : #tests }
SmockAeContextTest >> testGlyphs [

	self assert: context glyphs isNil.
]

{ #category : #tests }
SmockAeContextTest >> testNeedToComputeGlyphBounds [

	self assert: context needToComputeGlyphBounds.
	
	context needToComputeGlyphBounds: false.
	self deny: context needToComputeGlyphBounds.
	
	context needToComputeGlyphBounds: true.
	self assert: context needToComputeGlyphBounds.
]

{ #category : #tests }
SmockAeContextTest >> testPropertyHasChanged [

	super testPropertyHasChanged.
	
	"test for changing glyph bounds flag"
	context needToComputeGlyphBounds: false.
	context propertyHasChanged: #text.
	self assert: context needToComputeGlyphBounds.
	
	context needToComputeGlyphBounds: false.
	context propertyHasChanged: #smockFont.
	self assert: context needToComputeGlyphBounds.
]
