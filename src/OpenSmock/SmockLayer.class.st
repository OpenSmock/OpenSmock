"
I'm a graphic layer used to display datas (i.e. GShapes) in a view
"
Class {
	#name : #SmockLayer,
	#superclass : #Object,
	#traits : 'TSmockHaveProperties + TSmockPickable + TSmockCanPopulatePickingResult',
	#classTraits : 'TSmockHaveProperties classTrait + TSmockPickable classTrait + TSmockCanPopulatePickingResult classTrait',
	#instVars : [
		'isVisible',
		'name',
		'level',
		'announcer'
	],
	#category : #'OpenSmock-Model'
}

{ #category : #testing }
SmockLayer class >> isAbstract [ 

	^ self == SmockLayer 
]

{ #category : #private }
SmockLayer >> addedToScene: anObject [
	"call when the layer is viewable in a graphical stack (i.e. added to a scene graph)"
]

{ #category : #private }
SmockLayer >> announce: anAnnouncement [
	"Notify an announcement"

	anAnnouncement layerName: self name.
	self announcer announce: anAnnouncement
]

{ #category : #accessing }
SmockLayer >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #testing }
SmockLayer >> haveDomainObjects [

	^ false
]

{ #category : #testing }
SmockLayer >> haveGraphicModel [

	^ false
]

{ #category : #picking }
SmockLayer >> isPickableByDefault [

	^ false
]

{ #category : #accessing }
SmockLayer >> isVisible [

	^ isVisible ifNil: [ isVisible := true ]
]

{ #category : #accessing }
SmockLayer >> isVisible: aBoolean [

	isVisible ~= aBoolean ifFalse: [ ^ self ].
	isVisible := aBoolean.
	self sendRepaintRequest.
	
	isVisible ifFalse: [ ^ self ].
	self updateModel: SmockBeVisibleChanges new
]

{ #category : #accessing }
SmockLayer >> level [

	^ level
]

{ #category : #accessing }
SmockLayer >> level: anObject [

	level := anObject
]

{ #category : #accessing }
SmockLayer >> name [

	^ name
]

{ #category : #accessing }
SmockLayer >> name: anObject [

	name := anObject
]

{ #category : #private }
SmockLayer >> removedFromScene: anObject [
	"call when the layer is unviewable in a graphical stack (i.e. remove from a scene graph)"
]

{ #category : #announcing }
SmockLayer >> sendRepaintRequest [
	"Notify that the layer need to be repaint, use it if the layer manage internal changes of his own graphical model"

	self announce: SmockLayerRepaintRequest new
]

{ #category : #accessing }
SmockLayer >> symbologyProvider [

	self explicitRequirement
]

{ #category : #accessing }
SmockLayer >> symbologyProvider: aSymbologyProvider [

	self explicitRequirement
]

{ #category : #'private - updating' }
SmockLayer >> updateModel: aViewUpdateChanges [

	"do nothing"
]

{ #category : #accessing }
SmockLayer >> viewInfos [
	
	self explicitRequirement
]

{ #category : #accessing }
SmockLayer >> viewInfos: aViewInfos [

	self explicitRequirement
]
