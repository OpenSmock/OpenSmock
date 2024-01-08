Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	"self drawTextTo: aeCanvas."

	self drawTextToAeCanvas: aeCanvas.
	"self drawCenterRectToAeCanvas: aeCanvas."
	aeCanvas pathTranslate: self position.
	aeCanvas drawFigure
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawCenterRectToAeCanvas: aeCanvas [

	aeCanvas pathFactory: [ :cairoContext |
		cairoContext rectangle: (-5 asPoint corner: 5 asPoint) ].
	
	self injectFillStyleInAeCanvas: aeCanvas.
	
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawTextToAeCanvas: aeCanvas [

	| font cairoScaledFont metrics baseline glyphBounds |
	font := smockFont nearestFont.
	cairoScaledFont := self smockFont cachedFont scaledFont.
	glyphs ifNil: [
		glyphs := cairoScaledFont glyphArrayForString: self text ].
	glyphBounds := self getRectangleFromMetrics:
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
SmockGText2D >> getRectangleFromMetrics: aMetric [
^0 asPoint extent: (aMetric width @ aMetric height).  
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> manageGlyphCentering: aPosition forBounds: aBounds [

	| baseline glyphBounds |
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
SmockGText2D >> renderGlyphs: aCairoGlyphsArray scaledFont: aCairoScaledFont on: aeCanvas [

	| metrics baseline |
	"Calculate text metrics"
	metrics := aeCanvas
		           metricsFor: aCairoGlyphsArray
		           font: aCairoScaledFont.
	baseline := metrics bearingX @ metrics ascent negated.

	"Draw the glyphs"
	aeCanvas
		pathTranslate: baseline;
		drawText: aCairoGlyphsArray font: aCairoScaledFont
]
