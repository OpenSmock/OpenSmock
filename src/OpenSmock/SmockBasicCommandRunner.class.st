"
SmockBasicCommandExecutor is a basic command executor without evictedValues management.


"
Class {
	#name : #SmockBasicCommandRunner,
	#superclass : #Object,
	#instVars : [
		'mutex',
		'commandList',
		'key',
		'priority',
		'threadPriority',
		'isRunning',
		'runningThread',
		'runningWaitingDelay'
	],
	#category : #'OpenSmock-Tools'
}

{ #category : #adding }
SmockBasicCommandRunner >> addCommand: aCommand [
	| col |
	mutex critical: 
			[col := commandList.
			col isNil ifTrue:[commandList := OrderedCollection new. col := commandList].
			col addLast: aCommand]
]

{ #category : #accessing }
SmockBasicCommandRunner >> commandList [

	mutex critical: 
			[commandList isNil ifTrue: [commandList := OrderedCollection new].
			^commandList]
]

{ #category : #accessing }
SmockBasicCommandRunner >> commandList: anObject [

	commandList := anObject
]

{ #category : #private }
SmockBasicCommandRunner >> executeCommand: aCommand [

	aCommand execute.
]

{ #category : #private }
SmockBasicCommandRunner >> executeLatestCommand [

	| command |
	command := self latestCommand.
	command isNil ifFalse: [ ^ self executeCommand: command ].
	^nil
]

{ #category : #initialization }
SmockBasicCommandRunner >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	key isNil ifTrue: [ key := #default ].
	runningWaitingDelay := 100 milliSeconds.
	self mutex.
	self initializeRunner.

	^ self
]

{ #category : #private }
SmockBasicCommandRunner >> initializeRunner [

	| command |
	isRunning := true.
	runningThread := [
		                  [ isRunning = true ] whileTrue: [
										self executeLatestCommand.
				                  (Delay forMilliseconds: runningWaitingDelay)
					                  wait ] ] fork "At: Kernel.ProcessorScheduler.UserInterruptPriority"
]

{ #category : #'start - stop' }
SmockBasicCommandRunner >> isStarted [

	^isRunning = true
]

{ #category : #'start - stop' }
SmockBasicCommandRunner >> isStopped [

	^isRunning = false
]

{ #category : #accessing }
SmockBasicCommandRunner >> key [

	^key
]

{ #category : #accessing }
SmockBasicCommandRunner >> key: anObject [

	key := anObject
]

{ #category : #accessing }
SmockBasicCommandRunner >> latestCommand [

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
SmockBasicCommandRunner >> mutex [

	mutex isNil ifTrue: [ mutex := Semaphore forMutualExclusion ].
	^ mutex 
]

{ #category : #accessing }
SmockBasicCommandRunner >> mutex: anObject [

	mutex := anObject
]

{ #category : #printing }
SmockBasicCommandRunner >> printOn: aStream [
super printOn:aStream.
aStream nextPutAll: ' : ', self key printString.
^self
]

{ #category : #accessing }
SmockBasicCommandRunner >> priority [
	priority isNil ifTrue:[priority := Processor userSchedulingPriority].
	^priority
]

{ #category : #accessing }
SmockBasicCommandRunner >> priority: anObject [

	priority := anObject.
	self runnerThread priority: anObject
]

{ #category : #initialization }
SmockBasicCommandRunner >> release [
	"Initialize a newly created instance. This method must answer the receiver."

	super release.
	self terminate.

	^ self
]

{ #category : #accessing }
SmockBasicCommandRunner >> runnerThread [

	^runningThread
]

{ #category : #accessing }
SmockBasicCommandRunner >> runningThread: anObject [

	runningThread := anObject
]

{ #category : #accessing }
SmockBasicCommandRunner >> runningWaitingDelay [

	^runningWaitingDelay
]

{ #category : #accessing }
SmockBasicCommandRunner >> runningWaitingDelay: anObject [

	runningWaitingDelay := anObject
]

{ #category : #'start - stop' }
SmockBasicCommandRunner >> start [

	self isStopped ifTrue:[
		isRunning := true.
		self initializeRunner.
	].
]

{ #category : #'start - stop' }
SmockBasicCommandRunner >> stop [

	isRunning := false
]

{ #category : #'start - stop' }
SmockBasicCommandRunner >> terminate [

	self stop.
	runningThread isNil
		ifFalse: 
			[runningThread terminate.
			runningThread := nil]
]

{ #category : #accessing }
SmockBasicCommandRunner >> threadPriority [

	threadPriority ifNil: [threadPriority := Processor userSchedulingPriority].
	^threadPriority
]

{ #category : #accessing }
SmockBasicCommandRunner >> threadPriority: anObject [

	threadPriority := anObject
]
