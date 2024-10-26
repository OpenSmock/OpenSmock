"
OrderedSet personnalisé dans lequel un ajout d'élément dont le equilityBlock retourne vrai. en Overwrite mode, il garde la valeur ajoutée et non la valeur déja présente dans l'OrderedSet.
"
Class {
	#name : #OrderedSet,
	#superclass : #OrderedCollection,
	#instVars : [
		'overwriteMode',
		'equalityBlock'
	],
	#category : #'OpenSmock-Collections'
}

{ #category : #adding }
OrderedSet >> addFirst: newObject [ 
	"Add newObject to the beginning of the receiver. Answer newObject."
	| i |
	i := array indexOf: newObject ifAbsent: [nil].
	i ifNil: [super addFirst: newObject] ifNotNil: [self overwriteMode ifTrue:[array at: i put: newObject] ifFalse:[^array at: i]].
	^ newObject
	
]

{ #category : #adding }
OrderedSet >> addLast: newObject [ 
	"Add newObject to the beginning of the receiver. Answer newObject."
	| i |
	i := array indexOf: newObject ifAbsent: [nil].
	i ifNil: [super addLast: newObject] ifNotNil: [self overwriteMode ifTrue:[array at: i put: newObject] ifFalse:[^array at: i]].
	^ newObject
	
]

{ #category : #accessing }
OrderedSet >> at: index [ 
	^self errorNotIndexable 
]

{ #category : #parameters }
OrderedSet >> basicEquality [
	equalityBlock := [ :a :b | a = b ].
	^ equalityBlock 
]

{ #category : #parameters }
OrderedSet >> equalityBlock [
	equalityBlock ifNil: [ ^ self basicEquality ].
	^ equalityBlock 
]

{ #category : #parameters }
OrderedSet >> identityEquality [
	equalityBlock := [ :a :b | a == b ].
	^ equalityBlock 
]

{ #category : #actions }
OrderedSet >> includes: aValue [
	| tmp |
	firstIndex to: lastIndex do: [ :i | 
		tmp := array at: i.
		(self equalityBlock value: tmp value: aValue)
			ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #accessing }
OrderedSet >> overwriteMode [
	overwriteMode ifNil: [ overwriteMode := true ].
	^ overwriteMode
]

{ #category : #printing }
OrderedSet >> printElementsOn: aStream [
	"The original code used #skip:, but some streams do not support that,
	 and we don't really need it."

	aStream nextPut: $(.
	(firstIndex to: lastIndex) do: [:i | aStream print: (array at: i)] separatedBy: [aStream space].
	aStream nextPut: $)
]

{ #category : #actions }
OrderedSet >> remove: oldObject ifAbsent: absentBlock [

	| index tmp |
	index := firstIndex.
	tmp := (array at: index).
	[index <= lastIndex]
		whileTrue: 
			[(self equalityBlock value: oldObject value: tmp)
				ifTrue: 
					[self removeIndex: index.
					^ oldObject]
				ifFalse: [index := index + 1]].
	^ absentBlock value
]

{ #category : #enumerating }
OrderedSet >> reverseDo: aBlock [
	"Evaluate aBlock with each of the receiver's elements in reverse order as the argument."

	array reverseDo: aBlock
]
