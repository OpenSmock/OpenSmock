Extension { #name : #SmockGCompositeShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCompositeShape2D >> aeDrawOn: aeCanvas [

	self isDrawable ifFalse: [ ^ self ].
	
	self gShapeList do: [ :child | 
		aeCanvas restoreContextAfter: [
			self position ifNotNil: [ :e | child isTranslatedByParent ifTrue:[ aeCanvas pathTranslate: e ] ].
			child aeDrawOn: aeCanvas.
		].
	].
]
