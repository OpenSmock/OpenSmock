"
A GeoViewAttributesDisplayFilterTest is a test class for testing the behavior of GeoViewAttributesDisplayFilter
"
Class {
	#name : #SmockAttributesDisplayFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'filter'
	],
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #running }
SmockAttributesDisplayFilterTest >> setUp [
	super setUp.

	filter := SmockAttributesDisplayFilter new.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testAddAttribute [

	filter addAttribute: #typeA.
	self assert: (filter attributes includes: #typeA).
	
	filter addAttribute: #typeB.
	self assert: (filter attributes includes: #typeB).
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testAttributes [

	self assert: filter attributes isEmpty.
	
	filter attributes: { #typeA . #typeB }.
	self deny: filter attributes isEmpty.
	
	filter attributes: nil.
	self assert: filter attributes isEmpty.
]

{ #category : #tests }
SmockAttributesDisplayFilterTest >> testConfigureFromDShapeToGShape [

	| dShape gShape |
	dShape := SmockDShape new.
	dShape displayFilter: ((SmockAttributesDisplayFilter new) addAttribute: #typeA).
	
	gShape := SmockGShape2D new.
	self assert: gShape displayMask isNil.
	
	filter configureFromDShape: dShape toGShape: gShape.
	self assert: gShape displayMask equals: 0.
	
	filter addAttribute: #typeA.
	filter configureFromDShape: dShape toGShape: gShape.
	self assert: gShape displayMask equals: 1.
	
	filter addAttribute: #typeB.
	filter configureFromDShape: dShape toGShape: gShape.
	self assert: gShape displayMask equals: 1.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testIsEmpty [

	self assert: filter isEmpty.
	
	filter addAttribute: #typeA.
	self deny: filter isEmpty.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testIsFilteringNothing [

	self assert: filter isFilteringNothing.
	
	filter addAttribute: #typeA.
	self deny: filter isFilteringNothing.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testIsGShapeFiltered [

	| gShape |
	self assert: (filter isGShapeFiltered: nil). "filtered because this is not a shape"
	
	gShape := SmockGShape2D new.
	self deny: (filter isGShapeFiltered: gShape). "not filtered because filter is empty"
	
	filter attributes: { #typeA }.
	self assert: (filter isGShapeFiltered: gShape). "filtered because the gShape haven't display mask"
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testIsGShapeUnfiltered [

	self deny: (filter isGShapeUnfiltered: nil).
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testMask [

	self assert: filter mask equals: 0.
	
	filter addAttribute: #typeA.
	self assert: filter mask equals: 1. 
	
	filter addAttribute: #typeB.
	self assert: filter mask equals: 3. 
	
	filter removeAttribute: #typeB.
	self assert: filter mask equals: 1. 
	
	filter removeAttribute: #typeA.
	self assert: filter mask equals: 0. 
	
	filter attributes: { #typeA . #typeB }.
	self assert: filter mask equals: 3.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testRemoveAttribute [

	filter addAttribute: #typeA.
	self assert: (filter attributes includes: #typeA).
	
	filter removeAttribute: #typeA.
	self deny: (filter attributes includes: #typeA).
	self assert: filter isEmpty.
]
