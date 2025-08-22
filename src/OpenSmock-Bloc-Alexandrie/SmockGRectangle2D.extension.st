Extension { #name : #SmockGRectangle2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGRectangle2D >> basicAeDrawOn: aeCanvas [

	| rect |
	super basicAeDrawOn: aeCanvas.

	"setting path"
	rect := self position extent: (self length1 @ self length2).
	aeCanvas pathFactory: [ :cairoContext | cairoContext rectangle: rect ].
	
	self flag:'pla: do rotation'.
	
	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas drawFigure
]
