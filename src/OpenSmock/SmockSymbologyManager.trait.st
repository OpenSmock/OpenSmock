Trait {
	#name : #SmockSymbologyManager,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #'OpenSmock-SymbologyManager'
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
