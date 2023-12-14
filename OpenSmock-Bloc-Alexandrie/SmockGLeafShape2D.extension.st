Extension { #name : #SmockGLeafShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> aeDrawOn: aeCanvas [

	self flag:'labordep drawing style here ? '.
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> injectFillStyleIn: aeCanvas [

	aeCanvas setSourceColor: self fillStyle paint
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> injectStrokeStyleIn: aeCanvas [

	aeCanvas setSourceColor: self strokeStyle paint.
	self strokeStyle lineJoin = #round ifTrue: [ aeCanvas setJoinRound ].
	"Le reste est à faire"
	aeCanvas setBorderWidth: self strokeStyle width
]
