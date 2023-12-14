Extension { #name : #SmockGText2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGText2D >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self position ifNil:[ ^ self ].

	aeCanvas restoreContextAfter: [

		self flag: 'labordep: temporary drawing test in ae, in term this code should not considere selected property'.
		aeCanvas pathTranslate: self position.

		(self isPropertyExists: #selected) ifTrue:[
			aeCanvas pathFactory: [ :cairoContext | cairoContext rectangle: (0@0 extent: 20@20) ].		
			aeCanvas setBackgroundWith: [ aeCanvas setSourceColor: Color cyan ].	
		] ifFalse:[
			aeCanvas pathFactory: [ :cairoContext | cairoContext rectangle: (0@0 extent: 5@5) ].		
			aeCanvas setBackgroundWith: [ aeCanvas setSourceColor: Color red ].
		].

		aeCanvas drawFigure
	].
]
