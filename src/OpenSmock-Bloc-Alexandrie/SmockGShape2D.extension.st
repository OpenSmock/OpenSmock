Extension { #name : #SmockGShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> aeDrawEffectAboveOn: anAeCanvas [

	self effect aeDrawAboveGShape2D: self on: anAeCanvas
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> aeDrawEffectBelowOn: anAeCanvas [

	self effect aeDrawBelowGShape2D: self on: anAeCanvas
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> aeDrawOn: anAeCanvas [

	| isDrawnEffect |
	self isDrawable ifFalse: [ ^ self ].
	isDrawnEffect := self hasEffect and: [ self effect canBeAppliedTo: self ].

	self prepareAeContext: anAeCanvas.

	isDrawnEffect ifTrue: [ self aeDrawEffectBelowOn: anAeCanvas ].
	self aeDrawOnContent: anAeCanvas.
	isDrawnEffect ifTrue: [ self aeDrawEffectAboveOn: anAeCanvas ]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> aeDrawOnContent: anAeCanvas [
	"do nothing"

	
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> basicAeDrawOn: anAeCanvas [
	"do nothing"
	
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> prepareAeContext: anAeCanvas [
	"do nothing"
]
