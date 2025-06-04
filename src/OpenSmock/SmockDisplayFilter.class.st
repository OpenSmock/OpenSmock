Class {
	#name : #SmockDisplayFilter,
	#superclass : #Object,
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
SmockDisplayFilter class >> isAbstract [

	^ self = SmockDisplayFilter 
]

{ #category : #gShapes }
SmockDisplayFilter >> configureFromDShape: aDShape toGShape: aGShape2D [

	"do nothing"
]

{ #category : #testing }
SmockDisplayFilter >> isEmpty [

	^ true
]

{ #category : #testing }
SmockDisplayFilter >> isFilteringNothing [

	^ self isEmpty 
]

{ #category : #gShapes }
SmockDisplayFilter >> isGShapeFiltered: aGShape [

	self subclassResponsibility 
]

{ #category : #gShapes }
SmockDisplayFilter >> isGShapeUnfiltered: aGShape [

	^ (self isGShapeFiltered: aGShape) not
]
