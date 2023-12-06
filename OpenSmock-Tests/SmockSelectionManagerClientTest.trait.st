Trait {
	#name : #SmockSelectionManagerClientTest,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'OpenSmock-Tests-Cases - SelectionManager'
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
