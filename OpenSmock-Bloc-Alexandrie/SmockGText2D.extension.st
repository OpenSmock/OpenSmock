Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	self drawTextToAeCanvas: aeCanvas.
	aeCanvas pathTranslate: self position.
	aeCanvas drawFigure
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawTextToAeCanvas: aeCanvas [

	| font cairoScaledFont baseline glyphBounds |
	font := smockFont nearestFont.
	cairoScaledFont := self smockFont cachedFont scaledFont.
	glyphs ifNil: [
		glyphs := cairoScaledFont glyphArrayForString: self text ].
	glyphBounds := SmockAeUtils getRectangleFromMetrics:
		               (aeCanvas metricsFor: glyphs font: cairoScaledFont).

	"Draw the glyphs"
	baseline := self
		            manageGlyphCentering: self position
		            forBounds: glyphBounds.
	aeCanvas
		setSourceColor: self fillStyle paint;
		pathTranslate: baseline;
		drawText: glyphs font: cairoScaledFont
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
