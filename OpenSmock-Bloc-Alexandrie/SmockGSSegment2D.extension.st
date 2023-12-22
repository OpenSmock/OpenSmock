Extension { #name : #SmockGSSegment2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSSegment2D >> basicAeDrawOn: aeCanvas [
	super basicAeDrawOn: aeCanvas.
	"setting path"

	aeCanvas pathFactory: [ :cairoContext |
		cairoContext lineFrom: self position to: self extent ].
	
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas drawFigure
]
