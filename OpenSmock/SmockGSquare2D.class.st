Class {
	#name : #SmockGSquare2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'sideSize'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #'as yet unclassified' }
SmockGSquare2D >> getSquare [

	^ self sideSize negated / 2 asPoint corner: self sideSize / 2 asPoint
]

{ #category : #accessing }
SmockGSquare2D >> sideSize [

	^ sideSize ifNil:[sideSize := 20].
]

{ #category : #accessing }
SmockGSquare2D >> sideSize: anObject [

	sideSize := anObject
]
