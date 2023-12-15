Extension { #name : #SmockGPolygon2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGPolygon2D >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self points ifNil: [ ^ self ].

	aeCanvas restoreContextAfter: [ "setting path"
		aeCanvas pathFactory: [ :cairoContext |
			self points size >= 2 ifTrue: [
				cairoContext lineFrom: self points first to: (self points at: 2) ].
			self points size >= 3 ifTrue: [
				3 to: self points size do: [ :index | | pt | pt := (self points at: index). cairoContext lineTo: pt ] ] ].
		"set fillColor"
		self fillStyle ifNotNil: [ :style |
			aeCanvas setBackgroundWith: [ self injectFillStyleIn: aeCanvas ] ].
		"set strokeColor"
		self strokeStyle ifNotNil: [ :style |
			aeCanvas setBorderBlock: [ self injectStrokeStyleIn: aeCanvas ].
			aeCanvas setOutskirtsCentered ].

		aeCanvas drawFigure ]
]
