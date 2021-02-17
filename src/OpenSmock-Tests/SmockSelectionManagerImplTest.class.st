"
A SmockSelectionManagerImplTest is a test class for testing the behavior of SmockSelectionManagerImpl
"
Class {
	#name : #SmockSelectionManagerImplTest,
	#superclass : #TestCase,
	#instVars : [
		'selectionManager'
	],
	#category : #'OpenSmock-Tests-SelectionManager'
}

{ #category : #tests }
SmockSelectionManagerImplTest >> selectionManager [
	selectionManager ifNil:[selectionManager := MolUtils startComponent: SmockSelectionManagerImpl].
	^selectionManager
]

{ #category : #tests }
SmockSelectionManagerImplTest >> setUp [
	super setUp.
	MolComponentManager cleanUp.
]

{ #category : #tests }
SmockSelectionManagerImplTest >> tearDown [
	selectionManager := nil.
	MolComponentManager cleanUp.
	super tearDown.
]

{ #category : #test }
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

{ #category : #test }
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

{ #category : #test }
SmockSelectionManagerImplTest >> testClearSelection [
	self selectionManager clearSelection.
	self assert: self selectionManager getSelectedKeys isEmpty.
]

{ #category : #test }
SmockSelectionManagerImplTest >> testGetFirstSelectedKey [
	self assert: self selectionManager getFirstSelectedKey equals: nil.
	self selectionManager setSelectedKeys: #(2 5).
	self assert: self selectionManager getFirstSelectedKey equals: 2.
]

{ #category : #test }
SmockSelectionManagerImplTest >> testGetLastSelectedKey [
	self assert: self selectionManager getLastSelectedKey equals: nil.
	self selectionManager setSelectedKeys: #(2 5).
	self assert: self selectionManager getLastSelectedKey equals: 5.
]

{ #category : #test }
SmockSelectionManagerImplTest >> testGetSelectedKeys [
	self assert: self selectionManager getSelectedKeys isEmpty.
	self selectionManager setSelectedKeys: #(2 5).
	self assert: self selectionManager getSelectedKeys size equals: 2.
	self assert: (self selectionManager getSelectedKeys includesAll: #(2 5)).
]

{ #category : #test }
SmockSelectionManagerImplTest >> testGetSelectedKeysNb [
	self assert: self selectionManager getSelectedKeysNb equals: 0.
	self selectionManager setSelectedKeys: #(2 5).
	self assert: self selectionManager getSelectedKeysNb equals: 2.
]

{ #category : #test }
SmockSelectionManagerImplTest >> testHaveSelection [
	self assert: self selectionManager haveSelection equals: false.
	self selectionManager setSelectedKey: 2.
	self assert: self selectionManager haveSelection equals: true.
]

{ #category : #'test - cases' }
SmockSelectionManagerImplTest >> testInitialize [
	self assert: self selectionManager haveSelection equals: false. 
	self assert: self selectionManager getSelectedKeys isEmpty.
	self assert: self selectionManager getFirstSelectedKey equals: nil.
	self assert: self selectionManager getLastSelectedKey equals: nil.
	self assert: self selectionManager getSelectedKeysNb equals: 0.
]

{ #category : #test }
SmockSelectionManagerImplTest >> testIsKeySelected [
	self assert: (self selectionManager isKeySelected: 2) equals: false. 
	self selectionManager setSelectedKey: 2.
	self assert: (self selectionManager isKeySelected: 2) equals: true.
]

{ #category : #test }
SmockSelectionManagerImplTest >> testRemoveSelectedKey [
	self selectionManager removeSelectedKey: 2.
	self selectionManager removeSelectedKey: nil.
	self selectionManager setSelectedKey: 2.
	self selectionManager removeSelectedKey: 2.
	self assert: self selectionManager getSelectedKeys isEmpty.
]

{ #category : #test }
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

{ #category : #test }
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

{ #category : #test }
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

{ #category : #'test - cases' }
SmockSelectionManagerImplTest >> testStartAndStopComponent [ 
	MolUtils startComponent: SmockSelectionManagerImpl. 
	MolUtils stopComponent: SmockSelectionManagerImpl.
]

{ #category : #test }
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
