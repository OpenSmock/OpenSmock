Trait {
	#name : #SmockSelectionManager,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'OpenSmock-SelectionManager'
}

{ #category : #'accessing - events' }
SmockSelectionManager classSide >> producedComponentEvents [
	<componentContract>
	^ {SmockSelectionManagerEvents} 
]

{ #category : #'accessing - services' }
SmockSelectionManager classSide >> providedComponentServices [
	<componentContract>
	^ {SmockSelectionManagerServices}
]
