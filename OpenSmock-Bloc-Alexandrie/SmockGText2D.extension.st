Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	self drawTextToAeCanvas: aeCanvas.
	aeCanvas pathTranslate: self position.
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawTextToAeCanvas: aeCanvas [

	| font baseline glyphBounds aeCairoScaledFont |
	self flag: 'PLA dirty code, need to be factorized'.
	font := self smockFont exists
		        ifTrue: [ self smockFont ]
		        ifFalse: [ smockFont nearestFont ].
	font ifNil: [
		font := SmockFont named: SmockFont allFontNames asArray first ].
	aeCairoScaledFont := font cachedFont scaledFont.

	glyphs ifNil: [
		glyphs := aeCairoScaledFont glyphArrayForString: self text ].
	glyphBounds := SmockAeUtils getRectangleFromMetrics:
		               (aeCanvas metricsFor: glyphs font: aeCairoScaledFont).

	"Draw the glyphs"
	baseline := self
		            manageGlyphCentering: self position
		            forBounds: glyphBounds.
	glyphs ifNil:[ ^ self ].
	aeCanvas
		setSourceColor: self fillStyle paint;
		pathTranslate: baseline;
		drawGlyphs: glyphs font: aeCairoScaledFont
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
