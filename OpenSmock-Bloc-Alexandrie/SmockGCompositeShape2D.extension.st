Extension { #name : #SmockGCompositeShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCompositeShape2D >> aeDrawOn: aeCanvas [

	self gShapeList ifNil: [ ^ self ].
	self gShapeList isEmpty ifTrue: [ ^ self ].

	aeCanvas restoreContextAfter: [
	aeCanvas pathTranslate: self position.
	self gShapeList do: [ :child | child aeDrawOn: aeCanvas ]]
]
