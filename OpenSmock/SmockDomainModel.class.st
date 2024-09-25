Class {
	#name : #SmockDomainModel,
	#superclass : #SmockCUDModel,
	#instVars : [
		'symbologyProvider',
		'viewInfos'
	],
	#category : #'OpenSmock-Model'
}

{ #category : #accessing }
SmockDomainModel >> symbologyProvider [

	^ symbologyProvider
]

{ #category : #accessing }
SmockDomainModel >> symbologyProvider: anObject [

	symbologyProvider := anObject
]

{ #category : #accessing }
SmockDomainModel >> viewInfos [

	^ viewInfos
]

{ #category : #accessing }
SmockDomainModel >> viewInfos: anObject [

	viewInfos := anObject
]
