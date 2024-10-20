Class {
	#name : #SmockDomainModel,
	#superclass : #SmockCUDModel,
	#instVars : [
		'symbologyProvider'
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
