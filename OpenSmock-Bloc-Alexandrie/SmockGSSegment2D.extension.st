Extension { #name : #SmockGSSegment2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSSegment2D >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self position ifNil: [ ^ self ].
	self extent ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [ "setting path"
		aeCanvas pathFactory: [ :cairoContext |
			cairoContext lineFrom: self position to: self extent ].
		"set strokeColor"
		self strokeStyle ifNotNil: [ :style |
			aeCanvas setBorderBlock: [ self injectStrokeStyleIn: aeCanvas ].
			aeCanvas setOutskirtsCentered ].
		aeCanvas drawFigure ]
]
