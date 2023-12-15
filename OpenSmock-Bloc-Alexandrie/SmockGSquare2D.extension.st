Extension { #name : #SmockGSquare2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSquare2D >> aeDrawOn: aeCanvas [

	| rect |
	rect := self getSquare.
	super aeDrawOn: aeCanvas.
	self position ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [ "setting path"
		aeCanvas pathFactory: [ :cairoContext |
			cairoContext rectangle: rect ].
		"set fillColor"
		self fillStyle ifNotNil: [ :style |
			aeCanvas setBackgroundWith: [ self injectFillStyleIn: aeCanvas ] ].
		"set strokeColor"
		self strokeStyle ifNotNil: [ :style |
			aeCanvas setBorderBlock: [ self injectStrokeStyleIn: aeCanvas ].
			aeCanvas setOutskirtsCentered ].
		aeCanvas pathTranslate: self position.
		aeCanvas drawFigure ]
]
