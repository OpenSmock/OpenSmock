"
I'm a graphic layer used to display datas (i.e. GShapes) in a view
"
Class {
	#name : #SmockAbstractDomainLayer,
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
SmockAbstractDomainLayer class >> isAbstract [ 

	^ self == SmockAbstractDomainLayer 
]

{ #category : #private }
SmockAbstractDomainLayer >> addedToScene: anObject [
	"call when the layer is viewable in a graphical stack (i.e. added to a scene graph)"
	
	"override me to implement behavior"
]

{ #category : #private }
SmockAbstractDomainLayer >> announce: anAnnouncement [
	"Notify an announcement"

	anAnnouncement layer: self.
	anAnnouncement layerName: self name.
	self announcer announce: anAnnouncement
]

{ #category : #accessing }
SmockAbstractDomainLayer >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #picking }
SmockAbstractDomainLayer >> defaultIsPickable [

	^ false
]

{ #category : #testing }
SmockAbstractDomainLayer >> haveDomainObjects [

	^ false
]

{ #category : #testing }
SmockAbstractDomainLayer >> haveGraphicModel [

	^ false
]

{ #category : #accessing }
SmockAbstractDomainLayer >> isVisible [

	^ isVisible ifNil: [ isVisible := true ]
]

{ #category : #accessing }
SmockAbstractDomainLayer >> isVisible: aBoolean [

	isVisible ~= aBoolean ifFalse: [ ^ self ].
	isVisible := aBoolean.
	self sendRepaintRequest.
	
	isVisible ifFalse: [ ^ self ].
	self updateModel: SmockBeVisibleChanges new
]

{ #category : #accessing }
SmockAbstractDomainLayer >> level [

	^ level ifNil: [ level := 0 ]
]

{ #category : #accessing }
SmockAbstractDomainLayer >> level: anObject [

	level := anObject
]

{ #category : #accessing }
SmockAbstractDomainLayer >> name [

	^ name
]

{ #category : #accessing }
SmockAbstractDomainLayer >> name: anObject [

	name := anObject
]

{ #category : #private }
SmockAbstractDomainLayer >> removedFromScene: anObject [
	"call when the layer is unviewable in a graphical stack (i.e. remove from a scene graph)"
	
	"override me to implement behavior"
]

{ #category : #announcing }
SmockAbstractDomainLayer >> sendRepaintRequest [
	"Notify that the layer need to be repaint, use it if the layer manage internal changes of his own graphical model"

	self announce: SmockLayerRepaintRequest new
]

{ #category : #accessing }
SmockAbstractDomainLayer >> symbologyProvider [

	self explicitRequirement
]

{ #category : #accessing }
SmockAbstractDomainLayer >> symbologyProvider: aSymbologyProvider [

	self explicitRequirement
]

{ #category : #'private - updating' }
SmockAbstractDomainLayer >> updateModel: aViewUpdateChanges [

	"do nothing"
]

{ #category : #accessing }
SmockAbstractDomainLayer >> viewInfos [
	
	self explicitRequirement
]

{ #category : #accessing }
SmockAbstractDomainLayer >> viewInfos: aViewInfos [

	self explicitRequirement
]
