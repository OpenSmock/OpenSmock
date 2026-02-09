Class {
	#name : #SmockDomainViewElement,
	#superclass : #BlElement,
	#instVars : [
		'viewInfos',
		'layers',
		'layerListMutex'
	],
	#category : #'OpenSmock-Bloc-Model'
}

{ #category : #layers }
SmockDomainViewElement >> addLayer: aLayer [

	self addLayer: aLayer afterIndex: nil
]

{ #category : #layers }
SmockDomainViewElement >> addLayer: aLayer afterIndex: anIndex [
	"Add a layer to a specific index. Littles indexes are displayed before highest indexes"

	| event level |
	
	self configureLayer: aLayer.
	
	self layerListMutex criticalReleasingOnError:[
		(self layers includes: aLayer) ifTrue:[ ^ self ].

		(anIndex isNil or:[ (anIndex < 0 or:[ anIndex > self layers size ]) ])
			ifTrue: [ self layers add: aLayer. level := self layers size ]
			ifFalse: [ self layers add: aLayer afterIndex: anIndex. level := self layers indexOf: aLayer ].	
				
		aLayer level: level.
	].

	self addLayerToScene: aLayer.

	"Send layer added event"
	event := SmockAddedLayerEvent new.
	event layer: aLayer; layerName: aLayer name.
	self dispatchEvent: event.
	
]

{ #category : #layers }
SmockDomainViewElement >> addLayer: aLayer beforeIndex: anIndex [
	"Add a layer to a specific index. Littles indexes are displayed before highest indexes"

	self addLayer: aLayer afterIndex: (anIndex - 1)
]

{ #category : #layers }
SmockDomainViewElement >> addLayerAtFirst: aLayer [

	self addLayer: aLayer afterIndex: 0
]

{ #category : #layers }
SmockDomainViewElement >> addLayerAtLast: aLayer [

	self addLayer: aLayer
]

{ #category : #'private - layers' }
SmockDomainViewElement >> addLayerToScene: aLayer [

	self isAttachedToSceneGraph ifTrue: [ aLayer addedToScene: self ]
]

{ #category : #'private - layers' }
SmockDomainViewElement >> configureLayer: aLayer [

	aLayer viewInfos: self viewInfos.
	aLayer announcer
		when: SmockLayerRepaintRequest
		send: #layerNeedToBeRepaint:
		to: self
]

{ #category : #private }
SmockDomainViewElement >> createViewInfos [

	^ SmockViewInfos new
]

{ #category : #layers }
SmockDomainViewElement >> getLayer: aName [

	| layer |
	layer := self getLayers
		         detect: [ :l | l name = aName ]
		         ifNone: [ nil ].
	^ layer
]

{ #category : #layers }
SmockDomainViewElement >> getLayers [

	| layerList |
	
	layerList := #().
	
	self layerListMutex criticalReleasingOnError: [
		layerList := self layers copy ].

	^ layerList
]

{ #category : #layers }
SmockDomainViewElement >> hasLayer [

	^ self getLayers notEmpty
]

{ #category : #initialization }
SmockDomainViewElement >> initializeViewInfos [

	self viewInfos: self createViewInfos
]

{ #category : #'private - layers' }
SmockDomainViewElement >> layerListMutex [

	layerListMutex ifNil: [
		layerListMutex := Semaphore forMutualExclusion ].
	
	^ layerListMutex
]

{ #category : #'private - layers' }
SmockDomainViewElement >> layers [

	^ layers ifNil: [ layers := OrderedCollection new ]
]

{ #category : #layers }
SmockDomainViewElement >> removeAllLayers [

	| layerList |
	layerList := self getLayers.
	layerList do: [ :l | self removeLayer: l ].
	^ layerList
]

{ #category : #layers }
SmockDomainViewElement >> removeLayer: aLayer [

	| event |

	self layerListMutex criticalReleasingOnError: [
			(self layers includes: aLayer) ifFalse: [ ^ self ].
			self layers remove: aLayer ].
		
	self unconfigureLayer: aLayer.
	self removeLayerFromScene: aLayer.

	"Send layer added event"
	event := SmockRemovedLayerEvent new.
	event layer: aLayer; layerName: aLayer name.
	self dispatchEvent: event
]

{ #category : #'private - layers' }
SmockDomainViewElement >> removeLayerFromScene: aLayer [

	self isAttachedToSceneGraph ifTrue: [ aLayer removedFromScene: self ]
]

{ #category : #'private - layers' }
SmockDomainViewElement >> unconfigureLayer: aLayer [

	aLayer announcer unsubscribe: self.
	aLayer viewInfos: nil
]

{ #category : #private }
SmockDomainViewElement >> updateModel: aViewUpdateChanges [

	| layerList |
	
	layerList := #().
	
	self layerListMutex criticalReleasingOnError: [
		layerList := self layers copy ].

	layerList do: [ :l | l updateModel: aViewUpdateChanges ]
]

{ #category : #private }
SmockDomainViewElement >> updateViewInfos [

	self viewInfos origin: self position copy.
	self viewInfos extent: self extent copy.
	self viewInfos update
]

{ #category : #'view infos' }
SmockDomainViewElement >> viewInfos [

	viewInfos ifNil: [ self initializeViewInfos ].
	^ viewInfos
]

{ #category : #'view infos' }
SmockDomainViewElement >> viewInfos: aViewInfos [

	aViewInfos ifNil: [ ^ self ].

	viewInfos := aViewInfos.
	self updateViewInfos.

	self getLayers do: [ :l | l viewInfos: viewInfos ].

	self updateModel: SmockProjectionChanges new
]
