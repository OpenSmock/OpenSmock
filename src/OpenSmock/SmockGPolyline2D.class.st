Class {
	#name : #SmockGPolyline2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'points'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #comparing }
SmockGPolyline2D >> distanceTo: aPoint [

	| dist a b c |

	dist := super distanceTo: aPoint.
	self points overlappingPairsDo: [:p1 :p2 | | newDist |
		p1 y = p2 y ifTrue:[ 
			a := 0.
			b := 1.
			c := p1 y negated
		] ifFalse:[
			p1 x = p2 x ifTrue:[
				a := 1.
				b := 0.
				c := p1 x negated
			] ifFalse:[
				a:= p1 y - p2 y.
				b := p2 x - p1 x.
				c := (p1 x - p2 x) * p1 y + ((p2 y - p1 y) * p1 x)
			].
		].
		
		newDist := (a * aPoint x + (b * aPoint y) +  c) abs / (a squared + b squared) sqrt.
		dist ifNil: [ dist := newDist ] ifNotNil:[ dist := newDist min: dist ]
	].
	^dist
]

{ #category : #testing }
SmockGPolyline2D >> isDrawable [ 

	super isDrawable ifFalse:[ ^ false ].
	self points ifNil: [ ^ false ].
	self points size > 1 ifFalse: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGPolyline2D >> points [

	^ points
]

{ #category : #accessing }
SmockGPolyline2D >> points: anObject [

	points := anObject
]
