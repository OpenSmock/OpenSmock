Extension { #name : #SmockGBitmap2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGBitmap2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	aeCanvas pathTranslate: self position - (self form extent / 2).
	
	self rotation ~= 0.0 ifTrue:[ | matrix radians |
		self flag:'labordep: propose to alexandry a pathRotate: method'.
		matrix := AeCairoMatrix newIdentity.
		radians := self rotation degreesToRadians.
		matrix rotateByRadians: radians.
		aeCanvas pathTransform: matrix.  	
	].

	self colorMask
		ifNil: [
			aeCanvas pathFactory: [ :cairoContext | "Tip: Use another path to clip the form"
				cairoContext rectangleTo: self form extent ].
			aeCanvas setBackgroundWithForm: self form alpha: self alpha.
			aeCanvas setBorderOff ]
		ifNotNil: [ :color |
			aeCanvas
				maskSurface: (AeCairoImageSurface fromForm: form)
				x: 0
				y: 0
				color: color ].

	aeCanvas drawFigure
]
