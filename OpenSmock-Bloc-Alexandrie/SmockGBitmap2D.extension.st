Extension { #name : #SmockGBitmap2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGBitmap2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.
	^ self basicAeDrawOnType2: aeCanvas
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGBitmap2D >> basicAeDrawOnType1: aeCanvas [

	aeCanvas pathTranslate: self position - (self form extent / 2).
	aeCanvas pathFactory: [ :cairoContext | "Tip: Use another path to clip the form"
		cairoContext rectangleTo: self form extent ].

	aeCanvas setBackgroundWithForm: self form alpha: self alpha.
	aeCanvas setBorderOff.
	aeCanvas drawFigure
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGBitmap2D >> basicAeDrawOnType2: aeCanvas [

	aeCanvas pathTranslate: self position - (self form extent / 2).
	self colorMask ifNil:[
		aeCanvas pathFactory: [ :cairoContext | "Tip: Use another path to clip the form"
		cairoContext rectangleTo: self form extent ].
		aeCanvas setBackgroundWithForm: self form alpha: self alpha.
	aeCanvas setBorderOff.
		] ifNotNil:[ :color |
		aeCanvas maskSurface: (AeCairoImageSurface fromForm: form)  x:0  y:0 color: color]. 
	aeCanvas drawFigure
]
