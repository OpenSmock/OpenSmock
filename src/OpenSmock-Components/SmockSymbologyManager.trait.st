Trait {
	#name : #SmockSymbologyManager,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'OpenSmock-Components-SymbologyManager'
}

{ #category : #'accessing - events' }
SmockSymbologyManager classSide >> producedComponentEvents [
<componentContract>		
	^{ SmockSymbologyManagerEvents }
]

{ #category : #'accessing - services' }
SmockSymbologyManager classSide >> providedComponentServices [
<componentContract>	
	^{ SmockSymbologyManagerServices } 
]
