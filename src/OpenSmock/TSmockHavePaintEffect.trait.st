Trait {
	#name : #TSmockHavePaintEffect,
	#instVars : [
		'effect'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'paint effect' }
TSmockHavePaintEffect >> effect [

	^ effect
]

{ #category : #'paint effect' }
TSmockHavePaintEffect >> effect: aPaintEffect [

	effect := aPaintEffect
]

{ #category : #'paint effect' }
TSmockHavePaintEffect >> hasEffect [

	^ self effect notNil
]
