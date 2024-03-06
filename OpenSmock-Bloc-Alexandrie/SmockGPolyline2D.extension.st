Extension { #name : #SmockGPolyline2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGPolyline2D >> basicAeDrawOn: aeCanvas [

	| offcenter tmp size|
	super basicAeDrawOn: aeCanvas.
	"setting path"
	offcenter := self position ifNil: [ 0 @ 0 ].
	size := self points size.
	aeCanvas pathFactory: [ :cairoContext |
		size >= 2 ifTrue: [
			cairoContext
				lineFrom: self points first + offcenter
				to: (self points at: 2) + offcenter ].
		size >= 3 ifTrue: [
			3 to: size do: [ :index |
				| pt |
				pt := self points at: index.
				cairoContext lineTo: pt + offcenter ].
			tmp := self points first.
			] ].

	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	aeCanvas drawFigure
]
