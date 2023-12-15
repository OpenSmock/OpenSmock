Class {
	#name : #SmockShowInTranscriptInputStrategy,
	#superclass : #SmockInputStrategy,
	#category : #'OpenSmock-Core'
}

{ #category : #'event handling' }
SmockShowInTranscriptInputStrategy >> processEvent: aSmockEventWrapper context: aSmockInputContext [
	
	"Show the event in a Transcript without consume it"
	Transcript cr.
	aSmockEventWrapper ifNil:[ Transcript show: 'nil event'. ^ self ].
	
	Transcript show: aSmockEventWrapper event printString.
]
