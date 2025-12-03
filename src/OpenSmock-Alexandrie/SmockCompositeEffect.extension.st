Extension { #name : #SmockCompositeEffect }

{ #category : #'*OpenSmock-Alexandrie' }
SmockCompositeEffect >> aeDrawAboveGShape2D: aGShape2D on: anAeCanvas [
	"Draw the effect on top of a GShape2D"

	self effects do: [ :e |
		e aeDrawAboveGShape2D: aGShape2D on: anAeCanvas ]
]

{ #category : #'*OpenSmock-Alexandrie' }
SmockCompositeEffect >> aeDrawBelowGShape2D: aGShape2D on: anAeCanvas [ 
	"Draw the effect behind a GShape2D"
	
	self effects do: [ :e |
		e aeDrawBelowGShape2D: aGShape2D on: anAeCanvas ]
]
