"
Command used with SmockCommandExecutor

usage: 
```language=Pharo
((SmockCommand new)
	performer: self;
	message: #update3DPoint:with:;
	arguments: (Array with: lastPoint with: anEditorManager);
	yourself)
```
"
Class {
	#name : #SmockCommand,
	#superclass : #Object,
	#instVars : [
		'performer',
		'message',
		'arguments',
		'evictedManagementBlock'
	],
	#category : #'OpenSmock-Tools'
}

{ #category : #accessing }
SmockCommand >> arguments [

	^arguments
]

{ #category : #accessing }
SmockCommand >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
SmockCommand >> evictedManagementBlock [

	^evictedManagementBlock
]

{ #category : #accessing }
SmockCommand >> evictedManagementBlock: aBlockClosure [

	evictedManagementBlock := aBlockClosure
]

{ #category : #accessing }
SmockCommand >> execute [

	^arguments ifNil: [performer perform: message ]
		ifNotNil: [ performer perform: message withArguments: arguments ]
]

{ #category : #accessing }
SmockCommand >> executeWithEvictedValues: aList [

	evictedManagementBlock ifNil: [ 
		^self execute 
	]ifNotNil: [
		evictedManagementBlock value: self value value: aList.
		^performer perform: message withArguments: arguments
	]
]

{ #category : #accessing }
SmockCommand >> message [

	^message
]

{ #category : #accessing }
SmockCommand >> message: anObject [

	message := anObject
]

{ #category : #accessing }
SmockCommand >> performer [

	^performer
]

{ #category : #accessing }
SmockCommand >> performer: anObject [

	performer := anObject
]

{ #category : #accessing }
SmockCommand >> setEvictorTrace [

	self evictedManagementBlock: [ :command :listOfEvicted | ('[Command] Evicted values (msg=', command message,') = ',listOfEvicted size printString) traceCr]
]
