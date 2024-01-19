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
		'processDatasForKeys',
		'defaultProcessData',
		'isRecyclingActive',
		'recycledDatasStack',
		'states',
		'capacity'
	],
	#category : #'OpenSmock-Model'
}

{ #category : #accessing }
SmockCUDModel >> capacity [

	^ capacity ifNil:[ capacity := 10000 ]
]

{ #category : #accessing }
SmockCUDModel >> capacity: anInteger [

	capacity := anInteger
]

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
	
	processData := self getProcessDataFor: aData.
	processData ifNil:[ ^ nil ].
	self isRecyclingActive ifTrue:[
		data := self destockRecycledDataFor: aData class.
	].
	data := processData processCreatedData: key incoming: aData with: data context: nil.
	data ifNil:[ ^ nil ].	
	self datas at: key put: data.
	self processDatasForKeys at: key put: processData.
	
	"update states"
	(self getStatesForKey: key) do: [ :s | self stateChanged: s value: (self getStateValue: s for: key) for: key ].
		
	^ data
]

{ #category : #datas }
SmockCUDModel >> datas [

	^ datas ifNil: [ datas := Dictionary new: self capacity ]
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

	defaultProcessData ~= anObject ifFalse: [ ^ self ].
	defaultProcessData := anObject.
	defaultProcessData ifNotNil: [ defaultProcessData processor: self ]
]

{ #category : #cud }
SmockCUDModel >> deleted: aData [
	| processData data oldData key |
	(self isSupportedData: aData) ifFalse:[
		SmockNotSupportedDataError signal: 'Data not supported or model not setup for this data.'. ^ nil.
	].
	
	key := self getSupportedDataIndex: aData.
	(self datas includesKey: key) ifFalse:[ ^ nil ].
	
	processData := self getProcessDataFor: aData.
	processData ifNil:[ ^ nil ].
	oldData := self datas at: key ifAbsent:[ nil ].
	oldData ifNil:[ ^ nil ].
	data := processData processDeletedData: key incoming: aData with: oldData context: nil.
	
	self datas removeKey: key.
	self processDatasForKeys removeKey: key.
	(data notNil and:[self isRecyclingActive]) ifTrue:[self stockRecycledData: data for: aData class].
	^ data
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

	^ self processDatas values
]

{ #category : #datas }
SmockCUDModel >> getData: aKey [

	^ self datas at: aKey ifAbsent: [ ]
]

{ #category : #datas }
SmockCUDModel >> getDatas [

	^ self datas values
]

{ #category : #datas }
SmockCUDModel >> getProcessDataFor: aData [
	"suppose data is supported"

	^ self getProcessDataForClass: aData class
]

{ #category : #datas }
SmockCUDModel >> getProcessDataForClass: aDataClass [
	"suppose data is supported"

	| processData |
	processData := self processDatas at: aDataClass ifAbsent: [ nil ].
	processData ifNil: [ processData := self defaultProcessData ].
	^ processData
]

{ #category : #datas }
SmockCUDModel >> getProcessDataForKey: aKey [
	"return the process data used to create a data key"

	| processData |
	processData := self processDatasForKeys at: aKey ifAbsent: [ nil ].
	processData ifNil: [ processData := self defaultProcessData ].
	^ processData
]

{ #category : #'private - states' }
SmockCUDModel >> getState: aSymbol [

	| dictionary |
	dictionary := self states at: aSymbol ifAbsentPut:[ Dictionary new ].
	^ dictionary
]

{ #category : #'private - states' }
SmockCUDModel >> getStateValue: aSymbol for: anIndex [

	| state |
	state := self states at: aSymbol ifAbsent: [ ^ nil ].
	^ state at: anIndex ifAbsent: [  ]
]

{ #category : #'private - states' }
SmockCUDModel >> getStatesForKey: aKey [

	| symbols |
	symbols := OrderedCollection new.
	self states keysAndValuesDo:[ :k :v |
		(v includesKey: aKey) ifTrue:[ symbols add: k ].
	].

	^ symbols
]

{ #category : #datas }
SmockCUDModel >> getSupportedDataIndex: aData [
	"suppose data is supported"

	^ aData perform: self indexAccessor
]

{ #category : #accessing }
SmockCUDModel >> indexAccessor [

	^ indexAccessor ifNil: [ indexAccessor := #key ]
]

{ #category : #accessing }
SmockCUDModel >> indexAccessor: aSymbol [

	indexAccessor := aSymbol
]

{ #category : #recycling }
SmockCUDModel >> isRecyclingActive [

	^ isRecyclingActive ifNil: [ isRecyclingActive := true ]
]

{ #category : #recycling }
SmockCUDModel >> isRecyclingActive: aBoolean [

	isRecyclingActive := aBoolean
]

{ #category : #testing }
SmockCUDModel >> isSupportedData: aData [

	| key |
	aData ifNil: [ ^ false ].
	(aData respondsTo: self indexAccessor) ifFalse: [ ^ false ].
	key := aData perform: self indexAccessor.
	key ifNil: [ ^ false ].

	^ true
]

{ #category : #'process data' }
SmockCUDModel >> processDatas [

	processDatas ifNil: [ processDatas := Dictionary new ].
	^ processDatas
]

{ #category : #'process data' }
SmockCUDModel >> processDatas: anObject [

	processDatas := anObject
]

{ #category : #accessing }
SmockCUDModel >> processDatasForKeys [

	^ processDatasForKeys ifNil:[ processDatasForKeys := Dictionary new ].
]

{ #category : #accessing }
SmockCUDModel >> processDatasForKeys: anObject [

	processDatasForKeys := anObject
]

{ #category : #accessing }
SmockCUDModel >> recycledDatasStack [

	^ recycledDatasStack ifNil: [ recycledDatasStack := Dictionary new: self capacity ]
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
SmockCUDModel >> removeProcessDataFor: aDataClass [

	self 
		assert: [ aDataClass isNotNil ] 
		description: [ '[SmockCUDModel] Can not delete a process data without data class.' ].
		
	^ self processDatas removeKey: aDataClass ifAbsent: [ nil ]
]

{ #category : #'private - states' }
SmockCUDModel >> removeState: aSymbol [

	| state keys |
	state := self states at: aSymbol ifAbsent: [ ^ self ].
	keys := state keys.
	self states removeKey: aSymbol.
	
	keys do:[ :k | self stateChanged: aSymbol value: nil for: k ]
]

{ #category : #'private - states' }
SmockCUDModel >> removeState: aSymbol for: aKey [

	| dictionary |
	dictionary := self getState: aSymbol.
	dictionary at: aKey ifAbsent:[ ^ nil ].
	dictionary removeKey: aKey.
	
	^ self stateChanged: aSymbol value: nil for: aKey
]

{ #category : #'process data' }
SmockCUDModel >> setProcessData: aProcessDataInstance for: aDataClass [

	self
		assert: [ aProcessDataInstance isNotNil ]
		description: [ '[SmockCUDModel] Can not add a nil process data.' ].
	self 
		assert: [ aDataClass isNotNil ] 
		description: [ '[SmockCUDModel] Can not add a process data without data class.' ].

	aProcessDataInstance processor: self.
	self processDatas at: aDataClass put: aProcessDataInstance
]

{ #category : #'private - states' }
SmockCUDModel >> setState: aSymbol for: aKey [
	"default state value is true"

	self setState: aSymbol value: true for: aKey
]

{ #category : #'private - states' }
SmockCUDModel >> setState: aSymbol value: anObject for: aKey [

	| dictionary |
	dictionary := self getState: aSymbol.
	dictionary at: aKey ifPresent:[ :e | e = anObject ifTrue:[ ^ self ] ] ifAbsentPut:[ anObject ].
	
	self stateChanged: aSymbol value: anObject for: aKey
]

{ #category : #private }
SmockCUDModel >> stateChanged: aState value: aValue for: aKey [
	
	| processData oldData data |
	(self datas includesKey: aKey) ifFalse:[ ^ self ].
	processData := self getProcessDataForKey: aKey.
	processData ifNil:[ ^ nil ].
	oldData := self datas at: aKey ifAbsent:[ nil ].
	oldData ifNil:[ ^ nil ].
	data := processData processStateChanged: aKey state: aState value: aValue with: oldData context: nil.
	data ifNil:[ ^ nil ].
	
	self datas at: aKey put: data.
]

{ #category : #accessing }
SmockCUDModel >> states [

	^ states ifNil: [ states := Dictionary new ]
]

{ #category : #accessing }
SmockCUDModel >> states: anObject [

	states := anObject
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

{ #category : #'cud - states' }
SmockCUDModel >> updateState: aSymbol value: aValue withKeys: aListOfKeys [
	"Update all state for keys, ignore existing, remove old, add new. return affected datas"
	
	| state toAddKeys toRemoveKeys updatedDatas toUpdateKeys |
	state := self getState: aSymbol.
	toAddKeys := aListOfKeys copyWithoutAll: state keys. 
	toRemoveKeys := state keys copyWithoutAll: aListOfKeys.
	toUpdateKeys := (aListOfKeys removeAll: toAddKeys) removeAll: toRemoveKeys.
	updatedDatas := OrderedCollection new.
	
	toRemoveKeys do:[ :k | 
		self removeState: aSymbol for: k. 
		(self getData: k) ifNotNil:[ :e | updatedDatas add: e ] 
	].

	toUpdateKeys := toUpdateKeys addAll: toAddKeys.
	toUpdateKeys do:[ :k | | value |
		value := state at: k.
		value = aValue ifFalse:[
			self setState: aSymbol value: aValue for: k. 
			(self getData: k) ifNotNil:[ :e | updatedDatas add: e ]. 
		].
	].
	
	^ updatedDatas
]

{ #category : #'cud - states' }
SmockCUDModel >> updateState: aSymbol withIndexes: aListOfKeys [
	"Update all state for keys, ignore existing, remove old, add new. return affected datas"
	
	| state toAddKeys toRemoveKeys updatedDatas |
	state := self getState: aSymbol.
	toAddKeys := aListOfKeys copyWithoutAll: state keys. 
	toRemoveKeys := state keys copyWithoutAll: aListOfKeys.
	updatedDatas := OrderedCollection new.
	
	toRemoveKeys do:[ :k | 
		self removeState: aSymbol for: k. 
		(self getData: k) ifNotNil:[ :e | updatedDatas add: e ] 
	].

	toAddKeys do:[ :k | 
		self setState: aSymbol for: k. 
		(self getData: k) ifNotNil:[ :e | updatedDatas add: e ] 
	].
	
	^ updatedDatas
]

{ #category : #cud }
SmockCUDModel >> updated: aData [
	| processData data oldData key |
	(self isSupportedData: aData) ifFalse:[
		SmockNotSupportedDataError signal: 'Data not supported or model not setup for this data.'. ^ nil.
	].
	
	key := self getSupportedDataIndex: aData.
	(self datas includesKey: key) ifFalse:[ ^ nil ].
	
	processData := self getProcessDataFor: aData.
	processData ifNil:[ ^ nil ].
	oldData := self datas at: key ifAbsent:[ nil ].
	oldData ifNil:[ ^ nil ].
	data := processData processUpdatedData: key incoming: aData with: oldData context: nil.
	data ifNil:[ ^ nil ].
	
	self datas at: key put: data.
	^ data
]
