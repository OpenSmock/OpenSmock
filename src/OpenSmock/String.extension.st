Extension { #name : #String }

{ #category : #'*OpenSmock' }
String >> haveDigit [
	"Return whether the receiver has at least one digit"
	"'N2' haveDigit >>> true"
	"'Pierre29' haveDigit >>> true"
	
	self do: [:c | c isDigit ifTrue: [^ true]].
	self ifEmpty: [^false].
	^ false
]

{ #category : #'*OpenSmock' }
String >> removeChar: aChar [

	| rs ws |
	rs := self readStream.
	ws := WriteStream on: self class new.
	[ rs atEnd ] whileFalse: [
			| str |
			str := rs upTo: aChar.
			ws nextPutAll: str ].
	rs close.
	ws close.
	^ ws contents
]

{ #category : #'*OpenSmock' }
String >> withoutDiacriticsFR [
	
	| string |
	string := self copy.
	'ÀÂÄ' do:[ :e | string := string findAllString: e asString replaceWith: 'A'].
	'Ç' do:[ :e | string := string findAllString: e asString replaceWith: 'C'].
	'ÉÈÊË' do:[ :e | string := string findAllString: e asString replaceWith: 'E'].
	'ÎÏ' do:[ :e | string := string findAllString: e asString replaceWith: 'I'].
	'ÔÖ' do:[ :e | string := string findAllString: e asString replaceWith: 'O'].
	'ÙÛÜ' do:[ :e | string := string findAllString: e asString replaceWith: 'U'].
	'Ÿ' do:[ :e | string := string findAllString: e asString replaceWith: 'Y'].
	'àâä' do:[ :e | string := string findAllString: e asString replaceWith: 'a'].
	'ç' do:[ :e | string := string findAllString: e asString replaceWith: 'c'].
	'éèêë' do:[ :e | string := string findAllString: e asString replaceWith: 'e'].
	'îï' do:[ :e | string := string findAllString: e asString replaceWith: 'i'].
	'ôö' do:[ :e | string := string findAllString: e asString replaceWith: 'o'].
	'ùûü' do:[ :e | string := string findAllString: e asString replaceWith: 'u'].
	'ÿ' do:[ :e | string := string findAllString: e asString replaceWith: 'y'].
	^string
]
