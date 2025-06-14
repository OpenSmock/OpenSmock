"
A GFLModelTest is a test class for testing the behavior of GFLModel
"
Class {
	#name : #SmockCUDModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'OpenSmock-Tests-Cases - Model'
}

{ #category : #running }
SmockCUDModelTest >> setUp [

	super setUp.

	model := SmockCUDModel new
]

{ #category : #tests }
SmockCUDModelTest >> testCapacity [

	model capacity: 10.
	self assert: model capacity equals: 10.
	self assert: model datas capacity > 10.
	self assert: model datas capacity < 100.
	self assert: model recycledDatasStack capacity > 10.
	self assert: model recycledDatasStack capacity < 100.
	
	model := SmockCUDModel new.
	model capacity: 100.
	self assert: model capacity equals: 100.
	self assert: model datas capacity > 100.
	self assert: model datas capacity < 1000.
	self assert: model recycledDatasStack capacity > 100.
	self assert: model recycledDatasStack capacity < 1000.
]

{ #category : #tests }
SmockCUDModelTest >> testCreateExistingData [
	| processData data1 gData1 data2 error |

	model indexAccessor: #id.
	model isAutoCreateUnknownUpdatedData: false.
	
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	
	"Create already existing data"
	error := nil.
	data2 := SmockTestUserData id: 1 data: #tata.
	[ gData1 := model created: data2 ] on: Error do:[ :e | error := e ].
	self assert: error class equals: SmockDuplicateIdError.
	self assert: model datas size equals: 1
]

{ #category : #tests }
SmockCUDModelTest >> testCreateUpdateDeleteIndexedDatas [
	| processData data1 gData1 |
	
	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	
	self assert: (model getData: 1) isNil.
	self assert: model processDatas size equals: 1.
	self assert: (model getProcessDataForClass: SmockTestUserData) equals: processData.
	
	"Create"
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	
	self assert: model datas size equals: 1.
	self assert: (model getData: 1) equals: gData1.
	self assert: gData1 equals: #toto. "defined in process data created"
	
	"Update"
	data1 data: #tata.
	gData1 := model updated: data1.
	
	self assert: model datas size equals: 1.
	self assert: (model getData: 1) equals: gData1.
	self assert: gData1 equals: #tata. "defined in process data created"
	
	"Delete"
	model deleted: data1.
	self assert: (model getData: 1) isNil.
	self assert: model datas size equals: 0.
]

{ #category : #tests }
SmockCUDModelTest >> testCreateUpdateDeleteIndexedDatasWithDefaultIndexAccessor [
	| processData data1 gData1 |

	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	
	self assert: model processDatas size equals: 1.
	self assert: (model getProcessDataForClass: SmockTestUserData) equals: processData.
	
	"Create"
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	
	self assert: model datas size equals: 1.
	self assert: gData1 equals: #toto. "defined in process data created"
	
	"Update"
	data1 data: #tata.
	gData1 := model updated: data1.
	
	self assert: model datas size equals: 1.
	self assert: gData1 equals: #tata. "defined in process data created"
	
	"Delete"
	model deleted: data1.
	self assert: model datas size equals: 0.
]

{ #category : #tests }
SmockCUDModelTest >> testCreateUpdateDeleteIndexedDatasWithDefaultProcessData [
	| processData data1 gData1 |
	
	processData := SmockTestProcessData new.
	model setDefaultProcessData: processData.
	
	self assert: model processDatas size equals: 0.
	self assert: (model getProcessDataForClass: SmockTestUserData) equals: processData.
	self assert: (model defaultProcessData) equals: processData.
	
	"Create"
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	
	self assert: model datas size equals: 1.
	self assert: gData1 equals: #toto. "defined in process data created"
	
	"Update"
	data1 data: #tata.
	gData1 := model updated: data1.
	
	self assert: model datas size equals: 1.
	self assert: gData1 equals: #tata. "defined in process data created"
	
	"Delete"
	model deleted: data1.
	self assert: model datas size equals: 0.
]

{ #category : #tests }
SmockCUDModelTest >> testCreated [
	| processData data1 gData1 |
	
	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	
	self assert: model datas size equals: 1.
	self assert: (model getData: 1) equals: gData1.
	self assert: gData1 equals: #toto. "defined in process data created"
]

{ #category : #tests }
SmockCUDModelTest >> testDeleted [
	| processData data1 gData1 |

	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	
	gData1 := model deleted: data1.
	self assert: model datas size equals: 0.
	self assert: gData1 equals: #toto. "defined in process data created"
]

{ #category : #tests }
SmockCUDModelTest >> testDeletedAfterStateChange [
	| processData data1 gData1 |
	
	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	
	"change state"
	model setState: #testState for: 1.
	self assert: (model getStateValue: #testState for: 1) equals: true.
	
	gData1 := model deleted: data1.
	self assert: model datas size equals: 0.
	self assert: gData1 equals: #toto. "defined in process data created"
	self assert: (model getStateValue: #testState for: 1) isNil.
]

{ #category : #tests }
SmockCUDModelTest >> testDeletedWithStates [
	| processData data1 gData1 data2 gData2 |

	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	model setState: #testState for: 1.

	data2 := SmockTestUserData id: 2 data: #tata.
	gData2 := model created: data2.
	
	gData1 := model deleted: data2.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testGetData [

	self assert: (model getData: 1) isNil.
	
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testGetDatas [

	self assert: model getDatas isEmpty.
	
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testGetState [

	self assert: (model getState: #testState) isEmpty.
	
]

{ #category : #tests }
SmockCUDModelTest >> testHaveDataIndex [
	| processData data1 |

	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	self deny: (model haveDataIndex: 1).
	
	data1 := SmockTestUserData id: 1 data: #toto.
	model created: data1.
	self assert: (model haveDataIndex: 1).
]

{ #category : #tests }
SmockCUDModelTest >> testInitialize [

	self assert: model datas isEmpty.
	self assert: model isRecyclingActive.
	self assert: model processDatas isEmpty.
	self assert: model recycledDatasStack isEmpty.
	self assert: model indexAccessor equals: #key.
	self assert: model defaultProcessData isNil.
	self assert: model capacity equals: 10000.
]

{ #category : #tests }
SmockCUDModelTest >> testIsAutoCreateUnknownUpdatedData [
	| processData data1 gData1 error |
	
	model isAutoCreateUnknownUpdatedData: false.
	
	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	error := nil.
	
	"Update non existing data"
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model updated: data1.
	self assert: gData1 isNil.
	self assert: model datas size equals: 0.

	"Delete non existing data"
	gData1 := model deleted: data1.
	self assert: gData1 isNil.
	self assert: model datas size equals: 0.
	
	model isAutoCreateUnknownUpdatedData: true.
	
	"Update non existing data"
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model updated: data1.
	self assert: gData1 notNil.
	self assert: model datas size equals: 1.
]

{ #category : #'test - recycle' }
SmockCUDModelTest >> testIsRecyclingActive [

	self assert: model isRecyclingActive.
	
	model isRecyclingActive: false. 
	self deny: model isRecyclingActive.
]

{ #category : #tests }
SmockCUDModelTest >> testMultiCreateUpdateDeleteIndexedDatas [
	| processData userModel |

	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	userModel := OrderedCollection new.
	
	"Create"
	1 to: 100 do:[ :i | | data |
		data := SmockTestUserData id: ('data', i printString) asSymbol data: i.
		userModel add: data.
		model created: data.
	].
	self assert: model datas size equals: 100.
	self assert: model getDatas size equals: 100.

	1 to: 100 do:[ :i | | gData |
		gData := model getData: ('data', i printString) asSymbol. 
		self assert: gData = i. "defined in process data created"
	].

	"Update"
	1 to: 100 do:[ :i | | data |
		data := userModel at: i.
		data data: (i + 1).
		model updated: data.
	].
	self assert: model datas size equals: 100.
	self assert: model getDatas size equals: 100.

	1 to: 100 do:[ :i | | gData |
		gData := model getData: ('data', i printString) asSymbol. 
		self assert: gData = (i + 1). "defined in process data updated"
	].

	"Delete"
	1 to: 100 do:[ :i | | data |
		data := userModel at: i.
		model deleted: data.
	].
	self assert: model datas size equals: 0.
	self assert: model getDatas size equals: 0.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testName [

	self assert: model name isNil.

	model name: 'My Test Model'.
	self assert: model name equals: 'My Test Model'
]

{ #category : #'test - recycle' }
SmockCUDModelTest >> testRecycle [
	| data1 toBeRecyled |

	model indexAccessor: #id; setProcessData: SmockTestProcessData new forClass: SmockTestUserData.
	
	data1 := SmockTestUserData id: 1 data: #toto.
	model created: data1.
	model deleted: data1.
	
	toBeRecyled := model destockRecycledDataFor: SmockTestUserData.
	self assert: toBeRecyled equals: #toto.
	
	toBeRecyled := model destockRecycledDataFor: SmockTestUserData.
	self assert: toBeRecyled isNil.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testRemoveState [
	
	model setState: #testState value: true for: 2.
	model setState: #testState value: true for: 4.
	self assert: (model getStateValue: #testState for: 2) equals: true.
	self assert: (model getStateValue: #testState for: 4) equals: true.
	
	model removeState: #testState.
	self assert: (model getStateValue: #testState for: 2) equals: nil.
	self assert: (model getStateValue: #testState for: 4) equals: nil.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testRemoveStateFor [
	
	model setState: #testState value: true for: 1.
	model setState: #testState value: true for: 2.	
	model removeState: #testState for: 1.
	self assert: (model getStateValue: #testState for: 1) equals: nil.
	self assert: (model getStateValue: #testState for: 2) equals: true.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testSetStateFor [

	self assert: (model getStateValue: #testState for: 2) equals: nil.
	self assert: (model getStateValue: #testState for: 4) equals: nil.
	
	model setState: #testState for: 2.
	self assert: (model getStateValue: #testState for: 2) equals: true.
	self assert: (model getStateValue: #testState for: 4) equals: nil.
	
	model setState: #testState for: 4.
	self assert: (model getStateValue: #testState for: 2) equals: true.
	self assert: (model getStateValue: #testState for: 4) equals: true.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testSetStateValueFor [

	self assert: (model getStateValue: #testState for: 2) equals: nil.
	self assert: (model getStateValue: #testState for: 4) equals: nil.
	
	model setState: #testState value: true for: 2.
	self assert: (model getStateValue: #testState for: 2) equals: true.
	self assert: (model getStateValue: #testState for: 4) equals: nil.
	
	model setState: #testState value: true for: 4.
	self assert: (model getStateValue: #testState for: 2) equals: true.
	self assert: (model getStateValue: #testState for: 4) equals: true.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testStateChanged [
	| processData data1 gData1 |

	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	self assert: processData testStates isNil.
	
	"change state of data 1"
	model setState: #testState value: true for: 1.
	self assert: (processData testStates at: #testState) equals: 1 -> true.
	
	model setState: #testState value: false for: 1.
	self assert: (processData testStates at: #testState) equals: 1 -> false.
	
	model removeState: #testState.
	self assert: (processData testStates at: #testState) equals: 1 -> nil.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testStateChangedBeforeCreation [
	| processData data1 gData1 |

	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
		
	"change state of data 1"
	model setState: #testState value: true for: 1.
	self assert: processData testStates isNil.
	
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	self assert: (processData testStates at: #testState) equals: 1 -> true.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testStateFor [
	| processData data1 data2 data3 |

	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.
	data1 := SmockTestUserData id: 1 data: #toto.
	data2 := SmockTestUserData id: 2 data: #tata.
	data3 := SmockTestUserData id: 3 data: #titi.
	model created: data1.
	model created: data2.
	model created: data3.
	
	"change state of data 1"
	model setState: #testState for: 1.
	self assert: (processData testStates at: #testState) equals: 1 -> true.

	model setState: #testState for: 2.
	self assert: (processData testStates at: #testState) equals: 2 -> true.

	model setState: #testState for: 3.
	self assert: (processData testStates at: #testState) equals: 3 -> true.
]

{ #category : #'tests - states' }
SmockCUDModelTest >> testUpdateStateWithIndexes [
	| processData |

	model indexAccessor: #id. 
	processData := SmockTestProcessData new.
	model setProcessData: processData forClass: SmockTestUserData.

	"change state with a list of keys"
	model updateState: #testState withIndexes: #(1 2 3).
	"test model"
	self assert: (model getStateValue: #testState for: 1).
	self assert: (model getStateValue: #testState for: 2).
	self assert: (model getStateValue: #testState for: 3).
	self assert: (model getStateValue: #testState for: 4) isNil.
	self assert: (model getStateValue: #testState for: 5) isNil.
	
	"change state with a list of keys"
	model updateState: #testState withIndexes: #(2 4 5).
	"test model"
	self assert: (model getStateValue: #testState for: 1) isNil.
	self assert: (model getStateValue: #testState for: 2).
	self assert: (model getStateValue: #testState for: 3) isNil.
	self assert: (model getStateValue: #testState for: 4).
	self assert: (model getStateValue: #testState for: 5).
]
