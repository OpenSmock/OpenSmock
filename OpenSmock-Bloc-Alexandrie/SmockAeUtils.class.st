Class {
	#name : #SmockAeUtils,
	#superclass : #Object,
	#category : #'OpenSmock-Bloc-Alexandrie'
}

{ #category : #'text metrics' }
SmockAeUtils class >> getRectangleFromMetrics: aMetric [

	aMetric ifNil: [ ^ 0 @ 0 extent: 0 @ 0 ].
	^ 0 asPoint extent: aMetric width @ aMetric height
]
