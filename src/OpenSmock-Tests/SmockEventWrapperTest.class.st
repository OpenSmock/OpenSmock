"
A SmockEventWrapperTest is a test class for testing the behavior of SmockEventWrapper
"
Class {
	#name : #SmockEventWrapperTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockEventWrapperTest >> testInitialize [

	| wrapper |
	wrapper := SmockEventWrapper new.
	self deny: wrapper isConsumed.
	self assert: wrapper event isNil.
	self assert: wrapper timestamp <= DateAndTime now.
	
]

{ #category : #tests }
SmockEventWrapperTest >> testIsConsumed [

	| wrapper |
	wrapper := SmockEventWrapper new.
	wrapper isConsumed: true.
	self assert: wrapper isConsumed.
	
	wrapper isConsumed: false.
	self deny: wrapper isConsumed.
	
]

{ #category : #tests }
SmockEventWrapperTest >> testWrap [

	| wrapper announcement |
	announcement := Announcement new.
	wrapper := SmockEventWrapper wrap: announcement.
	self assert: wrapper event equals: announcement.
	self deny: wrapper isConsumed.
]
