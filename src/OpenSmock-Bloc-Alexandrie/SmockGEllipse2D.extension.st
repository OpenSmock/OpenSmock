Extension { #name : #SmockGEllipse2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGEllipse2D >> basicAeDrawOn: aeCanvas [

	| offset |
	super basicAeDrawOn: aeCanvas.

	offset := self radius1 @ self radius2 / 2 negated.

	"setting path"
	aeCanvas pathFactory: [ :cairoContext | "manage orientation when determined"
			self rotation
				ifNotNil: [ :o | "cairoContext translateBy: center."
						cairoContext
							rotateByRadians: o degreesToRadians
							center: self position.
						self position ~= (0 @ 0) ifTrue: [
							cairoContext translateBy: self position ].
						cairoContext translateBy: offset ]
				ifNil: [ cairoContext translateBy: offset + self position ].

			"draw ellipse"
			cairoContext ellipseWidth: self radius1 height: self radius2 ].

	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.

	aeCanvas drawFigure
]
