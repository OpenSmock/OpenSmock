Extension { #name : #SmockPaintStyle }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockPaintStyle >> setStyleInAeCanvas: aeCanvas forGShape: aGLeafShape [

	self paint ifNil: [ ^ self ].
	self paint setStyleInAeCanvas: aeCanvas forGShape: aGLeafShape
]
