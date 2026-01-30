Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> aeScaledFont [

	| font |
	font := self smockFont exists
		        ifTrue: [ self smockFont ]
		        ifFalse: [ smockFont nearestFont ].
	font ifNil: [
		font := SmockFont named: SmockFont allFontNames asArray first ].

	^ font cachedFont scaledFont
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	self drawTextToAeCanvas: aeCanvas.
	aeCanvas pathTranslate: self position
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> cairoScaledFont [

	self
		deprecated: 'use aeScaledFont'
		transformWith:
		'`@receiver cairoScaledFont' -> '`@receiver aeScaledFont'.

	^ self aeScaledFont 
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> computeAeContextGlyphBounds: anAeCanvas [

	| glyphs scaledFont glyphBounds extents metrics |
	scaledFont := self aeScaledFont.
	scaledFont ifNotNil: [
			glyphs := scaledFont glyphArrayForString: self text.
			glyphs ifNotNil: [
					metrics := anAeCanvas metricsFor: glyphs font: scaledFont.
					glyphBounds := SmockAeUtils getRectangleFromMetrics: metrics ].
			extents := scaledFont fontExtents ].

	self graphicContext scaledFont: scaledFont.
	self graphicContext fontExtents: extents.
	self graphicContext glyphMetrics: metrics.
	self graphicContext glyphBounds: glyphBounds.
	self graphicContext glyphs: glyphs
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> computeBoundsWithAeContext [

	| rectangle glyphBounds metrics baseline |
	"compute bounds using graphic context"
	glyphBounds := self graphicContext glyphBounds.
	metrics := self graphicContext glyphMetrics.
	baseline := self
		            manageAeGlyphCentering: self position
		            forBounds: glyphBounds.
	rectangle := glyphBounds translateBy:
		             baseline x @ (baseline y + metrics bearingY).

	self effect ifNotNil: [ :f | rectangle := f computeBounds: rectangle ].

	self bounds: rectangle
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawTextToAeCanvas: aeCanvas [

	| glyphs baseline glyphBounds cairoScaledFont |
	cairoScaledFont := self graphicContext scaledFont ifNil: [ ^ self ].
	glyphs := self graphicContext glyphs ifNil: [ ^ self ].
	glyphBounds := self graphicContext glyphBounds.
	baseline := (self
		             manageAeGlyphCentering: self position
		             forBounds: glyphBounds) ifNil: [ ^ self ].

	self flag:
		'labordep: setup stroke when alexandrie will support it for a text'.
	"self injectStrokeStyleInAeCanvas: aeCanvas."
	self injectFillStyleInAeCanvas: aeCanvas.

	"Draw the glyphs"
	aeCanvas
		pathTranslate: baseline;
		drawGlyphs: glyphs font: cairoScaledFont
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> initializeAeContext [

	self graphicContext: SmockAeContext new
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> injectFillStyleInAeCanvas: aeCanvas [
	"different to draw in case a text"
	
	self fillStyle ifNil:[ ^ self ].
	
	self fillStyle isColor ifTrue: [
		aeCanvas setSourceColor: self fillStyle paint 
	].
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> manageAeGlyphCentering: aPosition forBounds: aBounds [

	| baseline extents |
	extents := self graphicContext fontExtents ifNil: [ ^ aPosition ].
	baseline := aPosition - (0 @ extents descent).

	"X alignment, #center is the default case and #left is the default value (not change baseline)"
	self xAlign = #center
		ifTrue: [ baseline := baseline - (aBounds center x @ 0) ]
		ifFalse: [
				self xAlign = #right ifTrue: [
					baseline := baseline - (aBounds width @ 0) ] ].

	"Y alignment, #center is the default case and #top is the default value (not change baseline)"
	self yAlign = #center
		ifTrue: [ baseline := baseline + (0 @ aBounds center y) ]
		ifFalse: [
				self yAlign = #bottom ifTrue: [
					baseline := baseline + (0 @ extents height) ] ].

	^ baseline
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> prepareAeContext: anAeCanvas [

	self graphicContext ifNil: [ self initializeAeContext ].
	self graphicContext needToComputeGlyphBounds ifTrue: [
			self computeAeContextGlyphBounds: anAeCanvas.
			self graphicContext needToComputeGlyphBounds: false.
			self graphicContext needToComputeBounds: true ].

	self graphicContext needToComputeBounds ifFalse: [ ^ self ].
	
	self computeBoundsWithAeContext.
	self graphicContext needToComputeBounds: false
]
