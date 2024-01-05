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
SmockAbstractCoordinates >> = aCoordinates [

	self subclassResponsibility 
]

{ #category : #testing }
SmockAbstractCoordinates >> asPoint [

	^ self subclassResponsibility
]

{ #category : #copying }
SmockAbstractCoordinates >> copy [
	| copy |
	copy := self class new.
	^copy
]

{ #category : #testing }
SmockAbstractCoordinates >> isEmpty [

	self subclassResponsibility
]

{ #category : #testing }
SmockAbstractCoordinates >> isNotEmpty [

	^ self isEmpty not
]

{ #category : #testing }
SmockAbstractCoordinates >> isValid [

	self subclassResponsibility
]
