"
A SmockCommandExecutorTest is a test class for testing the behavior of SmockCommandExecutor
"
Class {
	#name : #SmockCommandExecutorTest,
	#superclass : #TestCase,
	#instVars : [
		'executor',
		'command'
	],
	#category : #'OpenSmock-Tests-Tools'
}

{ #category : #'dummy methods' }
SmockCommandExecutorTest >> dummyMethod: aArg [

	^'dummy'
]

{ #category : #running }
SmockCommandExecutorTest >> setUp [
    "Initialise l’exécuteur et une commande test avant chaque test"
    executor := SmockCommandExecutor
        key: #MouseMoveEventExecutor
        delay: 500
        priority: Processor userSchedulingPriority.
    command := SmockCommand new
        performer: self;
        message: #dummyMethod:;
        arguments: (Array with: 'test argument');
        yourself
]

{ #category : #running }
SmockCommandExecutorTest >> tearDown [
	executor terminate.
    executor := nil.
    command := nil.

]

{ #category : #running }
SmockCommandExecutorTest >> testCommandScheduling [
	"Ajoute une commande et vérifie qu’elle est bien enregistrée ou planifiée"

	| ret |
	executor stop.
	executor addCommand: command.
	self assert: executor commandList size = 1.
	ret := executor executeLatestCommandEvicted.
	self assert: ret = (self dummyMethod: #value).
	self assert: executor commandList size = 0.
]
