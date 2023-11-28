Extension { #name : #SmockGShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> aeDrawOn: aeCanvas [

	self position ifNil:[ ^ self ].

	aeCanvas restoreContextAfter: [

		aeCanvas pathTranslate: self position.
		aeCanvas pathFactory: [ :cairoContext | cairoContext rectangle: (0@0 extent: 5@5) ].		

		aeCanvas setBackgroundWith: [ aeCanvas setSourceColor: Color white ].

		aeCanvas drawFigure
	].
]
