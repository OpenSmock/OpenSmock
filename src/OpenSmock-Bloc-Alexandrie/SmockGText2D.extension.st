Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	self drawTextToAeCanvas: aeCanvas.
	aeCanvas pathTranslate: self position
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> cairoScaledFont [

	| font |
	font := self smockFont exists
		        ifTrue: [ self smockFont ]
		        ifFalse: [ smockFont nearestFont ].
	font ifNil: [
		font := SmockFont named: SmockFont allFontNames asArray first ].

	^ font cachedFont scaledFont
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawTextToAeCanvas: aeCanvas [

	| glyphs baseline glyphBounds cairoScaledFont |
	
	cairoScaledFont := self graphicContext cairoScaledFont.
	cairoScaledFont ifNil:[ ^ self ].
	
	glyphs := self graphicContext glyphs.
	glyphs ifNil:[ ^ self ].

	glyphBounds := self graphicContext glyphBounds.

	baseline := self manageGlyphCentering: self position forBounds: glyphBounds.
	baseline ifNil:[ ^ self ].

	self flag:'labordep: setup stroke when alexandrie will support it for a text'.
	"self injectStrokeStyleInAeCanvas: aeCanvas."
	self injectFillStyleInAeCanvas: aeCanvas.

	"Draw the glyphs"
	aeCanvas
		pathTranslate: baseline;
		drawGlyphs: glyphs font: cairoScaledFont
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
SmockGText2D >> manageGlyphCentering: aPosition forBounds: aBounds [

	| baseline |
	baseline := aPosition copy.
	self xAlign = #center ifTrue: [
		baseline := baseline - (aBounds center x @ 0) ].
	self xAlign = #right ifTrue: [
		baseline := baseline - (aBounds width @ 0) ].
	self yAlign = #center ifTrue: [
		baseline := baseline + (0 @ aBounds center y) ].
	self yAlign = #top ifTrue: [
		baseline := baseline + (0 @ aBounds height) ].
	^ baseline
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> prepareAeContext: anAeCanvas [

	| glyphs scaledFont glyphBounds baseline |
	self graphicContext ifNil: [ self graphicContext: SmockAeContext new ].
	self graphicContext needToComputeGlyphBounds ifTrue: [
			scaledFont := self cairoScaledFont.
			scaledFont ifNotNil: [
					glyphs := scaledFont glyphArrayForString: self text.
					glyphs ifNotNil: [
							glyphBounds := SmockAeUtils getRectangleFromMetrics:
								               (anAeCanvas metricsFor: glyphs font: scaledFont) ] ].
			self graphicContext cairoScaledFont: scaledFont.
			self graphicContext glyphBounds: glyphBounds.
			self graphicContext glyphs: glyphs.
			self graphicContext needToComputeGlyphBounds: false.
			self graphicContext needToComputeBounds: true
	].

	self flag:'labordep: the section below can be move outside Alexandrie package and place on >>computeBounds when a text size model (.i.e SmockFontExtent)) will be available (without cairo stuff). Text is a particular cases in Ae because need to be draw one time before to have the real size.'.
	self graphicContext needToComputeBounds ifTrue:[  | rectangle |
		"compute bounds using glyph bounds"
		self graphicContext glyphBounds ifNotNil:[ :e |
			baseline := self manageGlyphCentering: (self position) forBounds: e.
			rectangle := e translateBy: (baseline x @ (baseline y - (e height))).
			self effect ifNotNil:[ :f | rectangle := f computeBounds: rectangle ].
		].	
		self bounds: rectangle.
	].

	self graphicContext needToComputeBounds: false.
	
]
