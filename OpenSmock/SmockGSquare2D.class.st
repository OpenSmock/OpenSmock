Class {
	#name : #SmockGSquare2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'sideSize'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #drawing }
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

{ #category : #'as yet unclassified' }
SmockGSquare2D >> getSquare [

	^ self sideSize negated / 2 asPoint corner: self sideSize / 2 asPoint
]

{ #category : #accessing }
SmockGSquare2D >> sideSize [

	^ sideSize ifNil:[sideSize := 20].
]

{ #category : #accessing }
SmockGSquare2D >> sideSize: anObject [

	sideSize := anObject
]
