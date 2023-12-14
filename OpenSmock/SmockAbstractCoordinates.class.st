"
I am an Abstract Coordinates
"
Class {
	#name : #SmockAbstractCoordinates,
	#superclass : #Object,
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
SmockAbstractCoordinates class >> isAbstract [ 

	^ self = SmockAbstractCoordinates
]

{ #category : #'instance creation' }
SmockAbstractCoordinates class >> zero [ 
	self subclassResponsibility 
]

{ #category : #testing }
SmockAbstractCoordinates >> asPoint [

	^ nil
]

{ #category : #copying }
SmockAbstractCoordinates >> copy [
	| copy |
	copy := self class new.
	^copy
]

{ #category : #testing }
SmockAbstractCoordinates >> isEmpty [

	self explicitRequirement 
]

{ #category : #testing }
SmockAbstractCoordinates >> isValid [

	self explicitRequirement 
]
