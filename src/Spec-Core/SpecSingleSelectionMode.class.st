Class {
	#name : #SpecSingleSelectionMode,
	#superclass : #SpecAbstractSelectionMode,
	#instVars : [
		'selectedIndexValueHolder'
	],
	#category : #'Spec-Core-Widgets-Table'
}

{ #category : #'as yet unclassified' }
SpecSingleSelectionMode >> addSubscription: aSubscription [

	^ selectedIndexValueHolder announcer basicSubscribe: aSubscription
]

{ #category : #selecting }
SpecSingleSelectionMode >> basicSelectIndex: indexToSelect [

	selectedIndexValueHolder value: indexToSelect
]

{ #category : #testing }
SpecSingleSelectionMode >> includesIndex: anIndex [

	^ selectedIndexValueHolder value = anIndex
]

{ #category : #testing }
SpecSingleSelectionMode >> includesItem: anItem [

	^ self selectedItem = anItem
]

{ #category : #initialization }
SpecSingleSelectionMode >> initialize [

	super initialize.
	selectedIndexValueHolder := 0 asValueHolder
]

{ #category : #selection }
SpecSingleSelectionMode >> selectAll [

	"Do nothing"
]

{ #category : #accessing }
SpecSingleSelectionMode >> selectedIndex [
	
	^ selectedIndexValueHolder value
]

{ #category : #accessing }
SpecSingleSelectionMode >> selectedIndexes [
	
	^ self isEmpty
		ifTrue: [ #() ]
		ifFalse: [ { self selectedIndex } ]
]

{ #category : #accessing }
SpecSingleSelectionMode >> selectedItem [

	self selectedIndex = 0 ifTrue: [ ^ nil ].
	^ self model at: self selectedIndex
]

{ #category : #'as yet unclassified' }
SpecSingleSelectionMode >> subscriptions [

	^ selectedIndexValueHolder announcer subscriptions subscriptions
]

{ #category : #selection }
SpecSingleSelectionMode >> unselectAll [
	
	self selectIndex: 0
]

{ #category : #events }
SpecSingleSelectionMode >> whenChangedDo: aBlockClosure [ 
	
	selectedIndexValueHolder whenChangedDo: [ aBlockClosure value: self ]
]