Extension { #name : #SmockGCircle2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCircle2D >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self radius ifNil: [ ^ self ].
	self radius = 0 ifTrue: [ ^ self ].
	self position ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [self basicDrawOn: aeCanvas ]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCircle2D >> basicDrawOn: aeCanvas [

	super basicDrawOn: aeCanvas.
	
	"setting path"
		aeCanvas pathFactory: [ :cairoContext |
			cairoContext circleRadius: self radius ].
		"set fillColor"
		self fillStyle ifNotNil: [ :style |
			aeCanvas setBackgroundWith: [ self injectFillStyleIn: aeCanvas ] ].
		"set strokeColor"
		self strokeStyle ifNotNil: [ :style |
			aeCanvas setBorderBlock: [ self injectStrokeStyleIn: aeCanvas ].
			aeCanvas setOutskirtsCentered ].
		aeCanvas pathTranslate: self position.
		aeCanvas drawFigure
]
