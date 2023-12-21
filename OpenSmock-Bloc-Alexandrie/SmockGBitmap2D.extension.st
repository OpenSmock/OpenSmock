Extension { #name : #SmockGBitmap2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGBitmap2D >> aeDrawOn: aeCanvas [

	self position ifNil: [ ^ self ].
	self form ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [
		self basicDrawOn: aeCanvas.
		]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGBitmap2D >> basicDrawOn: aeCanvas [

	super basicDrawOn: aeCanvas.
	aeCanvas pathTranslate: self position - (self form extent /2).
	aeCanvas pathFactory: [ :cairoContext | "Tip: Use another path to clip the form"
		cairoContext rectangleTo: self form extent ].

	aeCanvas setBackgroundWithForm: self form alpha: self alpha.
	aeCanvas setBorderOff.
	aeCanvas drawFigure
]
