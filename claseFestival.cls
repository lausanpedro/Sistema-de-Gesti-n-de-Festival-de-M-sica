"Filed out from Dolphin Smalltalk"!

Object subclass: #Festival
	instanceVariableNames: 'nombrefestival ciudad fechainicio fechafinal capacidad presupuestomaximo conjespectaculo'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Festival guid: (GUID fromString: '{ff5b7363-15a3-49bd-896e-b42b3f210369}')!

Festival comment: ''!

!Festival categoriesForClass!Unclassified! !

!Festival methodsFor!

agregarfestival:unespe
| repetido suma |
repetido := conjespectaculo detect: [:e | e vercodigo = unespe vercodigo] ifNone: [nil].
repetido notNil ifTrue: [^false].
suma := 0.
conjespectaculo do: [:e | suma := suma + e costototal].
((suma + unespe costototal) > presupuestomaximo) ifTrue: [^false].
conjespectaculo add: unespe.
^true!

eliminar:unespe
conjespectaculo remove: unespe ifAbsent: [^false].
^true!

esvacia
^conjespectaculo isEmpty.
!

existe:unespe
^conjespectaculo includes: unespe.


!

iniciar:unnom con:unacity con:unafeini con:fefini con:capa con:premax

nombrefestival:=unnom.
ciudad:=unacity.
fechainicio:=unafeini.
fechafinal:=fefini.
capacidad:=capa.
presupuestomaximo:=premax.
conjespectaculo:= OrderedCollection new.


!

modcapacidad:nuevacapacidad
capacidad:=nuevacapacidad!

modciudad: nuevaciudad
ciudad:=nuevaciudad.
!

modffinal:nuevofinal
fechafinal:=nuevofinal!

modfinicio:nuevafecha
fechainicio:=nuevafecha!

modnombre:nuevonombre
nombrefestival:=nuevonombre.


!

modpresupuesto:nuevopresupuesto
presupuestomaximo:=nuevopresupuesto!

recuperar: i
^conjespectaculo at: i.
!

tamanio
^conjespectaculo size.
!

vercapacidad
^capacidad!

verciudad
^ciudad!

verffinal
^fechafinal!

verfinicio
^fechainicio!

vernombre
^nombrefestival!

verpresupuesto
^presupuestomaximo!

vertodos
^conjespectaculo. ! !

!Festival categoriesForMethods!
agregarfestival:!public! !
eliminar:!public! !
esvacia!public! !
existe:!public! !
iniciar:con:con:con:con:con:!public! !
modcapacidad:!public! !
modciudad:!public! !
modffinal:!public! !
modfinicio:!public! !
modnombre:!public! !
modpresupuesto:!public! !
recuperar:!public! !
tamanio!public! !
vercapacidad!public! !
verciudad!public! !
verffinal!public! !
verfinicio!public! !
vernombre!public! !
verpresupuesto!public! !
vertodos!public! !
!

!Festival class methodsFor!

crearfestival:unnom con:unacity con:unafeini con:fefini con:capa con:premax
^self new iniciar: unnom con: unacity con: unafeini con: fefini con: capa con: premax.
! !

!Festival class categoriesForMethods!
crearfestival:con:con:con:con:con:!public! !
!

