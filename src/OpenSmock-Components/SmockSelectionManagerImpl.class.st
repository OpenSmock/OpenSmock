Class {
	#name : #SmockSelectionManagerImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'SmockSelectionManager + SmockSelectionManagerServices + SmockSelectionManagerParameters',
	#classTraits : 'SmockSelectionManager classTrait + SmockSelectionManagerServices classTrait + SmockSelectionManagerParameters classTrait',
	#instVars : [
		'mutex',
		'selectedKeys',
		'capacity'
	],
	#category : #'OpenSmock-Components-SelectionManager'
}

{ #category : #'as yet unclassified' }
SmockSelectionManagerImpl class >> defaultSmockSelectionClass [
^SmockSelection
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> addSelectedKey: anObject [
	"Add a single key to the current selection"
	| keys selection |
	anObject ifNil:[^ self].
	self mutex critical: [ | oldSize newSize |
		oldSize := self selectedKeys size.
		self selectedKeys add: anObject.
		newSize := self selectedKeys size.
		"test is the key is already present by the size of the set"
		newSize = oldSize ifTrue:[^ self].
		keys := self selectedKeys copy.
	].
	
	"Send event"
	selection := self getSelection.
	self getSmockSelectionManagerEventsNotifier selectionHasChanged: selection.
	self getSmockSelectionManagerEventsNotifier selectedKeysHasChanged: selection keys.
	
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> addSelectedKeys: aCollection [
	"Add a set of keys to the current selection"
	| keys selection |
	(aCollection isNil or:[aCollection isCollection not]) ifTrue:[^ self].
	aCollection isEmpty ifTrue:[^ self].
	self mutex critical: [| oldSize newSize |
		oldSize := self selectedKeys size.
		self selectedKeys addAll: aCollection.
		newSize := self selectedKeys size.
		"test is the key is already present by the size of the set"
		newSize = oldSize ifTrue:[^ self].
		keys := self selectedKeys copy.
	].
		
	"Send event"
	selection := self getSelection.
	self getSmockSelectionManagerEventsNotifier selectionHasChanged: selection.
	self getSmockSelectionManagerEventsNotifier selectedKeysHasChanged: selection keys.
]

{ #category : #accessing }
SmockSelectionManagerImpl >> capacity [

	^ capacity ifNil:[ capacity := 10000 ]
]

{ #category : #accessing }
SmockSelectionManagerImpl >> capacity: anInteger [

	capacity := anInteger
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> clearSelection [
	| selection |
	self mutex critical: [
		"Test if the selected key list are already empty"
		self selectedKeys isEmpty ifTrue:[^ self].
		self selectedKeys removeAll.
	].
	
	"Send event"
	selection := self getSelection.
	self getSmockSelectionManagerEventsNotifier selectionHasChanged: selection. 
	self getSmockSelectionManagerEventsNotifier selectedKeysHasChanged: selection keys.
	self getSmockSelectionManagerEventsNotifier selectionCleared.
]

{ #category : #'component life cycle' }
SmockSelectionManagerImpl >> componentRemove [

	self mutex: nil.
	self selectedKeys: nil.
	super componentRemove
]

{ #category : #private }
SmockSelectionManagerImpl >> createSelection [

	^ self class defaultSmockSelectionClass new origin: self componentName
]

{ #category : #parameters }
SmockSelectionManagerImpl >> getCapacity [

	^ self capacity
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> getFirstSelectedKey [
	| key |
	self mutex critical: [ 
		self selectedKeys ifNotEmpty:[ :e | key := e asOrderedCollection first]. 
	].
	^key
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> getLastSelectedKey [
	| key |
	self mutex critical: [ 
		self selectedKeys ifNotEmpty:[ :e | key := e asOrderedCollection last]. 
	].
	^key
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> getSelectedKeys [
	| keys |
	self mutex critical: [ keys := self selectedKeys copy ].
	^ keys ifNil:[OrderedCollection new] ifNotNil:[ :e | e asOrderedCollection]
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> getSelectedKeysNb [
	| nb |
	nb := 0.
	self mutex critical: [ nb := self selectedKeys size ].
	^ nb
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> getSelection [

	| selection |
	selection := self createSelection.
	self selectedKeys ifNotEmpty: [ selection setKeys: self selectedKeys copy ].
	^ selection
]

{ #category : #'component accessing' }
SmockSelectionManagerImpl >> getSmockSelectionManagerEventsNotifier [
	^self eventsNotifiers at: SmockSelectionManagerEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: SmockSelectionManagerEvents name: nil].
]

{ #category : #'services - selection manager - test' }
SmockSelectionManagerImpl >> haveSelection [
	| isEmpty |
	self mutex critical: [ isEmpty := self selectedKeys isEmpty ].
	^ isEmpty not
]

{ #category : #'services - selection manager - test' }
SmockSelectionManagerImpl >> isKeySelected: anObject [
	| isIncludesKey |
	anObject ifNil:[^false].
	self mutex critical: [ isIncludesKey := self selectedKeys includes: anObject ].
	^isIncludesKey
]

{ #category : #accessing }
SmockSelectionManagerImpl >> mutex [

	^ mutex ifNil: [ mutex := Monitor new ]
]

{ #category : #accessing }
SmockSelectionManagerImpl >> mutex: anObject [
	mutex := anObject
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> removeSelectedKey: anObject [
	"Remove a single key of the current selection"
	| keys selection |
	anObject ifNil:[^ self].
	self mutex critical: [
		self selectedKeys remove: anObject ifAbsent:[^ self].
		keys := self selectedKeys copy.
	].
	
	"Send event"
	selection := self getSelection.
	self getSmockSelectionManagerEventsNotifier selectionHasChanged: selection.
	self getSmockSelectionManagerEventsNotifier selectedKeysHasChanged: selection keys.
	selection isEmpty ifTrue:[self getSmockSelectionManagerEventsNotifier selectionCleared].
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> removeSelectedKeys: aCollection [
	"Remove a list of keys in the current selection"
	| keys selection |
	(aCollection isNil or:[aCollection isCollection not]) ifTrue:[^ self].
	aCollection isEmpty ifTrue:[^ self].
	self mutex critical: [ | oldSize newSize |
		oldSize := self selectedKeys size.
		oldSize = 0 ifTrue:[^ self].
		aCollection do:[ :e | self selectedKeys remove: e ifAbsent:[nil]].
		newSize := self selectedKeys size.
		"test is the key is already present by the size of the set"
		oldSize = newSize ifTrue:[^ self].
		keys := self selectedKeys copy.
	].
	
	"Send event"
	selection := self getSelection.
	self getSmockSelectionManagerEventsNotifier selectionHasChanged: selection.
	self getSmockSelectionManagerEventsNotifier selectedKeysHasChanged: selection keys.
	selection isEmpty ifTrue:[self getSmockSelectionManagerEventsNotifier selectionCleared].
]

{ #category : #accessing }
SmockSelectionManagerImpl >> selectedKeys [

	^ selectedKeys ifNil: [ selectedKeys := OrderedSet new: self capacity ]
]

{ #category : #accessing }
SmockSelectionManagerImpl >> selectedKeys: anObject [

	selectedKeys := anObject
]

{ #category : #parameters }
SmockSelectionManagerImpl >> setCapacity: anInteger [

	self capacity: anInteger
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> setSelectedKey: anObject [
	"Remove all previous selection and set a single key"
	| keys selection |
	anObject ifNil:[^ self].
	self mutex critical: [
		"test if the key is already present"
		(self selectedKeys size = 1 and:[self selectedKeys asOrderedCollection first = anObject]) ifTrue:[^ self].
		self selectedKeys removeAll.
		self selectedKeys add: anObject.
		keys := self selectedKeys copy.
	].
	
	"Send event"
	selection := self getSelection.
	self getSmockSelectionManagerEventsNotifier selectionHasChanged: selection.
	self getSmockSelectionManagerEventsNotifier selectedKeysHasChanged: selection keys.
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> setSelectedKeys: aCollection [
	"Remove all previous selection and set collection of selected keys"
	| keys selection |
	(aCollection isNil or:[aCollection isCollection not]) ifTrue:[^ self].
	aCollection isEmpty ifTrue:[^ self].
	self mutex critical: [
		"test if the keys are already presents"
		(self selectedKeys size = aCollection size and:[self selectedKeys asOrderedCollection includesAll: aCollection]) ifTrue:[^ self].
		self selectedKeys removeAll.
		self selectedKeys addAll: aCollection.
		keys := self selectedKeys copy.
	].
	
	"Send event"
	selection := self getSelection.
	self getSmockSelectionManagerEventsNotifier selectionHasChanged: selection.
	self getSmockSelectionManagerEventsNotifier selectedKeysHasChanged: selection keys.
]

{ #category : #'services - selection manager' }
SmockSelectionManagerImpl >> xorSelectedKeys: aCollection [
	"Add a set of keys to the current selection"
	| keys selection |
	(aCollection isNil or:[aCollection isCollection not]) ifTrue:[^ self].
	aCollection isEmpty ifTrue:[^ self].
	self mutex critical: [
		keys := self selectedKeys asOrderedCollection.
		aCollection do:[ :e |
			(keys includes: e) ifTrue:[self selectedKeys remove: e] ifFalse:[self selectedKeys add: e].	
		].
		keys := self selectedKeys copy.
	].
	
	"Send event"
	selection := self getSelection.
	self getSmockSelectionManagerEventsNotifier selectionHasChanged: selection.
	self getSmockSelectionManagerEventsNotifier selectedKeysHasChanged: selection keys.
]
