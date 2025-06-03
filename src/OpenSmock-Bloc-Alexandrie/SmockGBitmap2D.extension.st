Extension { #name : #SmockGBitmap2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGBitmap2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	(self rotation notNil and:[ self rotation ~= 0 ]) ifTrue:[ | matrix radians |
		matrix := AeCairoMatrix newIdentity.
		radians := (self rotation % 360) degreesToRadians.
		matrix rotateByRadians: radians.
		aeCanvas pathTransform: matrix.  	
	].

	aeCanvas pathTranslate: self position - (self form extent * self scale / 2).
	aeCanvas pathScale: self scale.

	self injectFillStyleInAeCanvas: aeCanvas.

	aeCanvas drawFigure
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGBitmap2D >> injectFillStyleInAeCanvas: aeCanvas [
	"Paint the form"

	fillStyle := self fillStyle.
	(fillStyle isNil or: [ fillStyle isColor not ])
		ifTrue: [
			aeCanvas pathFactory: [ :cairoContext | "Tip: Use another path to clip the form"
				cairoContext rectangleTo: self form extent ].
			aeCanvas setBackgroundWithForm: self form alpha: self alpha.
			aeCanvas setBorderOff ]
		ifFalse: [
			aeCanvas
				maskSurface: (AeCairoImageSurface fromForm: form)
				x: 0
				y: 0
				color: fillStyle paint ]
]
