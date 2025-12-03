Extension { #name : #SmockGCompositeShape2D }

{ #category : #'*OpenSmock-Alexandrie' }
SmockGCompositeShape2D >> aeDrawOnContent: anAeCanvas [

	super aeDrawOnContent: anAeCanvas.
	
	self basicAeDrawOn: anAeCanvas
]

{ #category : #'*OpenSmock-Alexandrie' }
SmockGCompositeShape2D >> basicAeDrawOn: anAeCanvas [

	super basicAeDrawOn: anAeCanvas.

	self gShapeList do: [ :child |
			anAeCanvas restoreContextAfter: [
					self position ifNotNil: [ :e |
						child isTranslatedByParent ifTrue: [ anAeCanvas pathTranslate: e ] ].
					child aeDrawOn: anAeCanvas ] ]
]
