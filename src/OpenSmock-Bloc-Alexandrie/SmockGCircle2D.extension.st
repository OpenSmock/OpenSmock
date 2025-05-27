Extension { #name : #SmockGCircle2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCircle2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.

	"setting path"
	aeCanvas pathFactory: [ :cairoContext |
		cairoContext circleCenterX: self position x y: self position y radius: self radius ].

	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.

	aeCanvas drawFigure
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCircle2D >> setGradientRadialPaint: aRadialGradientPaint inAeCanvas: aeCanvas [

	aRadialGradientPaint isRelative ifTrue: [
		aeCanvas
			setSourceRadialPatternStops: aRadialGradientPaint stops
			innerCenter: self position
			innerRadius: 0
			outerCenter: self position
			outerRadius: self radius ]
]
