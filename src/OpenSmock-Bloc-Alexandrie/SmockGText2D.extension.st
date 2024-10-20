Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	self drawTextToAeCanvas: aeCanvas.
	aeCanvas pathTranslate: self position
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawTextToAeCanvas: aeCanvas [

	| baseline glyphBounds aCairoScaledFont |
	aCairoScaledFont := self getCairoScaledFont ifNil:[ ^ self ].

	glyphs ifNil: [ glyphs := aCairoScaledFont glyphArrayForString: self text ].
	glyphs ifNil: [ ^ self ].

	glyphBounds := SmockAeUtils getRectangleFromMetrics: (aeCanvas metricsFor: glyphs font: aCairoScaledFont).
	glyphBounds extent = (0@0) ifTrue:[ ^ self ].

	baseline := self manageGlyphCentering: self position forBounds: glyphBounds.
	baseline ifNil:[ ^ self ].

	"self injectStrokeStyleInAeCanvas: aeCanvas.	"
	self injectFillStyleInAeCanvas: aeCanvas.
	
	"Draw the glyphs"
	aeCanvas
		pathTranslate: baseline;
		drawGlyphs: glyphs font: aCairoScaledFont
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> getCairoScaledFont [

	| font |
	font := self smockFont exists
		        ifTrue: [ self smockFont ]
		        ifFalse: [ smockFont nearestFont ].
	font ifNil: [
		font := SmockFont named: SmockFont allFontNames asArray first ].

	^ font cachedFont scaledFont
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
