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

	filter := SmockAttributesDisplayFilter fromObjects: { #typeA . #typeB }.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testAllowAllAttributes [

	filter := SmockAttributesDisplayFilter fromObjects: { #typeA. #typeB }.
	filter allowAllAttributes.
	
	self assert: filter allowedAttributes equals: { #typeA . #typeB } asSet
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testAllowAttribute [

	filter := SmockAttributesDisplayFilter fromObjects: { #typeA. #typeB }.
	filter allowAttribute: #typeC.
	
	self deny: (filter allowedAttributes includes: #typeC).
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testAllowAttributes [

	filter := SmockAttributesDisplayFilter fromObjects: { #typeA . #typeB }.
	self assert: filter allowedAttributes equals: { #typeA . #typeB } asSet
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testAllowedAttributes [

	self assert: filter allowedAttributes equals: { #typeA . #typeB } asSet
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testAttributeList [

	filter attributeList: SmockAttributeList new.
	self assert: filter attributes isEmpty.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testAttributes [

	self deny: filter attributes isEmpty.
	
	filter attributeList: SmockAttributeList new.
	self assert: filter attributes isEmpty
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testDisallowAllAttributes [

	filter := SmockAttributesDisplayFilter fromObjects: { #typeA. #typeB }.
	filter disallowAllAttributes.
	self assert: filter allowedAttributes isEmpty.
	
	filter allowAllAttributes.
	self assert: filter allowedAttributes equals: { #typeA . #typeB } asSet.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testDisallowAttribute [

	filter := SmockAttributesDisplayFilter fromObjects: { #typeA. #typeB }.
	filter disallowAttribute: #typeA.
	
	self deny: (filter allowedAttributes includes: #typeA).
	self assert: (filter allowedAttributes includes: #typeB).
	
	filter disallowAttribute: #typeB.
	self assert: filter allowedAttributes isEmpty.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testDisallowAttributes [

	filter := SmockAttributesDisplayFilter fromObjects: { #typeA . #typeB }.
	filter disallowAttributes: { #typeA . #typeB }.
	self deny: filter allowedAttributes equals: { #typeA . #typeB } asSet
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testDisplayObjectsWithoutAttributes [

	| gShape |
	filter attributeList: (SmockAttributeList fromObject: #typeA).	
	self assert: filter displayObjectsWithoutAttributes.
	
	filter displayObjectsWithoutAttributes: false.
	self deny: filter displayObjectsWithoutAttributes.
	
	gShape := SmockGShape2D new.
	self deny: (filter isGShapeDisplayed: gShape). "displayed because the object haven't attributes to autorize the display but the filter is setup to autorize that"
	
	
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testFromAttributeList [

	| list |
	list := SmockAttributeList fromObjects: { #typeA . #typeB }.
	filter := SmockAttributesDisplayFilter fromAttributeList: list.
	self assert: filter attributes equals: list attributes.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testIsDisplayNothing [

	self deny: filter isDisplayNothing.

	filter attributeList: (SmockAttributeList new).	
	self assert: filter isDisplayNothing.
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testIsGShapeDisplayed [

	| gShape |
	filter attributeList: SmockAttributeList new. "reset filter configuration"
	self deny: (filter isGShapeDisplayed: nil). "not displayed because args is not a displayable object, it is nil"
	
	gShape := SmockGShape2D new.
	self deny: (filter isGShapeDisplayed: gShape). "not displayed because the filter haven't attributes to autorize the display"
	
	filter attributeList: (SmockAttributeList fromObject: #typeA).
	self assert: (filter isGShapeDisplayed: gShape). "displayed because the object haven't attributes to autorize the display BUT the filter is setup to autorize that with displayObjectsWithoutAttributes property"
	self deny: (filter isGShapeDisplayed: nil). "not displayed because args is not a displayable object, it is nil"
	
	gShape := SmockGShape2D new.
	gShape displayMask: (filter maskForAttribute: #typeA).
	self assert: (filter isGShapeDisplayed: gShape). "display because this is an allowed type"
	
	gShape displayMask: (filter maskForAttribute: #typeB).
	self deny: (filter isGShapeDisplayed: gShape). "not display because this is not an allowed type"
	
	gShape displayMask: nil.
	self assert: (filter isGShapeDisplayed: gShape). "displayed because the object haven't attributes to autorize the display BUT the filter is setup to autorize that with displayObjectsWithoutAttributes property"
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testIsGShapeNotDisplayed [

	self assert: (filter isGShapeNotDisplayed: nil).
]

{ #category : #running }
SmockAttributesDisplayFilterTest >> testMask [

	filter attributeList: SmockAttributeList new. "reset filter configuration"
	self assert: filter mask equals: 0.
	
	filter attributeList: (SmockAttributeList fromObject: #typeA).
	self assert: filter mask equals: 1. 
	
	filter attributeList: (SmockAttributeList fromObjects: { #typeA . #typeB }).
	self assert: filter mask equals: 3. 
	
	filter attributeList: (SmockAttributeList fromObject: #typeA).
	self assert: filter mask equals: 1. 
	
	filter attributeList: SmockAttributeList new.
	self assert: filter mask equals: 0. 
	
	filter attributeList: (SmockAttributeList fromObjects: { #typeA . #typeB }).
	self assert: filter mask equals: 3.
]

{ #category : #tests }
SmockAttributesDisplayFilterTest >> testProcessDShapeToGShape [

	| dShape gShape |
	
	dShape := SmockDShape new.
	dShape displayFilter: (SmockAttributeList fromObject: #typeA).
	
	gShape := SmockGShape2D new.
	self assert: gShape displayMask isNil.
	
	filter processDShape: dShape toGShape: gShape.
	self assert: gShape displayMask equals: 2.
	
	
]
