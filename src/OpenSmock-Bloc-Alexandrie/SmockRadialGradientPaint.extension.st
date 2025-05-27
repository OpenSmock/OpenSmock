Extension { #name : #SmockRadialGradientPaint }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockRadialGradientPaint >> setStyleInAeCanvas: aeCanvas forGShape: aGLeafShape [

	aGLeafShape setGradientRadialPaint: self inAeCanvas: aeCanvas
]
