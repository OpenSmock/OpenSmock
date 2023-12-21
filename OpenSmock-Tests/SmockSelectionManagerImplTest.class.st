"
A SmockSelectionManagerImplTest is a test class for testing the behavior of SmockSelectionManagerImpl
"
Class {
	#name : #SmockSelectionManagerImplTest,
	#superclass : #TestCase,
	#instVars : [
		'selectionManager',
		'client'
	],
	#category : #'OpenSmock-Tests-Cases - SelectionManager'
}

{ #category : #accessing }
SmockSelectionManagerImplTest >> client [

	^ client ifNil: [ client := SmockSelectionManagerClientTestImpl start ]
]

{ #category : #accessing }
SmockSelectionManagerImplTest >> selectionManager [

	^ selectionManager ifNil: [ selectionManager := SmockSelectionManagerImpl start ]
]

{ #category : #running }
SmockSelectionManagerImplTest >> setUp [

	super setUp.
	MolComponentManager cleanUp
]

{ #category : #running }
SmockSelectionManagerImplTest >> tearDown [

	selectionManager := nil.
	client := nil.
	MolComponentManager cleanUp.
	super tearDown
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testAddSelectedKey [
	self selectionManager addSelectedKey: nil.
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager addSelectedKey: 2.
	self assert: self selectionManager getSelectedKeys first equals: 2. 
	self selectionManager addSelectedKey: 2.
	self assert: self selectionManager getSelectedKeys size equals: 1. 
	self selectionManager addSelectedKey: 5.
	self assert: (self selectionManager getSelectedKeys includes: 2).
	self assert: (self selectionManager getSelectedKeys includes: 5).  
	self assert: self selectionManager getSelectedKeys size equals: 2. 	
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testAddSelectedKeys [
	self selectionManager addSelectedKeys: nil.
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager addSelectedKeys: 2.
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager addSelectedKeys: #(2 5).
	self assert: self selectionManager getSelectedKeys size equals: 2. 
	self assert: (self selectionManager getSelectedKeys includes: 2).
	self assert: (self selectionManager getSelectedKeys includes: 5). 
	self selectionManager addSelectedKeys: #(2 6).
	self assert: self selectionManager getSelectedKeys size equals: 3. 
	self assert: (self selectionManager getSelectedKeys includes: 2).
	self assert: (self selectionManager getSelectedKeys includes: 5). 
	self assert: (self selectionManager getSelectedKeys includes: 6).
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testClearSelection [
	self selectionManager clearSelection.
	self assert: self selectionManager getSelectedKeys isEmpty.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testEvents [
	"test if the client receive selection manager events"
	self client getSmockSelectionManagerEventsSubscriber subscribe: self client.
	self assert: self client selection isNil.
	
	self selectionManager addSelectedKey: 2.
	self assert: (self client selection isKindOf: SmockSelection).
	self assert: (self client selection nbKeys) equals: 1.
	self assert: self client selection keys first equals: 2.
	self assert: self client selection origin equals: #default.
	
	self selectionManager setSelectedKey: 5.
	self assert: (self client selection isKindOf: SmockSelection).
	self assert: (self client selection nbKeys) equals: 1.
	self assert: self client selection keys first equals: 5.
	self assert: self client selection origin equals: #default.
	
	self selectionManager clearSelection.
	self assert: self client selection isNil.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testGetFirstSelectedKey [
	self assert: self selectionManager getFirstSelectedKey equals: nil.
	self selectionManager setSelectedKeys: #(2 5).
	self assert: self selectionManager getFirstSelectedKey equals: 2.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testGetLastSelectedKey [
	self assert: self selectionManager getLastSelectedKey equals: nil.
	self selectionManager setSelectedKeys: #(2 5).
	self assert: self selectionManager getLastSelectedKey equals: 5.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testGetSelectedKeys [
	self assert: self selectionManager getSelectedKeys isEmpty.
	self selectionManager setSelectedKeys: #(2 5).
	self assert: self selectionManager getSelectedKeys size equals: 2.
	self assert: (self selectionManager getSelectedKeys includesAll: #(2 5)).
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testGetSelectedKeysNb [
	self assert: self selectionManager getSelectedKeysNb equals: 0.
	self selectionManager setSelectedKeys: #(2 5).
	self assert: self selectionManager getSelectedKeysNb equals: 2.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testGetSelection [

	| selection |
	selection := self selectionManager getSelection.
	self assert: selection isEmpty.
	
	self selectionManager setSelectedKeys: #(2 5).
	selection := self selectionManager getSelection.
	self deny: selection isEmpty.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testHaveSelection [
	self assert: self selectionManager haveSelection equals: false.
	self selectionManager setSelectedKey: 2.
	self assert: self selectionManager haveSelection equals: true.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testInitialize [

	self assert: self selectionManager haveSelection equals: false. 
	self assert: self selectionManager getSelectedKeys isEmpty.
	self assert: self selectionManager getFirstSelectedKey equals: nil.
	self assert: self selectionManager getLastSelectedKey equals: nil.
	self assert: self selectionManager getSelectedKeysNb equals: 0.
	self assert: self selectionManager getCapacity equals: 10000.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testIsKeySelected [
	self assert: (self selectionManager isKeySelected: 2) equals: false. 
	self selectionManager setSelectedKey: 2.
	self assert: (self selectionManager isKeySelected: 2) equals: true.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testRemoveSelectedKey [
	self selectionManager removeSelectedKey: 2.
	self selectionManager removeSelectedKey: nil.
	self selectionManager setSelectedKey: 2.
	self selectionManager removeSelectedKey: 2.
	self assert: self selectionManager getSelectedKeys isEmpty.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testRemoveSelectedKeys [
	self selectionManager removeSelectedKeys: nil.
	self selectionManager removeSelectedKeys: 2.
	self selectionManager removeSelectedKeys: #(2 5).
	self selectionManager addSelectedKeys: #(2 5).
	self selectionManager removeSelectedKeys: #(2 5).
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager addSelectedKeys: 2.
	self selectionManager removeSelectedKeys: #(2).
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager addSelectedKeys: #(2 6).
	self selectionManager removeSelectedKeys: #(3 7 8).
	self assert: self selectionManager getSelectedKeys size equals: 2. 
	self assert: (self selectionManager getSelectedKeys includes: 2).
	self assert: (self selectionManager getSelectedKeys includes: 6).
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testSetSelectedKey [
	self selectionManager setSelectedKey: nil.
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager setSelectedKey: 2.
	self assert: self selectionManager getSelectedKeys size equals: 1.
	self assert: self selectionManager getSelectedKeys first equals: 2.  
	self selectionManager setSelectedKey: 5.
	self assert: self selectionManager getSelectedKeys size equals: 1.
	self assert: self selectionManager getSelectedKeys first equals: 5.  
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testSetSelectedKeys [
	self selectionManager setSelectedKeys: nil.
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager setSelectedKeys: 2.
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager setSelectedKeys: OrderedCollection new.
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager setSelectedKeys: (OrderedCollection with: 2 with: 5).
	self assert: self selectionManager getSelectedKeys size equals: 2.
	self assert: (self selectionManager getSelectedKeys includes: 2).
	self assert: (self selectionManager getSelectedKeys includes: 5).
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testStartAndStopComponent [ 
	MolUtils startComponent: SmockSelectionManagerImpl. 
	MolUtils stopComponent: SmockSelectionManagerImpl.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> testXorSelectedKeys [
	self selectionManager xorSelectedKeys: nil.
	self assert: self selectionManager getSelectedKeys isEmpty. 
	self selectionManager xorSelectedKeys: #(2).
	self assert: self selectionManager getSelectedKeys size equals: 1. 
	self assert: self selectionManager getSelectedKeys first equals: 2. 
	self selectionManager xorSelectedKeys: #(2 5).
	self assert: self selectionManager getSelectedKeys size equals: 1. 
	self assert: self selectionManager getSelectedKeys first equals: 5. 
	self selectionManager xorSelectedKeys: #(3 6 7).
	self assert: self selectionManager getSelectedKeys size equals: 4. 
	self assert: (self selectionManager getSelectedKeys includes: 5).
	self assert: (self selectionManager getSelectedKeys includes: 3).
	self assert: (self selectionManager getSelectedKeys includes: 6). 
	self assert: (self selectionManager getSelectedKeys includes: 7).
]
