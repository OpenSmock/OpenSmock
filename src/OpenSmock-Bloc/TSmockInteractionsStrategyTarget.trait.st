Trait {
	#name : #TSmockInteractionsStrategyTarget,
	#instVars : [
		'interactionsStrategy'
	],
	#category : #'OpenSmock-Bloc-Events'
}

{ #category : #'private - strategy' }
TSmockInteractionsStrategyTarget >> installInteractionsStrategy [
	"hook when interactions strategy is installed"
]

{ #category : #'API -- strategy' }
TSmockInteractionsStrategyTarget >> interactionsStrategy [

	^ interactionsStrategy
]

{ #category : #'private - strategy' }
TSmockInteractionsStrategyTarget >> newInteractionsStrategy [
	"Instanciate interactions strategy"

	^ SmockInteractionsStrategy new
]

{ #category : #'API -- picking' }
TSmockInteractionsStrategyTarget >> pickAt: aGlobalPoint [
	"Return all objects from picking a global point"

	^ self pickAt: aGlobalPoint distance: 0
]

{ #category : #'API -- picking' }
TSmockInteractionsStrategyTarget >> pickAt: aGlobalPoint distance: aDistanceInPixels [
	"Return all objects under a global point inside a radius in pixels"
	
	self explicitRequirement
]

{ #category : #'API -- picking' }
TSmockInteractionsStrategyTarget >> pickInRectangle: aGlobalPointRectangle [
	"Return all objects includes in a rectangle"

	^ self pickInRectangle: aGlobalPointRectangle inclusive: true
]

{ #category : #'API -- picking' }
TSmockInteractionsStrategyTarget >> pickInRectangle: aGlobalPointRectangle inclusive: isInclusive [
	"Return all objects includes and/or which intersects a rectangle"
	
	self explicitRequirement 
]

{ #category : #'API -- strategy' }
TSmockInteractionsStrategyTarget >> removeInteractionsStrategy [

	interactionsStrategy ifNil: [ ^ self ].
	
	self uninstallInteractionsStrategy.
	interactionsStrategy target: nil.
	interactionsStrategy := nil
]

{ #category : #'API -- strategy' }
TSmockInteractionsStrategyTarget >> setInteractionsStrategy: aBlEventListener [

	self removeInteractionsStrategy.
	aBlEventListener ifNil: [ ^ self ].
	
	interactionsStrategy := aBlEventListener.
	interactionsStrategy target: self.
	self installInteractionsStrategy.
]

{ #category : #'private - strategy' }
TSmockInteractionsStrategyTarget >> uninstallInteractionsStrategy [
	"hook when interactions strategy is uninstalled"
	
]
