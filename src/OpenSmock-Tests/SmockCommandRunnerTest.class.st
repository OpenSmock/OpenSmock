"
A SmockCommandExecutorTest is a test class for testing the behavior of SmockCommandExecutor
"
Class {
	#name : #SmockCommandRunnerTest,
	#superclass : #TestCase,
	#instVars : [
		'executor',
		'command'
	],
	#category : #'OpenSmock-Tests-Tools'
}

{ #category : #'dummy methods' }
SmockCommandRunnerTest >> dummyMethod: aArg [

	^'dummy'
]

{ #category : #running }
SmockCommandRunnerTest >> setUp [
	"Initialise l’exécuteur et une commande test avant chaque test"

	executor := SmockCommandRunner
		            key: #MouseMoveEventExecutor
		            delay: 100
		            priority: Processor userSchedulingPriority.
	command := SmockCommand new
		           performer: self;
		           message: #dummyMethod:;
		           arguments: (Array with: 'test argument');
		           yourself
]

{ #category : #running }
SmockCommandRunnerTest >> tearDown [
	executor terminate.
    executor := nil.
    command := nil.

]

{ #category : #running }
SmockCommandRunnerTest >> testCommandRunning [
	"Ajoute une commande et vérifie qu’elle est bien enregistrée ou planifiée"

	executor addCommand: command.
	200 milliSeconds wait.
	self assert: executor commandList size = 0.
	executor addCommand: command.
	self assert: executor commandList size = 1.
	100 milliSeconds wait.
	self assert: executor commandList size = 0
]

{ #category : #running }
SmockCommandRunnerTest >> testCommandScheduling [
	"Ajoute une commande et vérifie qu’elle est bien enregistrée ou planifiée"

	| ret |
	executor stop.
	executor addCommand: command.
	self assert: executor commandList size = 1.
	ret := executor executeLatestCommandEvicted.
	self assert: ret = (self dummyMethod: #value).
	self assert: executor commandList size = 0.
]

{ #category : #running }
SmockCommandRunnerTest >> testCommandSchedulingDelay [
	"Ajoute une commande et vérifie qu’elle est bien enregistrée ou planifiée"

	self assert: executor runningWaitingDelay class = Duration.
]
