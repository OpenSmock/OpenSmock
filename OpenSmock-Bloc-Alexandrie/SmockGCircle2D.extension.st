Extension { #name : #SmockGCircle2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCircle2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	"setting path"
	aeCanvas pathFactory: [ :cairoContext |
		cairoContext circleRadius: self radius ].
	
	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas pathTranslate: self position.
	aeCanvas drawFigure
]
