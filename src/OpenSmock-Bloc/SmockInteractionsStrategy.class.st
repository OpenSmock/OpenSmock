Class {
	#name : #SmockInteractionsStrategy,
	#superclass : #BlEventListener,
	#instVars : [
		'target',
		'allowSelection',
		'allowRectangleSelection',
		'pickingRadius',
		'selectionFilterBlock',
		'mouseDownPosition',
		'lastMouseMoveEventTimestamp',
		'allowMultipleSelection'
	],
	#category : #'OpenSmock-Bloc-Events'
}

{ #category : #accessing }
SmockInteractionsStrategy class >> defaultPickingRadius [

	^ 5
]

{ #category : #testing }
SmockInteractionsStrategy class >> isAbstract [ 

	^ self == SmockInteractionsStrategy 
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> allowMultipleSelection [

	^ allowMultipleSelection ifNil:[ allowMultipleSelection := true ]
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> allowMultipleSelection: aBoolean [

	allowMultipleSelection := aBoolean
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> allowRectangleSelection [

	^ allowRectangleSelection ifNil:[ allowRectangleSelection := true ]
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> allowRectangleSelection: aBoolean [

	allowRectangleSelection := aBoolean
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> allowSelection [

	^ allowSelection ifNil:[ allowSelection := true ]
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> allowSelection: anObject [

	allowSelection := anObject
]

{ #category : #'mouse handlers' }
SmockInteractionsStrategy >> clickEvent: anEvent [

	anEvent
		ifPrimary: [ self primaryClickEvent: anEvent ]
		secondary: [ self secondaryClickEvent: anEvent ]
		middle: [ self middleClickEvent: anEvent ]
		other: [ self otherClickEvent: anEvent ]
]

{ #category : #picking }
SmockInteractionsStrategy >> filterPickingResult: aPickingResult from: anEvent [

	| pickingResult |
	pickingResult := self selectionFilterBlock 
		ifNotNil:[ aPickingResult applyFilter: self selectionFilterBlock] 
		ifNil:[ aPickingResult ].
	
	^ pickingResult
]

{ #category : #selection }
SmockInteractionsStrategy >> isMultipleSelectionPicking: aPickingResult from: anEvent [

	| isMultipleSelectionPicking |
	isMultipleSelectionPicking := false.
	
	aPickingResult isPointPicking 
		ifTrue:[ isMultipleSelectionPicking := ((self isPointPickingSelectionAccumulation: anEvent) and:[ self allowMultipleSelection ]) ] 
		ifFalse:[ aPickingResult isShapePicking ifTrue:[ isMultipleSelectionPicking := self allowMultipleSelection ] ].
		
	^ isMultipleSelectionPicking
]

{ #category : #selection }
SmockInteractionsStrategy >> isPointPickingSelectionAccumulation: anEvent [

	^ anEvent modifiers isCtrl
]

{ #category : #selection }
SmockInteractionsStrategy >> isShapePickingSelectionAccumulation: anEvent [

	^ self isPointPickingSelectionAccumulation: anEvent
]

{ #category : #'mouse handlers' }
SmockInteractionsStrategy >> middleClickEvent: anEvent [

	
]

{ #category : #accessing }
SmockInteractionsStrategy >> mouseDownPosition [

	^ mouseDownPosition
]

{ #category : #accessing }
SmockInteractionsStrategy >> mouseDownPosition: anObject [

	mouseDownPosition := anObject
]

{ #category : #'mouse handlers' }
SmockInteractionsStrategy >> otherClickEvent: anEvent [

	
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> pickingRadius [
	"Setup radius to pick from a Point. Consider this radius as a device coordinates (i.e. pixels)"

	^ pickingRadius ifNil: [ pickingRadius := self class defaultPickingRadius ]
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> pickingRadius: aNumber [

	pickingRadius := aNumber
]

{ #category : #'mouse handlers' }
SmockInteractionsStrategy >> primaryClickEvent: anEvent [

	
]

{ #category : #selection }
SmockInteractionsStrategy >> processMonoSelection: aPickingResult from: anEvent [
	
	| event |
	aPickingResult isEmpty
		ifTrue: [ 
			"When no objects are under the mouse, clear the selection by default" 
			event := SmockObjectSelectionCleared new. ]
		ifFalse: [
			event := SmockObjectSelectionChanged new.
			"When a minimum of 1 object is picked select only the first object"
			event objectIndexesList: (OrderedCollection with: aPickingResult firstElement objectIndex) ].
		
	self target dispatchEvent: event
]

{ #category : #selection }
SmockInteractionsStrategy >> processMultipleSelection: aPickingResult from: anEvent [
	| event alreadySelected notSelected |

	aPickingResult isEmpty ifTrue:[ "nothing here : stay the selection" ^ self ].
	alreadySelected := OrderedCollection new.
	notSelected := OrderedCollection new.
	"search already selected or not"
	aPickingResult results do:[ :e | e dShape isSelected ifTrue:[ alreadySelected add: e objectIndex ] ifFalse:[ notSelected add: e objectIndex ] ].
	
	aPickingResult isPointPicking ifTrue:[
		"Considere point picking: remove already selected objects and add new ones"
		notSelected ifNotEmpty: [ 
			event := SmockObjectSelectionAdded new.
			event objectIndexesList: notSelected.
			self target dispatchEvent: event
		].

		alreadySelected ifNotEmpty: [ 
			event := SmockObjectSelectionRemoved new.
			event objectIndexesList: alreadySelected.
			self target dispatchEvent: event
		].	
	] ifFalse:[
	
		"Considere shape picking (rectangle, circle, etc.)"
		aPickingResult isShapePicking ifTrue:[
			
			(self isShapePickingSelectionAccumulation: anEvent) ifFalse:[
				"On accumulation mode: add no selected objects always and ignore already selected"
				"On standard mode: reset previous selection and add new one only"
				event := SmockObjectSelectionCleared new. 
				self target dispatchEvent: event
			].
			
			event := SmockObjectSelectionAdded new.
			event objectIndexesList: aPickingResult getObjectIndexes.
			self target dispatchEvent: event
		]
	]
]

{ #category : #selection }
SmockInteractionsStrategy >> processSelectionInPickingResult: aPickingResult from: anEvent [
	"Process a picking result"

	"send picking event"
	| pickingResult isMultipleSelectionPicking |
	
	"filter"
	pickingResult := self filterPickingResult: aPickingResult from: anEvent.
	self sendPickingEvent: aPickingResult.
	
	"process selection from picking depending multiple selection or not"
	isMultipleSelectionPicking := self isMultipleSelectionPicking: aPickingResult from: anEvent.
	
	isMultipleSelectionPicking 
		ifTrue:[self processMultipleSelection: aPickingResult from: anEvent] 
		ifFalse:[self processMonoSelection: aPickingResult from: anEvent].
	
	^ pickingResult
]

{ #category : #accessing }
SmockInteractionsStrategy >> pulseDuration [
	"BlHostPulseLoop>>defaultPulsePeriod"

	^ 15 milliSecond
]

{ #category : #'mouse handlers' }
SmockInteractionsStrategy >> secondaryClickEvent: anEvent [

	
]

{ #category : #selection }
SmockInteractionsStrategy >> selectOnClick: anEvent [
	
	| point pickingResult |
	
	point := anEvent position.
	pickingResult := self target pickAt: point distance: self pickingRadius.

	self processSelectionInPickingResult: pickingResult from: anEvent
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> selectionFilterBlock [

	^ selectionFilterBlock
]

{ #category : #'API -- configuration' }
SmockInteractionsStrategy >> selectionFilterBlock: aSelectFilterBlock [

	selectionFilterBlock := aSelectFilterBlock 
]

{ #category : #picking }
SmockInteractionsStrategy >> sendPickingEvent: aPickingResult [
	
	"send picking event"
	| event |
	event := SmockPickingEvent new.
	event pickingResult: aPickingResult.
	self target dispatchEvent: event
]

{ #category : #accessing }
SmockInteractionsStrategy >> target [

	^ target
]

{ #category : #accessing }
SmockInteractionsStrategy >> target: anObject [

	target := anObject
]
