"
Process Data for GFLModel Tests
"
Class {
	#name : #SmockTestProcessData,
	#superclass : #SmockProcessData,
	#category : #'OpenSmock-Tests-Cases - Model'
}

{ #category : #processing }
SmockTestProcessData >> processCreatedData: aKey incoming: aSourceData with: aProducedData context: aContext [
	^aSourceData data
]

{ #category : #processing }
SmockTestProcessData >> processDeletedData: aKey incoming: aSourceData with: aProducedData context: aContext [
	^nil
]

{ #category : #processing }
SmockTestProcessData >> processUpdatedData: aKey incoming: aSourceData with: aProducedData context: aContext [
	^aSourceData data
]
