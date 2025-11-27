Extension { #name : #SmockGCompositeShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGCompositeShape2D >> aeDrawOn: aeCanvas [

	| drawEffect |
	self isDrawable ifFalse: [ ^ self ].
	drawEffect := self hasEffect and: [ self effect canBeAppliedTo: self ].

	self prepareAeContext: aeCanvas.

	drawEffect ifTrue: [ self aeDrawEffectBelowOn: aeCanvas ].

	self gShapeList do: [ :child |
			aeCanvas restoreContextAfter: [
					self position ifNotNil: [ :e |
						child isTranslatedByParent ifTrue: [ aeCanvas pathTranslate: e ] ].
					child aeDrawOn: aeCanvas ] ].

	drawEffect ifTrue: [ self aeDrawEffectAboveOn: aeCanvas ]
]
