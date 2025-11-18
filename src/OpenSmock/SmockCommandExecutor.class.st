"
SmockCommandExecutor is a complex CommandExecutor with evitedValue management available if command use evictedManagementBlock

Commande to execute to initialize a command executor:
```
SmockCommandExecutor key: #MouseMoveEventExecutor delay: 500 priority: Processor userSchedulingPriority
```

it uses SmockCommand instances.


"
Class {
	#name : #SmockCommandExecutor,
	#superclass : #SmockBasicCommandExecutor,
	#category : #'OpenSmock-Tools'
}

{ #category : #accessing }
SmockCommandExecutor class >> delay: aMilli [
| tmp |
tmp := self new.
tmp executorWaitingDelay: aMilli.
^tmp
]

{ #category : #accessing }
SmockCommandExecutor class >> key: aKey delay: aMilli [
| tmp |
tmp := self basicNew.
tmp key: aKey.
tmp initialize.
tmp executorWaitingDelay: aMilli.
^tmp
]

{ #category : #accessing }
SmockCommandExecutor class >> key: aKey delay: aMilli priority: aThreadPriority [
| tmp |
tmp := self basicNew.
tmp key: aKey.
tmp threadPriority: aThreadPriority.
tmp initialize.
tmp executorWaitingDelay: aMilli.
^tmp
]

{ #category : #'commands - processing' }
SmockCommandExecutor >> executeCommand: aCommand [

	^aCommand key executeWithEvictedValues: aCommand value
]

{ #category : #'commands - processing' }
SmockCommandExecutor >> executeLatestCommandEvicted [

	| commandAndEvicted |
	commandAndEvicted := self latestCommandAndEvicted.
	commandAndEvicted ifNotNil: [
		^ self executeCommand: commandAndEvicted ].
	^nil.
]

{ #category : #'commands - processing' }
SmockCommandExecutor >> initializeExecutor [

	| commandAndEvicted |
	executorRunning := true.
	executorThread := [
		                  [ executorRunning = true ] whileTrue: [
				                  self executeLatestCommandEvicted.
				                  (Delay forMilliseconds: executorWaitingDelay)
					                  wait ] ] forkAt: self threadPriority.

	executorThread name: 'CommandExecutor[' , key printString , ']'
]

{ #category : #'commands - processing' }
SmockCommandExecutor >> latestCommandAndEvicted [

	| last col |
	mutex critical: 
			[col := commandList.
			col isNil ifTrue:[^nil].
			col isEmpty ifTrue: [^nil].
			last := col removeLast->col.
			commandList := OrderedCollection new.
			^last]
]
