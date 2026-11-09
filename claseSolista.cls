"Filed out from Dolphin Smalltalk"!

Espectaculo subclass: #Solista
	instanceVariableNames: 'instrumento paisorigen'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Solista guid: (GUID fromString: '{834fea09-547f-456b-a8e6-14c8313eafa0}')!

Solista comment: ''!

!Solista categoriesForClass!Unclassified! !

!Solista methodsFor!

calcularCache
^self vercache * 1.10!

costototal
^self vercache * 1.10!

iniciar:uncod con:unnamear con:ungen con:unesce con:hini con:dur con:uncache con:unest con:instru con:porigen

super iniciar:uncod con: unnamear con: ungen con: unesce con: hini con: dur con: uncache con: unest.
instrumento:=instru.
paisorigen:=porigen.!

modinstrumento: nuevoinstrumento
instrumento:= nuevoinstrumento.!

modpaisorigen: nuevopaisorigen
paisorigen:=nuevopaisorigen.!

verinstrumento
^instrumento.!

verpaisorigen
^paisorigen.! !

!Solista categoriesForMethods!
calcularCache!public! !
costototal!public! !
iniciar:con:con:con:con:con:con:con:con:con:!public! !
modinstrumento:!public! !
modpaisorigen:!public! !
verinstrumento!public! !
verpaisorigen!public! !
!

!Solista class methodsFor!

crearsolista:uncod con:unnamear con:ungen con:unesce con:hini con:dur con:uncache con:unest con:instru con:porigen

^self new iniciar:uncod con:unnamear con:ungen con:unesce con:hini con:dur con:uncache con:unest con:instru con:porigen ! !

!Solista class categoriesForMethods!
crearsolista:con:con:con:con:con:con:con:con:con:!public! !
!

