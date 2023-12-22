Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> basicAeDrawOn: aeCanvas [
super basicAeDrawOn: aeCanvas.

	"self drawTextTo: aeCanvas."

	self drawCenterRectToAeCanvas: aeCanvas.
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

	| font cairoScaledFont |
	font := smockFont nearestFont.
	cairoScaledFont := self smockFont cachedFont.
	glyphs ifNil: [ glyphs := cairoScaledFont glyphArrayForString: self text ].
	
	(self fillStyle notNil and:[ self fillStyle isColor ]) ifTrue:[
		aeCanvas setSourceColor: self fillStyle paint.
	].
	
	aeCanvas drawText: glyphs font: cairoScaledFont
]
