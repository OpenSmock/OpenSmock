Class {
	#name : #SmockStringTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockStringTest >> testHaveDigit [

	self assert: 'Pierre' haveDigit equals: false.
	self assert: '' haveDigit equals: false.
	self assert: 'Pierre29' haveDigit equals: true.
	self assert: '29' haveDigit equals: true.
]

{ #category : #tests }
SmockStringTest >> testRemoveChar [

	self assert: ('Smock' removeChar: $c) equals: 'Smok'.
	self assert: ('Smock' removeChar: nil) equals: 'Smock'
]

{ #category : #tests }
SmockStringTest >> testWithoutDiacriticsFR [

	self assert: 'À Â Ä Ç É È Ê Ë Î Ï Ô Ö Ù Û Ü Ÿ' withoutDiacriticsFR equals: 'A A A C E E E E I I O O U U U Y'.
	self assert: 'à â ä ç é è ê ë î ï ô ö ù û ü ÿ' withoutDiacriticsFR equals: 'a a a c e e e e i i o o u u u y'.
]
