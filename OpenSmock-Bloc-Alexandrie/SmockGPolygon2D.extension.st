Extension { #name : #SmockGPolygon2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGPolygon2D >> basicAeDrawOn: aeCanvas [

	| tmp offcenter |
	super basicAeDrawOn: aeCanvas.
	"setting path"
	offcenter := self position ifNil: [ 0 @ 0 ].

	aeCanvas pathFactory: [ :cairoContext |
		self points size >= 2 ifTrue: [
			cairoContext
				lineFrom: self points first + offcenter
				to: (self points at: 2) + offcenter ].
		self points size >= 3 ifTrue: [
			3 to: self points size do: [ :index |
				| pt |
				pt := self points at: index.
				cairoContext lineTo: pt + offcenter ].
			tmp := self points first.
			tmp = self points last ifFalse: [
				cairoContext lineTo: tmp + offcenter ] ] ].

	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.

	aeCanvas drawFigure
]
