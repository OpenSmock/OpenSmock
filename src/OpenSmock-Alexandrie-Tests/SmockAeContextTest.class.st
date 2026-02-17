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
SmockAeContextTest >> testFontExtents [

	self assert: context fontExtents isNil.
	
	context fontExtents: AeCairoFontExtents new.
	self assert: context fontExtents notNil.
]

{ #category : #tests }
SmockAeContextTest >> testGlyphBounds [

	self assert: context glyphBounds isNil.
	
	context glyphBounds: (0@0 extent: 10@10).
	self assert: context glyphBounds notNil.
]

{ #category : #tests }
SmockAeContextTest >> testGlyphMetrics [

	self assert: context glyphMetrics isNil.
	
	context glyphMetrics: AeCairoTextMetrics new.
	self assert: context glyphMetrics notNil.
]

{ #category : #tests }
SmockAeContextTest >> testGlyphs [

	self assert: context glyphs isNil.
	
	context glyphs: AeCairoOpaqueGlyphArray new.
	self assert: context glyphs notNil.
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

{ #category : #tests }
SmockAeContextTest >> testScaledFont [

	| font |
	self assert: context scaledFont isNil.
	
	font := SmockFont named: 'Source code pro'.
	context scaledFont: font cachedFont scaledFont.
	self assert: context scaledFont notNil.
]
