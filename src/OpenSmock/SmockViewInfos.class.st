Class {
	#name : #SmockViewInfos,
	#superclass : #Object,
	#instVars : [
		'origin',
		'extent'
	],
	#category : #'OpenSmock-Model'
}

{ #category : #accessing }
SmockViewInfos >> bounds [

	^ 0@0 extent: self extent 
]

{ #category : #accessing }
SmockViewInfos >> center [

	^ self extent / 2
]

{ #category : #accessing }
SmockViewInfos >> extent [

	^ extent ifNil:[ extent := 0@0 ]
]

{ #category : #accessing }
SmockViewInfos >> extent: aPoint [

	extent := aPoint
]

{ #category : #accessing }
SmockViewInfos >> height [

	^ self extent y
]

{ #category : #accessing }
SmockViewInfos >> origin [

	^ origin ifNil:[ origin := 0@0 ]
]

{ #category : #accessing }
SmockViewInfos >> origin: anObject [

	origin := anObject
]

{ #category : #updating }
SmockViewInfos >> update [
	"do some computing here"

	
]

{ #category : #accessing }
SmockViewInfos >> width [

	^ self extent x
]
