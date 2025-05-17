Trait {
	#name : #SmockSelectionManagerClientTest,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'OpenSmock-Components-Tests'
}

{ #category : #'accessing - events' }
SmockSelectionManagerClientTest classSide >> consumedComponentEvents [

	<componentContract>
	^ { SmockSelectionManagerEvents }
]

{ #category : #'accessing - services' }
SmockSelectionManagerClientTest classSide >> usedComponentServices [

	<componentContract>
	^ { SmockSelectionManagerServices }
]
