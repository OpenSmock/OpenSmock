Extension { #name : #SmockGSector2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSector2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	"setting path"
	aeCanvas pathFactory: [ :cairoContext |
		cairoContext
			circleSectorCenter: self position
			from: self from degreesToRadians
			to: self to degreesToRadians
			radius: self radius ].

	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.

	aeCanvas drawFigure
]
