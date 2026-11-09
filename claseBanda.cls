"Filed out from Dolphin Smalltalk"!

Espectaculo subclass: #Banda
	instanceVariableNames: 'cantidad anioformacion'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Banda guid: (GUID fromString: '{8a5928ac-1df7-48ea-9cba-9de17c58270b}')!

Banda comment: ''!

!Banda categoriesForClass!Unclassified! !

!Banda methodsFor!

calcularCache
^self vercache * (1 + (self vercantidad * 0.02))!

costototal
^self vercache * (1 + (self vercantidad * 0.02))!

iniciar:uncod con:unnamear con:ungen con:unesce con:hini con:dur con:uncache con:unest con:unacanti con:aniofor

super iniciar:uncod con: unnamear con: ungen con: unesce con: hini con: dur con: uncache con: unest.
cantidad:=unacanti.
anioformacion:=aniofor.!

modanioformacion: nuevoanioformacion
anioformacion:=nuevoanioformacion.!

modcantidad: nuevacantidad
cantidad:=nuevacantidad.!

veranioformacion
^anioformacion.!

vercantidad
^cantidad.! !

!Banda categoriesForMethods!
calcularCache!public! !
costototal!public! !
iniciar:con:con:con:con:con:con:con:con:con:!public! !
modanioformacion:!public! !
modcantidad:!public! !
veranioformacion!public! !
vercantidad!public! !
!

!Banda class methodsFor!

crearbanda:uncod con:unnamear con:ungen con:unesce con:hini con:dur con:uncache con:unest con:unacanti con:aniofor
^self new iniciar:uncod con:unnamear con:ungen con:unesce con:hini con:dur con:uncache con:unest con:unacanti con:aniofor.! !

!Banda class categoriesForMethods!
crearbanda:con:con:con:con:con:con:con:con:con:!public! !
!

