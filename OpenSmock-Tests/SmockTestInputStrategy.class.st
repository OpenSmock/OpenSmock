Class {
	#name : #SmockTestInputStrategy,
	#superclass : #SmockInputStrategy,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #'event handling' }
SmockTestInputStrategy >> processEvent: aSmockEventWrapper context: aSmockInputContext [

	"Consume the event"
	aSmockEventWrapper isConsumed: true
]
