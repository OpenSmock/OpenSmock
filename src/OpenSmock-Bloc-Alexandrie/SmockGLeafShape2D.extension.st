Extension { #name : #SmockGLeafShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> aeDrawOn: aeCanvas [

	self isDrawable ifFalse:[ ^ self ].

	aeCanvas restoreContextAfter: [
		self basicAeDrawOn: aeCanvas.
	]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> injectFillStyleInAeCanvas: aeCanvas [

	self fillStyle ifNil: [
		aeCanvas setBackgroundOff.
		^ self ].

	aeCanvas setBackgroundWith: [
		self fillStyle setStyleInAeCanvas: aeCanvas forGShape: self ]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> injectStrokeStyleInAeCanvas: aeCanvas [

	self strokeStyle ifNil: [
		aeCanvas setBorderOff.
		^ self ].

	aeCanvas setBorderBlock: [
		self strokeStyle setStyleInAeCanvas: aeCanvas forGShape: self.
	].

	self strokeStyle outskirts = #inside
		ifTrue: [ aeCanvas setOutskirtsInside ]
		ifFalse: [
			self strokeStyle outskirts = #outside
				ifTrue: [ aeCanvas setOutskirtsOutside ]
				ifFalse: [ aeCanvas setOutskirtsCentered ] ]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> setGradientRadialPaint: aRadialGradientPaint inAeCanvas: aeCanvas [

	self subclassResponsibility 	

	
]
