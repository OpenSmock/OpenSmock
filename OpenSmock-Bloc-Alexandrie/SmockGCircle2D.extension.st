Extension { #name : #SmockGCircle2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCircle2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	"setting path"
	aeCanvas pathFactory: [ :cairoContext |
		cairoContext circleCenterX: 0 y: 0 radius: self radius 
	].
	
	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas pathTranslate: self position.
	
	aeCanvas drawFigure
]
