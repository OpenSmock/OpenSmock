Class {
	#name : #SmockGPolyline2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #drawing }
SmockGPolyline2D >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self position ifNil: [ ^ self ].
	self points ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [ "setting path"
		aeCanvas pathFactory: [ :cairoContext |
			self points size >= 2 ifTrue: [
				cairoContext lineFrom: self points first to: (self points at: 2) ].
			self points size >= 3 ifTrue: [
				3 to: self points size do: [ :pt | cairoContext lineTo: pt ] ] ].
		"set strokeColor"
		self strokeStyle ifNotNil: [ :style |
			aeCanvas setBorderBlock: [ self injectStrokeStyleIn: aeCanvas ].
			aeCanvas setOutskirtsCentered ].
		aeCanvas drawFigure ]
]

{ #category : #accessing }
SmockGPolyline2D >> points [

	^ points
]

{ #category : #accessing }
SmockGPolyline2D >> points: anObject [

	points := anObject
]
