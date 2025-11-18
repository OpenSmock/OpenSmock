"
SmockBasicCommandExecutor is a basic command executor without evictedValues management.


"
Class {
	#name : #SmockBasicCommandExecutor,
	#superclass : #Object,
	#instVars : [
		'mutex',
		'commandList',
		'executorWaitingDelay',
		'executorThread',
		'executorRunning',
		'key',
		'priority',
		'threadPriority'
	],
	#category : #'OpenSmock-Tools'
}

{ #category : #adding }
SmockBasicCommandExecutor >> addCommand: aCommand [
	| col |
	mutex critical: 
			[col := commandList.
			col isNil ifTrue:[commandList := OrderedCollection new. col := commandList].
			col addLast: aCommand]
]

{ #category : #accessing }
SmockBasicCommandExecutor >> commandList [

	mutex critical: 
			[commandList isNil ifTrue: [commandList := OrderedCollection new].
			^commandList]
]

{ #category : #accessing }
SmockBasicCommandExecutor >> commandList: anObject [

	commandList := anObject
]

{ #category : #private }
SmockBasicCommandExecutor >> executeCommand: aCommand [

	aCommand execute.
]

{ #category : #private }
SmockBasicCommandExecutor >> executeLatestCommand [

	| command |
	command := self latestCommand.
	command isNil ifFalse: [ ^ self executeCommand: command ].
	^nil
]

{ #category : #accessing }
SmockBasicCommandExecutor >> executorThread [

	^executorThread
]

{ #category : #accessing }
SmockBasicCommandExecutor >> executorThread: anObject [

	executorThread := anObject
]

{ #category : #accessing }
SmockBasicCommandExecutor >> executorWaitingDelay [

	^executorWaitingDelay
]

{ #category : #accessing }
SmockBasicCommandExecutor >> executorWaitingDelay: anObject [

	executorWaitingDelay := anObject
]

{ #category : #initialization }
SmockBasicCommandExecutor >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	key isNil ifTrue: [ key := #default ].
	executorWaitingDelay := 100.
	self mutex.
	self initializeExecutor.

	^self
]

{ #category : #private }
SmockBasicCommandExecutor >> initializeExecutor [

	| command |
	executorRunning := true.
	executorThread := [
		                  [ executorRunning = true ] whileTrue: [
										self executeLatestCommand.
				                  (Delay forMilliseconds: executorWaitingDelay)
					                  wait ] ] fork "At: Kernel.ProcessorScheduler.UserInterruptPriority"
]

{ #category : #'start - stop' }
SmockBasicCommandExecutor >> isStarted [

	^executorRunning = true
]

{ #category : #'start - stop' }
SmockBasicCommandExecutor >> isStopped [

	^executorRunning = false
]

{ #category : #accessing }
SmockBasicCommandExecutor >> key [

	^key
]

{ #category : #accessing }
SmockBasicCommandExecutor >> key: anObject [

	key := anObject
]

{ #category : #accessing }
SmockBasicCommandExecutor >> latestCommand [

	| last col |
	mutex critical: 
			[col := commandList.
			col isNil ifTrue:[^nil].
			col isEmpty ifTrue: [^nil].
			last := col last.
			commandList := OrderedCollection new.
			^last]
]

{ #category : #accessing }
SmockBasicCommandExecutor >> mutex [

	mutex isNil ifTrue: [ mutex := Semaphore forMutualExclusion ].
	^ mutex 
]

{ #category : #accessing }
SmockBasicCommandExecutor >> mutex: anObject [

	mutex := anObject
]

{ #category : #printing }
SmockBasicCommandExecutor >> printOn: aStream [
super printOn:aStream.
aStream nextPutAll: ' : ', self key printString.
^self
]

{ #category : #accessing }
SmockBasicCommandExecutor >> priority [
	priority isNil ifTrue:[priority := Processor userSchedulingPriority].
	^priority
]

{ #category : #accessing }
SmockBasicCommandExecutor >> priority: anObject [

	priority := anObject.
	self executorThread priority: anObject
]

{ #category : #initialization }
SmockBasicCommandExecutor >> release [
	"Initialize a newly created instance. This method must answer the receiver."

	super release.
	self terminate.

	^ self
]

{ #category : #'start - stop' }
SmockBasicCommandExecutor >> start [

	self isStopped ifTrue:[
		executorRunning := true.
		self initializeExecutor.
	].
]

{ #category : #'start - stop' }
SmockBasicCommandExecutor >> stop [

	executorRunning := false
]

{ #category : #'start - stop' }
SmockBasicCommandExecutor >> terminate [

	self stop.
	executorThread isNil
		ifFalse: 
			[executorThread terminate.
			executorThread := nil]
]

{ #category : #accessing }
SmockBasicCommandExecutor >> threadPriority [

	threadPriority ifNil: [threadPriority := Processor userSchedulingPriority].
	^threadPriority
]

{ #category : #accessing }
SmockBasicCommandExecutor >> threadPriority: anObject [

	threadPriority := anObject
]
