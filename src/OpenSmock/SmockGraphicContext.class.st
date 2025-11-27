Class {
	#name : #SmockGraphicContext,
	#superclass : #Object,
	#instVars : [
		'needToComputeBounds'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #testing }
SmockGraphicContext class >> isAbstract [ 

	^ self == SmockGraphicContext 
]

{ #category : #accessing }
SmockGraphicContext >> needToComputeBounds [

	^ needToComputeBounds ifNil: [ needToComputeBounds := true ]
]

{ #category : #accessing }
SmockGraphicContext >> needToComputeBounds: aBoolean [

	needToComputeBounds := aBoolean
]

{ #category : #notification }
SmockGraphicContext >> propertyHasChanged: aSymbol [
	"Notify the graphic contact that a property (i.e. style, position, etc.) has changed. 
	Usefull to manage computing flags in case of process, bounds computing, buffer, etc."
	
	self subclassResponsibility 
]
