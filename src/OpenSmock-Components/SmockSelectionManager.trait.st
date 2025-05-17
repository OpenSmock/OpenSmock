Trait {
	#name : #SmockSelectionManager,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'OpenSmock-Components-SelectionManager'
}

{ #category : #'accessing - events' }
SmockSelectionManager classSide >> producedComponentEvents [
	<componentContract>
	^ {SmockSelectionManagerEvents} 
]

{ #category : #'accessing - parameters' }
SmockSelectionManager classSide >> providedComponentParameters [
	<componentContract>
	^ { SmockSelectionManagerParameters } 
]

{ #category : #'accessing - services' }
SmockSelectionManager classSide >> providedComponentServices [
	<componentContract>
	^ {SmockSelectionManagerServices}
]
