Extension { #name : #SmockGMultiPolylines2D }

{ #category : #'*OpenSmock-Alexandrie' }
SmockGMultiPolylines2D >> basicAeDrawOn: aeCanvas [
	
	| isPathJumping |
	super basicAeDrawOn: aeCanvas.
	
	"general translation by the position point"
	(self position notNil and:[ self position ~= (0@0) ]) ifTrue:[ 
		aeCanvas pathTranslate: self position ].
	
	isPathJumping := false. "use to flag when there is a jump between two polylines"
		
	"drawing all polylines"
	aeCanvas pathFactory: [ :cairoContext | | firstPointOfAllPolylines lastDrawedPoint |
		
		firstPointOfAllPolylines := nil.
		lastDrawedPoint := nil.
		
		self polylines do:[ :polyline | | size points |
			
			points := polyline points.
			size := points size.
			size > 1 ifTrue:[ | firstPointOfCurrentPolyline |
				
				"move to the first point of a polyline only if the previous point is different"
				firstPointOfCurrentPolyline := points first.
				firstPointOfAllPolylines ifNil:[ 
					firstPointOfAllPolylines := firstPointOfCurrentPolyline.
					"init first point path"
					cairoContext moveTo: firstPointOfCurrentPolyline.
				].
				
				"jump to next polyline when necessary"
				(lastDrawedPoint notNil and:[lastDrawedPoint ~= firstPointOfCurrentPolyline]) ifTrue:[
					cairoContext moveTo: firstPointOfCurrentPolyline.
					isPathJumping ifFalse:[ isPathJumping := true ].
				].
			
				"draw rest of polyline"
				2 to: size do:[ :i | 
					lastDrawedPoint := points at: i.
					cairoContext lineTo: lastDrawedPoint.
				].		
			].
		].

		"close the path when the polyline is used to draw an entierely polygon to have a beautiful finition"
		( isPathJumping not and:[ lastDrawedPoint notNil and:[ firstPointOfAllPolylines notNil ] ] ) ifTrue:[
			lastDrawedPoint = firstPointOfAllPolylines ifTrue:[ cairoContext closePath ].
		].
	].

	self injectFillStyleInAeCanvas: aeCanvas.
	self injectStrokeStyleInAeCanvas: aeCanvas.
	
	aeCanvas drawFigure
]
