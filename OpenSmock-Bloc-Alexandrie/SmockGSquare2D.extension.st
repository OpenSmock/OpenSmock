Extension { #name : #SmockGSquare2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSquare2D >> aeDrawOn: aeCanvas [


	super aeDrawOn: aeCanvas.
	self position ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [ self basicDrawOn: aeCanvas ]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSquare2D >> basicDrawOn: aeCanvas [

	| rect |
	super basicDrawOn: aeCanvas.
	"setting path"
	rect := self getSquare.
	aeCanvas pathFactory: [ :cairoContext | cairoContext rectangle: rect ].
	"set fillColor"
	self fillStyle ifNotNil: [ :style | aeCanvas setBackgroundWith: [ self injectFillStyleIn: aeCanvas ].
		"self injectFillStyleIn: aeCanvas" ].
	"set strokeColor"
	self strokeStyle ifNotNil: [ :style |
		aeCanvas setBorderBlock: [ self injectStrokeStyleIn: aeCanvas ].
		aeCanvas setOutskirtsCentered ].
	aeCanvas pathTranslate: self position.
	aeCanvas drawFigure
]
