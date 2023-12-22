Extension { #name : #SmockGPolyline2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGPolyline2D >> basicAeDrawOn: aeCanvas [

	super basicAeDrawOn: aeCanvas.
	"setting path"

	aeCanvas pathFactory: [ :cairoContext |
		self points size >= 2 ifTrue: [
			cairoContext lineFrom: self points first to: (self points at: 2) ].
		self points size >= 3 ifTrue: [
			3 to: self points size do: [ :index |
				| pt |
				pt := self points at: index.
				cairoContext lineTo: pt ] ] ].

	aeCanvas setBackgroundOff.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas drawFigure
]
