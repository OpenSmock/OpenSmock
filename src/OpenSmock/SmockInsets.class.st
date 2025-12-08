Class {
	#name : #SmockInsets,
	#superclass : #Object,
	#instVars : [
		'top',
		'left',
		'bottom',
		'right'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
SmockInsets class >> all: aNumber [

	^ self
		  top: aNumber
		  right: aNumber
		  bottom: aNumber
		  left: aNumber
]

{ #category : #'instance creation' }
SmockInsets class >> t: t r: r b: b l: l [

	^ self
		  top: t
		  right: r
		  bottom: b
		  left: l
]

{ #category : #'instance creation' }
SmockInsets class >> top: t right: r bottom: b left: l [

	^ self new
		  top: t;
		  right: r;
		  bottom: b;
		  left: l;
		  yourself
]

{ #category : #'instance creation' }
SmockInsets class >> zero [

	^ self all: 0
]

{ #category : #converting }
SmockInsets >> asMargin [

	^ Margin
		  top: self top
		  left: self left
		  bottom: self bottom
		  right: self right
]

{ #category : #accessing }
SmockInsets >> bottom [

	^ bottom ifNil: [ 0 ]
]

{ #category : #accessing }
SmockInsets >> bottom: anObject [

	bottom := anObject
]

{ #category : #testing }
SmockInsets >> isEmpty [
	"Return true if insets is empty and does not influence bounds, false otherwise.
	Note: comparing the sum of width and height may lead to unexpected results when insets are negative"

	^ self top isZero and: [
		  self right isZero and: [
			  self bottom isZero and: [ self left isZero ] ] ]
]

{ #category : #testing }
SmockInsets >> isUniform [
	"Return true if all insets (right, left, top, bottom) are same"

	^ (self top closeTo: self right) and: [
			  (self right closeTo: self bottom) and: [
				  (self bottom closeTo: self left) and: [
					  self left closeTo: self top ] ] ]
]

{ #category : #accessing }
SmockInsets >> left [

	^ left ifNil: [ 0 ]
]

{ #category : #accessing }
SmockInsets >> left: anObject [

	left := anObject
]

{ #category : #printing }
SmockInsets >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		space.

	self isEmpty ifTrue: [
			aStream nextPutAll: 'empty'.
			^ self ].

	self isUniform ifTrue: [
			aStream nextPutAll: 'all: '.
			aStream print: self top.
			^ self ].

	aStream
		nextPutAll: 'top: ';
		print: top;
		nextPutAll: ' right: ';
		print: right;
		nextPutAll: ' bottom: ';
		print: bottom;
		nextPutAll: ' left: ';
		print: left
]

{ #category : #accessing }
SmockInsets >> right [

	^ right ifNil: [ 0 ]
]

{ #category : #accessing }
SmockInsets >> right: anObject [

	right := anObject
]

{ #category : #accessing }
SmockInsets >> top [

	^ top ifNil: [ 0 ]
]

{ #category : #accessing }
SmockInsets >> top: anObject [

	top := anObject
]
