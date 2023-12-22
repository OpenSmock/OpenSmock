Extension { #name : #SmockGSquare2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSquare2D >> basicAeDrawOn: aeCanvas [

	| rect |
	super basicAeDrawOn: aeCanvas.
	"setting path"
	rect := self getSquare.
	aeCanvas pathFactory: [ :cairoContext | cairoContext rectangle: rect ].
	
	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas pathTranslate: self position.
	aeCanvas drawFigure
]
