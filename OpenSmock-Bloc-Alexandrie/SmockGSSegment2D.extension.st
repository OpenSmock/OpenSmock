Extension { #name : #SmockGSSegment2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSSegment2D >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self position ifNil: [ ^ self ].
	self extent ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [self basicDrawOn: aeCanvas]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGSSegment2D >> basicDrawOn: aeCanvas [
	super basicDrawOn: aeCanvas.
	"setting path"

	aeCanvas pathFactory: [ :cairoContext |
		cairoContext lineFrom: self position to: self extent ].
	"set strokeColor"
	self strokeStyle ifNotNil: [ :style |
		aeCanvas setBorderBlock: [ self injectStrokeStyleIn: aeCanvas ].
		aeCanvas setOutskirtsCentered ].
	aeCanvas drawFigure
]
