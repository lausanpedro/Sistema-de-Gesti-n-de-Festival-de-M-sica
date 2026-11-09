"Filed out from Dolphin Smalltalk"!

Object subclass: #Espectaculo
	instanceVariableNames: 'codigo nombreartistico genero escenario horainicio duracion cache estado'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Espectaculo guid: (GUID fromString: '{0fa045d6-3046-4d9a-bb57-0b4892f231c4}')!

Espectaculo comment: ''!

!Espectaculo categoriesForClass!Unclassified! !

!Espectaculo methodsFor!

iniciar:cod con:unnamear con:ungen con:unesce con:hini con:dur con:uncache con:unest
codigo :=cod.
nombreartistico:=unnamear.
genero:=ungen.
escenario:=unesce.
horainicio:=hini.
duracion:=dur.
cache:=uncache.
estado:=unest!

modcache: nuevocache
cache :=nuevocache.!

modcodigo: nuevocodigo
codigo:=nuevocodigo.!

modduracion: nuevaduracion
duracion :=nuevaduracion.!

modescenario: nuevoescenario
escenario :=nuevoescenario .!

modestado: nuevoestado
estado :=nuevoestado.!

modgenero: nuevogenero
genero :=nuevogenero.!

modhora: nuevahora
horainicio :=nuevahora.!

modnombre: nuevonomb
nombreartistico :=nuevonomb .!

vercache
^cache.!

vercodigo
^codigo.!

verduracion
^duracion.!

verescenario
^escenario.!

verestado
^estado.!

vergenero
^genero.!

verhorario
^horainicio.!

vernombrear
^nombreartistico. ! !

!Espectaculo categoriesForMethods!
iniciar:con:con:con:con:con:con:con:!public! !
modcache:!public! !
modcodigo:!public! !
modduracion:!public! !
modescenario:!public! !
modestado:!public! !
modgenero:!public! !
modhora:!public! !
modnombre:!public! !
vercache!public! !
vercodigo!public! !
verduracion!public! !
verescenario!public! !
verestado!public! !
vergenero!public! !
verhorario!public! !
vernombrear!public! !
!

!Espectaculo class methodsFor!

crearespectaculo:cod con:unnamear con:ungen con:unesce con:hini con:dur con:uncache con:unest
^self new iniciar: cod con: unnamear con: ungen con: unesce con: hini con: dur con: uncache con: unest.! !

!Espectaculo class categoriesForMethods!
crearespectaculo:con:con:con:con:con:con:con:!public! !
!

