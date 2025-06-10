Class {
	#name : #SmockDisplayFilter,
	#superclass : #Object,
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
SmockDisplayFilter class >> isAbstract [

	^ self = SmockDisplayFilter 
]

{ #category : #testing }
SmockDisplayFilter >> isDisplayNothing [

	self subclassResponsibility 
]

{ #category : #gShapes }
SmockDisplayFilter >> isGShapeDisplayed: aGShape [
	
	self subclassResponsibility 
]

{ #category : #gShapes }
SmockDisplayFilter >> isGShapeNotDisplayed: aGShape [

	^ (self isGShapeDisplayed: aGShape) not
]

{ #category : #gShapes }
SmockDisplayFilter >> processDShape: aDShape toGShape: aGShape2D [

	"do nothing"
]
