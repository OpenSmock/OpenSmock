Extension { #name : #SmockGMultiPolylines2D }

{ #category : #'*OpenSmock-Alexandrie' }
SmockGMultiPolylines2D >> basicAeDrawOn: aeCanvas [
	
	super basicAeDrawOn: aeCanvas.
	
	"general translation by the position point"
	(self position notNil and:[ self position ~= (0@0) ]) ifTrue:[ 
		aeCanvas pathTranslate: self position ].
	
	"drawing all polylines"
	aeCanvas pathFactory: [ :cairoContext | 
		
		self polylines do:[ :polyline | | size points |
			points := polyline points.
			size := points size.
			size > 1 ifTrue:[
				cairoContext moveTo: (points at: 1).
				2 to: size do:[ :i | cairoContext lineTo: (points at: i) ].		
			].
		].

	].

	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas drawFigure
]
