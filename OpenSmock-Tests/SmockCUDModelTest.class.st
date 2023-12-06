"
A GFLModelTest is a test class for testing the behavior of GFLModel
"
Class {
	#name : #SmockCUDModelTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - Model'
}

{ #category : #tests }
SmockCUDModelTest >> testCreateExistingData [
	| model processData data1 gData1 data2 error |
	model := SmockCUDModel new.
	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData for: SmockTestUserData.
	
	data1 := SmockTestUserData id: 1 data: #toto.
	gData1 := model created: data1.
	
	"Create already existing data"
	error := nil.
	data2 := SmockTestUserData id: 1 data: #tata.
	[ gData1 := model created: data2 ] on: Error do:[ :e | error := e ].
	self assert: error class equals: SmockDuplicateIdError.
	self assert: model datas size equals: 1. 
]

{ #category : #tests }
SmockCUDModelTest >> testCreateUpdateDeleteIndexedDatas [
	| model processData data1 gData1 |
	model := SmockCUDModel new.
	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData for: SmockTestUserData.
	
	self assert: model processDatas size equals: 1.
	self assert: (model getProcessDataFor: SmockTestUserData) equals: processData.
	
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
SmockCUDModelTest >> testCreateUpdateDeleteIndexedDatasWithDefaultIndexAccessor [
	| model processData data1 gData1 |
	model := SmockCUDModel new.
	processData := SmockTestProcessData new.
	model setProcessData: processData for: SmockTestUserData.
	
	self assert: model processDatas size equals: 1.
	self assert: (model getProcessDataFor: SmockTestUserData) equals: processData.
	
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
	| model processData data1 gData1 |
	model := SmockCUDModel new.
	processData := SmockTestProcessData new.
	model defaultProcessData: processData.
	
	self assert: model processDatas size equals: 0.
	self assert: (model getProcessDataFor: SmockTestUserData) equals: nil.
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
SmockCUDModelTest >> testCreateUpdateDeleteNonExistingData [
	| model processData data1 gData1 error |
	model := SmockCUDModel new.
	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData for: SmockTestUserData.
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
]

{ #category : #tests }
SmockCUDModelTest >> testInitialize [
	| model |
	model := SmockCUDModel new.

	self assert: model datas isEmpty.
	self assert: model isRecyclingActive.
	self assert: model processDatas isEmpty.
	self assert: model recycledDatasStack isEmpty.
	self assert: model indexAccessor equals: #key.
	self assert: model defaultProcessData isNil.
]

{ #category : #tests }
SmockCUDModelTest >> testMultiCreateUpdateDeleteIndexedDatas [
	| model processData userModel |
	model := SmockCUDModel new.
	model indexAccessor: #id.
	processData := SmockTestProcessData new.
	model setProcessData: processData for: SmockTestUserData.
	userModel := OrderedCollection new.
	
	"Create"
	1 to: 100 do:[ :i | | data |
		data := SmockTestUserData id: ('data', i printString) asSymbol data: i.
		userModel add: data.
		model created: data.
	].
	self assert: model datas size equals: 100.

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
]

{ #category : #tests }
SmockCUDModelTest >> testRemoveState [
	| model |
	model := SmockCUDModel new.
	
	model setState: #testState value: true for: 2.
	model setState: #testState value: true for: 4.
	self assert: (model getStateValue: #testState for: 2) equals: true.
	self assert: (model getStateValue: #testState for: 4) equals: true.
	
	model removeState: #testState.
	self assert: (model getStateValue: #testState for: 2) equals: nil.
	self assert: (model getStateValue: #testState for: 4) equals: nil.
]

{ #category : #tests }
SmockCUDModelTest >> testSetStateValueFor [
	| model |
	model := SmockCUDModel new.
	self assert: (model getStateValue: #testState for: 2) equals: nil.
	self assert: (model getStateValue: #testState for: 4) equals: nil.
	
	model setState: #testState value: true for: 2.
	self assert: (model getStateValue: #testState for: 2) equals: true.
	self assert: (model getStateValue: #testState for: 4) equals: nil.
	
	model setState: #testState value: true for: 4.
	self assert: (model getStateValue: #testState for: 2) equals: true.
	self assert: (model getStateValue: #testState for: 4) equals: true.
]
