"
I am a Display Sector.
I am used to display a sector on a geo view.

Aperture in radians
Orientation in azimuths (radians)
Radius in meters
"
Class {
	#name : #SmockDSector,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'radius',
		'orientation',
		'aperture'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDSector >> = aDSector [

	super = aDSector ifFalse: [ ^ false ].
	self aperture ~= aDSector aperture ifTrue: [ ^ false ].
	self orientation ~= aDSector orientation ifTrue: [ ^ false ].
	self radius ~= aDSector radius ifTrue: [ ^ false ].
	
	^ true
]

{ #category : #accessing }
SmockDSector >> aperture [
	^ aperture
]

{ #category : #accessing }
SmockDSector >> aperture: anObject [
	aperture := anObject
]

{ #category : #copying }
SmockDSector >> copy [

	| copy |
	copy := super copy.
	copy radius: self radius.
	copy aperture: self aperture.
	copy orientation: self orientation.
	^ copy
]

{ #category : #accessing }
SmockDSector >> defaultIsTranslatedByParent [

	^ true
]

{ #category : #accessing }
SmockDSector >> orientation [
	^ orientation
]

{ #category : #accessing }
SmockDSector >> orientation: anObject [
	orientation := anObject
]

{ #category : #accessing }
SmockDSector >> radius [
	^ radius
]

{ #category : #accessing }
SmockDSector >> radius: anObject [
	radius := anObject
]
