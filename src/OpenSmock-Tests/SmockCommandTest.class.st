"
A SmockCommandTest is a test class for testing the behavior of SmockCommand
"
Class {
	#name : #SmockCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'performerMock',
		'command'
	],
	#category : #'OpenSmock-Tests-Tools'
}

{ #category : #running }
SmockCommandTest >> setUp [
    "Crée une commande avec un exécuteur factice"
    performerMock := Object new.
    command := SmockCommand new
        performer: performerMock;
        message: #printString;
        arguments: #();
        yourself

]

{ #category : #running }
SmockCommandTest >> tearDown [
    command := nil.
    performerMock := nil.
]

{ #category : #running }
SmockCommandTest >> testInitialization [
    "Vérifie que la commande est correctement initialisée"
    self assert: command performer equals: performerMock.
    self assert: command message equals: #printString.
    self assert: command arguments equals: #().
]

{ #category : #running }
SmockCommandTest >> testPerformExecution [
    "Teste si la commande appelle bien le message sur le performer"
    | result |
    command performer: 'Hello world'.
    command message: #size.
    command arguments: #().
    result := command execute.
    self assert: result equals: 11.

]
