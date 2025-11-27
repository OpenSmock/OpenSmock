Extension { #name : #SmockGLeafShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> aeDrawOn: aeCanvas [

	| drawEffect |
	self isDrawable ifFalse: [ ^ self ].
	drawEffect := self hasEffect and: [ self effect canBeAppliedTo: self ].
	
	self prepareAeContext: aeCanvas.
	
	drawEffect ifTrue: [ self aeDrawEffectBelowOn: aeCanvas ].
	aeCanvas restoreContextAfter: [ self basicAeDrawOn: aeCanvas ].
	drawEffect ifTrue: [ self aeDrawEffectAboveOn: aeCanvas ]
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
		self strokeStyle setStyleInAeCanvas: aeCanvas forGShape: self ].

	self strokeStyle outskirts = #inside
		ifTrue: [ aeCanvas setOutskirtsInside ]
		ifFalse: [
				self strokeStyle outskirts = #outside
					ifTrue: [ aeCanvas setOutskirtsOutside ]
					ifFalse: [ aeCanvas setOutskirtsCentered ] ]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> setGradientRadialPaint: aRadialGradientPaint inAeCanvas: aeCanvas [

	"do nothing, to implement as convenience in subclasses"

	
]
