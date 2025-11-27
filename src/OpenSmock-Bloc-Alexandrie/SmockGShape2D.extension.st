Extension { #name : #SmockGShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> aeDrawEffectAboveOn: aeCanvas [

	self effect aeDrawAboveGShape2D: self on: aeCanvas
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> aeDrawEffectBelowOn: aeCanvas [

	self effect aeDrawBelowGShape2D: self on: aeCanvas
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> aeDrawOn: aeCanvas [
	"do nothing"

	
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> basicAeDrawOn: aeCanvas [
	"do nothing"
	
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2D >> prepareAeContext: anAeCanvas [
	"do nothing"
]
