"
SmockCommandExecutor is a complex CommandExecutor with evitedValue management available if command use evictedManagementBlock

Commande to execute to initialize a command executor:
```
SmockCommandExecutor key: #MouseMoveEventExecutor delay: 500 priority: Processor userSchedulingPriority
```

it uses SmockCommand instances.


"
Class {
	#name : #SmockCommandRunner,
	#superclass : #SmockBasicCommandRunner,
	#category : #'OpenSmock-Tools'
}

{ #category : #accessing }
SmockCommandRunner class >> delay: aMilli [

	| tmp milli |
	milli := aMilli isNumber ifTrue:[ aMilli milliSeconds ] ifFalse:[ aMilli ].
	tmp := self new.
	tmp runningWaitingDelay: milli.
	^ tmp
]

{ #category : #accessing }
SmockCommandRunner class >> key: aKey delay: aMilli [

	| tmp milli |
	tmp := self basicNew.
	tmp key: aKey.
	tmp initialize.
	milli := aMilli isNumber
		         ifTrue: [ aMilli milliSeconds ]
		         ifFalse: [ aMilli ].
	tmp runningWaitingDelay: milli.
	^ tmp
]

{ #category : #accessing }
SmockCommandRunner class >> key: aKey delay: aMilli priority: aThreadPriority [
	| tmp milli |
	milli := aMilli isNumber
		         ifTrue: [ aMilli milliSeconds ]
		         ifFalse: [ aMilli ].
	tmp := self basicNew.
	tmp key: aKey.
	tmp threadPriority: aThreadPriority.
	tmp initialize.
	tmp runningWaitingDelay: milli.
	^ tmp
]

{ #category : #'commands - processing' }
SmockCommandRunner >> executeCommand: aCommand [

	^aCommand key executeWithEvictedValues: aCommand value
]

{ #category : #'commands - processing' }
SmockCommandRunner >> executeLatestCommandEvicted [

	| commandAndEvicted |
	commandAndEvicted := self latestCommandAndEvicted.
	commandAndEvicted ifNotNil: [
		^ self executeCommand: commandAndEvicted ].
	^nil.
]

{ #category : #'commands - processing' }
SmockCommandRunner >> initializeRunner [

	| commandAndEvicted |
	isRunning := true.
	runningThread := [
		                  [ isRunning = true ] whileTrue: [
				                  self executeLatestCommandEvicted.
				                  (Delay forMilliseconds:
					                   self runningWaitingDelay asMilliSeconds) wait ] ]
		                  forkAt: self threadPriority.

	runningThread name: 'SmockCommandRunner[' , key printString , ']'
]

{ #category : #'commands - processing' }
SmockCommandRunner >> latestCommandAndEvicted [

	| last col |
	mutex critical: 
			[col := commandList.
			col isNil ifTrue:[^nil].
			col isEmpty ifTrue: [^nil].
			last := col removeLast->col.
			commandList := OrderedCollection new.
			^last]
]
