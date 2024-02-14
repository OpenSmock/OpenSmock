Extension { #name : #SmockGCompositeShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCompositeShape2D >> aeDrawOn: aeCanvas [

	self isDrawable ifFalse: [ ^ self ].
	
	self gShapeList do: [ :child | 
		aeCanvas restoreContextAfter: [
			child isTranslatedByParent ifTrue:[ aeCanvas pathTranslate: self position ].
			child aeDrawOn: aeCanvas.
		].
	].
]
