Trait {
	#name : #TSmockLayeredView,
	#instVars : [
		'viewInfos',
		'layers',
		'layerListMutex'
	],
	#category : #'OpenSmock-Model'
}

{ #category : #layers }
TSmockLayeredView >> addLayer: aLayer [

	self addLayer: aLayer afterIndex: nil
]

{ #category : #layers }
TSmockLayeredView >> addLayer: aLayer afterIndex: anIndex [
	
	self flag:'todo'
]

{ #category : #layers }
TSmockLayeredView >> addLayer: aLayer beforeIndex: anIndex [
	"Add a layer to a specific index. Littles indexes are displayed before highest indexes"

	self addLayer: aLayer afterIndex: (anIndex - 1)
]

{ #category : #layers }
TSmockLayeredView >> addLayerAtFirst: aLayer [

	self addLayer: aLayer afterIndex: 0
]

{ #category : #layers }
TSmockLayeredView >> addLayerAtLast: aLayer [

	self addLayer: aLayer
]

{ #category : #private }
TSmockLayeredView >> createViewInfos [

	^ SmockViewInfos new
]

{ #category : #layers }
TSmockLayeredView >> getLayer: aKey [

	| layer |
	layer := self getLayers
		         detect: [ :l | l name = aKey ]
		         ifNone: [ nil ].
	^ layer 
]

{ #category : #layers }
TSmockLayeredView >> getLayers [

	self flag:'use mutex to return layers'.
	^ self layers
]

{ #category : #layers }
TSmockLayeredView >> hasLayer [

	^ self layers notEmpty
]

{ #category : #initialization }
TSmockLayeredView >> initializeViewInfos [

	self viewInfos: self createViewInfos
]

{ #category : #'private - layers' }
TSmockLayeredView >> layerListMutex [

	layerListMutex ifNil: [
		layerListMutex := Semaphore forMutualExclusion ].
	^ layerListMutex
]

{ #category : #'private - layers' }
TSmockLayeredView >> layers [

	^ layers ifNil: [ layers := OrderedCollection new ]
]

{ #category : #layers }
TSmockLayeredView >> removeAllLayers [

	| list |
	list := self getLayers.
	list copy do: [ :l | self removeLayer: l ].
	^ list 
]

{ #category : #layers }
TSmockLayeredView >> removeLayer: aLayer [
	
	self flag:'todo'.
]

{ #category : #private }
TSmockLayeredView >> updateModel: aViewUpdateChanges [

	self subclassResponsibility 
]

{ #category : #private }
TSmockLayeredView >> updateViewInfos [

	self explicitRequirement
]

{ #category : #'view infos' }
TSmockLayeredView >> viewInfos [

	viewInfos ifNil: [ self initializeViewInfos ].
	^ viewInfos
]

{ #category : #'view infos' }
TSmockLayeredView >> viewInfos: aViewInfos [

	aViewInfos ifNil: [ ^ self ].
	viewInfos := aViewInfos.
	self updateViewInfos.
	self getLayers do: [ :l | l viewInfos: viewInfos ].
	self updateModel: SmockProjectionChanges new
]
