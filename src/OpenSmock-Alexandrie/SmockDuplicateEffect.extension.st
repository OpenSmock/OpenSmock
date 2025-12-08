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
SmockDuplicateEffect >> aeDrawOn: anAeCanvas for: aGLeafShape2D [ 
	"Draw the effect for a GLeafShape2D"
	
	| originalFillStyle originalStrokeStyle |
	originalFillStyle := aGLeafShape2D fillStyle.
	originalStrokeStyle := aGLeafShape2D strokeStyle.
	
	aGLeafShape2D fillStyle: self fillStyle.
	aGLeafShape2D strokeStyle: self strokeStyle.
	
	aGLeafShape2D aeDrawOnContent: anAeCanvas.
	
	aGLeafShape2D fillStyle: originalFillStyle.
	aGLeafShape2D strokeStyle: originalStrokeStyle.
]
