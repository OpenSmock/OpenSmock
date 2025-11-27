Extension { #name : #SmockDuplicateEffect }

{ #category : #'*OpenSmock-Alexandrie' }
SmockDuplicateEffect >> aeDrawAboveGShape2D: aGShape2D on: anAeCanvas [
	"Draw the effect on top of a GShape2D"

	self isAbove ifFalse: [ ^ self ].

	self aeDrawOn: anAeCanvas for: aGShape2D
]

{ #category : #'*OpenSmock-Alexandrie' }
SmockDuplicateEffect >> aeDrawBelowGShape2D: aGShape2D on: anAeCanvas [
	"Draw the effect behind a GShape2D"

	self isBelow ifFalse: [ ^ self ].

	self aeDrawOn: anAeCanvas for: aGShape2D
]

{ #category : #'*OpenSmock-Alexandrie' }
SmockDuplicateEffect >> aeDrawOn: anAeCanvas for: aGShape2D [ 
	"Draw the effect for a GShape2D"
	
	| originalFillStyle originalStrokeStyle |
	originalFillStyle := aGShape2D fillStyle.
	originalStrokeStyle := aGShape2D strokeStyle.
	
	aGShape2D fillStyle: self fillStyle.
	aGShape2D strokeStyle: self strokeStyle.
	
	anAeCanvas restoreContextAfter: [ aGShape2D basicAeDrawOn: anAeCanvas ].
	
	aGShape2D fillStyle: originalFillStyle.
	aGShape2D strokeStyle: originalStrokeStyle.
]
