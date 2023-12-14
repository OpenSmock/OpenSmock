Class {
	#name : #SmockGSSegment2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'extent'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #drawing }
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

{ #category : #accessing }
SmockGSSegment2D >> extent [

	^ extent
]

{ #category : #accessing }
SmockGSSegment2D >> extent: anObject [

	extent := anObject
]
