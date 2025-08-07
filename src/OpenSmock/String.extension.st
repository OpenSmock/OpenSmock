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
	'ÀÂÄ' do:[ :e | string := string copyReplaceAll: e asString with: 'A'].
	'Ç' do:[ :e | string := string copyReplaceAll: e asString with: 'C'].
	'ÉÈÊË' do:[ :e | string := string copyReplaceAll: e asString with: 'E'].
	'ÎÏ' do:[ :e | string := string copyReplaceAll: e asString with: 'I'].
	'ÔÖ' do:[ :e | string := string copyReplaceAll: e asString with: 'O'].
	'ÙÛÜ' do:[ :e | string := string copyReplaceAll: e asString with: 'U'].
	'Ÿ' do:[ :e | string := string copyReplaceAll: e asString with: 'Y'].
	'àâä' do:[ :e | string := string copyReplaceAll: e asString with: 'a'].
	'ç' do:[ :e | string := string copyReplaceAll: e asString with: 'c'].
	'éèêë' do:[ :e | string := string copyReplaceAll: e asString with: 'e'].
	'îï' do:[ :e | string := string copyReplaceAll: e asString with: 'i'].
	'ôö' do:[ :e | string := string copyReplaceAll: e asString with: 'o'].
	'ùûü' do:[ :e | string := string copyReplaceAll: e asString with: 'u'].
	'ÿ' do:[ :e | string := string copyReplaceAll: e asString with: 'y'].
	^string
]
