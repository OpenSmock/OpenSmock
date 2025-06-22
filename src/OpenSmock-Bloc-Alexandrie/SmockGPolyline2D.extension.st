Extension { #name : #SmockGPolyline2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGPolyline2D >> basicAeDrawOn: aeCanvas [
	| size pts |
	
	super basicAeDrawOn: aeCanvas.
	
	"general translation by the position point"
	(self position notNil and:[ self position ~= (0@0) ]) ifTrue:[ 
		aeCanvas pathTranslate: self position ].

	pts := self points.
	size := pts size.
	
	"drawing path"
	aeCanvas pathFactory: [ :cairoContext | 
		cairoContext moveTo: (pts at: 1).
		2 to: pts size do:[ :i | cairoContext lineTo: (pts at: i) ].		
	].

	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas drawFigure
]
