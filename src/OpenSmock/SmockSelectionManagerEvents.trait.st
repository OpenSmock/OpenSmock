Trait {
	#name : #SmockSelectionManagerEvents,
	#traits : 'MolComponentEvents',
	#classTraits : 'MolComponentEvents classTrait',
	#category : #'OpenSmock-SelectionManager'
}

{ #category : #'events - selection manager' }
SmockSelectionManagerEvents >> selectedKeysHasChanged: aCollection [
	self deprecated: 'listen selectionHasChanged: event'
]

{ #category : #'events - selection manager' }
SmockSelectionManagerEvents >> selectionCleared [
	self deprecated: 'listen selectionHasChanged: event'
]

{ #category : #'events - selection manager' }
SmockSelectionManagerEvents >> selectionHasChanged: aSmockSelection [
]
