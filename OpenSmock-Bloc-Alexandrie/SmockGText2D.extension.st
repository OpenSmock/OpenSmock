Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self position ifNil: [ ^ self ].
	self text ifNil: [ ^ self ].
	self fillStyle ifNil: [ ^ self ].
	self smockFont ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [ self basicDrawOn: aeCanvas ]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> basicDrawOn: aeCanvas [
super basicDrawOn: aeCanvas.

	"self drawTextTo: aeCanvas."

	self drawCenterRectTo: aeCanvas.
	aeCanvas pathTranslate: self position.
	aeCanvas drawFigure
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawCenterRectTo: aeCanvas [

	aeCanvas pathFactory: [ :cairoContext |
		cairoContext rectangle: (-5 asPoint corner: 5 asPoint) ].
	"set fillColor"
		self fillStyle ifNotNil: [ :style |
			aeCanvas setBackgroundWith: [ self injectFillStyleIn: aeCanvas ] ].
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> drawTextTo: aeCanvas [

	| font cairoScaledFont |
	font := smockFont nearestFont.
	cairoScaledFont := self smockFont cachedFont.
	glyphs ifNil: [
		glyphs := cairoScaledFont glyphArrayForString: self text ].
	aeCanvas setSourceColor: self fillStyle paint.
	aeCanvas drawText: glyphs font: cairoScaledFont
]
