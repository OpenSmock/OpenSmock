Class {
	#name : #SmockTestLayer,
	#superclass : #SmockAbstractDomainLayer,
	#instVars : [
		'viewInfos'
	],
	#category : #'OpenSmock-Tests-Model'
}

{ #category : #accessing }
SmockTestLayer >> viewInfos [

	^ viewInfos
]

{ #category : #accessing }
SmockTestLayer >> viewInfos: anObject [

	viewInfos := anObject
]
