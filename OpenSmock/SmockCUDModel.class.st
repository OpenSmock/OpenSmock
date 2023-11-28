"
I am a Graphic Model. 
GraphicModel is use to manage conversion between a user data and an user-interface data. ProcessData manage the conversion strategy by creation, updating and deletion.
"
Class {
	#name : #SmockCUDModel,
	#superclass : #Object,
	#instVars : [
		'indexAccessor',
		'datas',
		'processDatas',
		'defaultProcessData',
		'isRecyclingActive',
		'recycledDatasStack',
		'symbologyProvider'
	],
	#category : #'OpenSmock-Model'
}

{ #category : #cud }
SmockCUDModel >> created: aData [
	| processData data key |
	(self isSupportedData: aData) ifFalse:[
		SmockNotSupportedDataError signal: 'Data not supported or model not setup for this data.'. ^ nil.
	].
	
	key := self getSupportedDataIndex: aData.
	(self datas includesKey: key) ifTrue:[ 
		SmockDuplicateIdError signal: 'Cannot create the Data because index already used.'. 
		^ nil.	
	].
	
	processData := self getSupportedDataProcessData: aData.
	processData ifNil:[ ^ nil ].
	self isRecyclingActive ifTrue:[
		data := self destockRecycledDataFor: aData class.
	].
	data := processData processCreatedData: key incoming: aData with: data context: nil.
	data ifNil:[ ^ nil ].
	
	self datas at: key put: data.
	^data
]

{ #category : #datas }
SmockCUDModel >> datas [
	datas ifNil:[datas := Dictionary new].
	^ datas 
]

{ #category : #datas }
SmockCUDModel >> datas: anObject [
	datas := anObject
]

{ #category : #'process data' }
SmockCUDModel >> defaultProcessData [
	^ defaultProcessData
]

{ #category : #'process data' }
SmockCUDModel >> defaultProcessData: anObject [

	(defaultProcessData ~= anObject) ifFalse:[ ^ self ].
	defaultProcessData := anObject.
	defaultProcessData ifNotNil: [ defaultProcessData processor: self ]
]

{ #category : #'process data' }
SmockCUDModel >> deleteProcessDataFor: aDataClass [
	self assert: [ aDataClass isNotNil ] description: [ '[GeoViewGraphicModel] Can not delete a process data without data class.'].
	^self processDatas removeKey: aDataClass ifAbsent:[nil]
]

{ #category : #cud }
SmockCUDModel >> deleted: aData [
	| processData data oldData key |
	(self isSupportedData: aData) ifFalse:[
		SmockNotSupportedDataError signal: 'Data not supported or model not setup for this data.'. ^ nil.
	].
	
	key := self getSupportedDataIndex: aData.
	(self datas includesKey: key) not ifTrue:[ 	^ nil ].
	
	processData := self getSupportedDataProcessData: aData.
	processData ifNil:[ ^ nil ].
	oldData := self datas at: key ifAbsent:[ nil ].
	oldData ifNil:[ ^ nil ].
	data := processData processDeletedData: key incoming: aData with: oldData context: nil.
	
	self datas removeKey: key.
	(data notNil and:[self isRecyclingActive]) ifTrue:[self stockRecycledData: data for: aData class].
	^data
]

{ #category : #'recycling - private' }
SmockCUDModel >> destockRecycledDataFor: anObjectClass [
	| recycledDatas data |
	anObjectClass ifNil:[^nil].
	recycledDatas := self recycledDatasStackFor: anObjectClass.
	recycledDatas isEmpty ifTrue:[data := nil] ifFalse:[data := recycledDatas first. recycledDatas removeFirst].
	^data
]

{ #category : #'recycling - private' }
SmockCUDModel >> destockRecycledDatasFor: anObjectClass [
	| recycledDatas data |
	anObjectClass ifNil:[^nil].
	recycledDatas := self recycledDatasStackFor: anObjectClass.
	recycledDatas isEmpty ifTrue:[data := nil] ifFalse:[data := recycledDatas first. recycledDatas removeFirst].
	^data
]

{ #category : #'process data' }
SmockCUDModel >> getAllProcessData [
	^self processDatas values
]

{ #category : #datas }
SmockCUDModel >> getData: aKey [
	^ self datas at: aKey 
]

{ #category : #'process data' }
SmockCUDModel >> getProcessDataFor: aDataClass [
	self assert: [ aDataClass isNotNil ] description: [ '[GeoViewGraphicModel] Can not get a process data without data class.'].
	^self processDatas at: aDataClass ifAbsent:[nil]
]

{ #category : #datas }
SmockCUDModel >> getSupportedDataIndex: aData [
	"suppose data is supported"
	^aData perform: self indexAccessor
]

{ #category : #datas }
SmockCUDModel >> getSupportedDataProcessData: aData [
	"suppose data is supported"
	| processData |
	processData := self processDatas at: aData class ifAbsent:[nil].
	processData ifNil:[processData := self defaultProcessData].
	^processData
]

{ #category : #accessing }
SmockCUDModel >> indexAccessor [
	indexAccessor ifNil:[indexAccessor := #key].
	^ indexAccessor
]

{ #category : #accessing }
SmockCUDModel >> indexAccessor: anObject [
	indexAccessor := anObject
]

{ #category : #recycling }
SmockCUDModel >> isRecyclingActive [

	isRecyclingActive ifNil: [ isRecyclingActive := true ].
	^ isRecyclingActive
]

{ #category : #recycling }
SmockCUDModel >> isRecyclingActive: anObject [
	isRecyclingActive := anObject
]

{ #category : #testing }
SmockCUDModel >> isSupportedData: aData [
	| key |
	aData ifNil:[^false].
	(aData respondsTo: self indexAccessor) ifFalse:[^false].
	key := aData perform: self indexAccessor.
	key ifNil:[^false].
	
	^true
]

{ #category : #'process data' }
SmockCUDModel >> processDatas [
	processDatas ifNil:[processDatas := Dictionary new].
	^ processDatas
]

{ #category : #'process data' }
SmockCUDModel >> processDatas: anObject [
	processDatas := anObject
]

{ #category : #accessing }
SmockCUDModel >> recycledDatasStack [
	recycledDatasStack ifNil:[recycledDatasStack := Dictionary new].
	^ recycledDatasStack
]

{ #category : #accessing }
SmockCUDModel >> recycledDatasStack: anObject [
	recycledDatasStack := anObject
]

{ #category : #'recycling - private' }
SmockCUDModel >> recycledDatasStackFor: anObjectClass [
	| recycledDatas |
	recycledDatas := self recycledDatasStack at: anObjectClass ifAbsentPut:[OrderedCollection new].
	^recycledDatas
]

{ #category : #'process data' }
SmockCUDModel >> setProcessData: aProcessDataInstance for: aDataClass [
	self assert: [ aProcessDataInstance isNotNil ] description: [ '[GeoViewGraphicModel] Can not add a nil process data.' ].
	self assert: [ aDataClass isNotNil ] description: [ '[GeoViewGraphicModel] Can not add a process data without data class.' ].

	aProcessDataInstance processor: self.
	self processDatas at: aDataClass put: aProcessDataInstance
]

{ #category : #'recycling - private' }
SmockCUDModel >> stockRecycledData: aData for: anObjectClass [
	| recycledDatas |
	(anObjectClass isNil or:[aData isNil]) ifTrue:[^nil].
	recycledDatas := self recycledDatasStackFor: anObjectClass.
	recycledDatas add: aData
]

{ #category : #'recycling - private' }
SmockCUDModel >> stockRecycledDatas: aData for: anObjectClass [
	| recycledDatas |
	(anObjectClass isNil or:[aData isNil]) ifTrue:[^nil].
	recycledDatas := self recycledDatasStackFor: anObjectClass.
	recycledDatas add: aData
]

{ #category : #accessing }
SmockCUDModel >> symbologyProvider [
	^ symbologyProvider
]

{ #category : #accessing }
SmockCUDModel >> symbologyProvider: anObject [
	symbologyProvider := anObject
]

{ #category : #cud }
SmockCUDModel >> updated: aData [
	| processData data oldData key |
	(self isSupportedData: aData) ifFalse:[
		SmockNotSupportedDataError signal: 'Data not supported or model not setup for this data.'. ^ nil.
	].
	
	key := self getSupportedDataIndex: aData.
	(self datas includesKey: key) not ifTrue:[ 	^ nil ].
	
	processData := self getSupportedDataProcessData: aData.
	processData ifNil:[ ^ nil ].
	oldData := self datas at: key ifAbsent:[ nil ].
	oldData ifNil:[ ^ nil ].
	data := processData processUpdatedData: key incoming: aData with: oldData context: nil.
	data ifNil:[ ^ nil ].
	
	self datas at: key put: data.
	^data
]
