Class {
	#name : #SmockAeUtils,
	#superclass : #Object,
	#category : #'OpenSmock-Alexandrie'
}

{ #category : #'text metrics' }
SmockAeUtils class >> getRectangleFromMetrics: aMetrics [

	aMetrics ifNil: [ ^ 0 @ 0 extent: 0 @ 0 ].
	^ 0 asPoint extent: aMetrics width @ aMetrics height
]
