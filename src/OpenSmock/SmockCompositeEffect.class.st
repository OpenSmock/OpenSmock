Class {
	#name : #SmockCompositeEffect,
	#superclass : #SmockPaintEffect,
	#instVars : [
		'effects'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #initialization }
SmockCompositeEffect >> addAll: aCollection [

	self effects addAll: aCollection
]

{ #category : #testing }
SmockCompositeEffect >> canBeAppliedTo: anObject [
	"return true of false if the effect can be applied to this object"

	^ self effects allSatisfy: [ :e | e canBeAppliedTo: anObject ]
]

{ #category : #testing }
SmockCompositeEffect >> computeBounds: aRectangle [
	"considere padding"

	| rectangle |
	rectangle := aRectangle.
	
	self effects do:[ :e | | r |
		r := e computeBounds: aRectangle.
		rectangle := rectangle merge: r.
	].

	^ rectangle
]

{ #category : #accessing }
SmockCompositeEffect >> effects [

	^ effects
]

{ #category : #initialization }
SmockCompositeEffect >> initialize [

	super initialize.
	effects := OrderedCollection new
]

{ #category : #initialization }
SmockCompositeEffect >> isEmpty [

	^ self effects isEmpty
]

{ #category : #initialization }
SmockCompositeEffect >> notEmpty [

	^ self isEmpty not
]

{ #category : #initialization }
SmockCompositeEffect >> removeAll [

	self effects removeAll
]
