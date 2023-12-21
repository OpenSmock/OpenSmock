Extension { #name : #SmockGPolyline2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGPolyline2D >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self position ifNil: [ ^ self ].
	self points ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [ self basicDrawOn: aeCanvas ]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGPolyline2D >> basicDrawOn: aeCanvas [

	super basicDrawOn: aeCanvas.
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
	"set strokeColor"
	self strokeStyle ifNotNil: [ :style |
		aeCanvas setBorderBlock: [ self injectStrokeStyleIn: aeCanvas ].
		aeCanvas setOutskirtsCentered ].
	aeCanvas drawFigure
]
