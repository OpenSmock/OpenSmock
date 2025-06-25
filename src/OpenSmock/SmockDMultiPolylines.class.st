"
Je suis une Shape qui compose plusieurs DPolyline
"
Class {
	#name : #SmockDMultiPolylines,
	#superclass : #SmockDMultiShapes,
	#category : #'OpenSmock-DShape'
}

{ #category : #polylines }
SmockDMultiPolylines >> addPolyline: aDPolyline [

	self addShape: aDPolyline 
]

{ #category : #polylines }
SmockDMultiPolylines >> addPolylines: aDPolylineList [

	self addShapes: aDPolylineList 
]

{ #category : #accessing }
SmockDMultiPolylines >> polylines [

	^ self shapes
]

{ #category : #polylines }
SmockDMultiPolylines >> removePolylines [

	self removeShapes 
]
