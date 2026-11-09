| fest b0 b1 b2 b3 s2 s3 s4
  opcion tipo codigo nombre genero escenario hora textoHora textoMin textoDur textoCache estado
  instrumento pais textoCant textoAnio duracion cache cantidad anio
  espectaculo repetido campo nuevo textoNuevo nuevoCosto maxDisponible
  lista promedio mayor dic eliminados suma total disponible
  colEscenarios sinRep numeroValido |

numeroValido := [:texto |
    (texto notNil) and: [
        (texto size > 0) and: [
            (texto reject: [:car | '0123456789' includes: car]) isEmpty
        ]
    ]
].

fest := Festival crearfestival: 'UTN extrem' con: 'La plata' con: (Date newDay: 7 monthIndex: 11 year: 2025) con: (Date newDay: 10 monthIndex: 11 year: 2025) con: 80000 con: 100000000.

b0 := Banda crearbanda: 'B001' con: 'Arctic Monkeys' con: 'Rock' con: 'Escenario Principal' con: (Time fromString: '22:00:00') con: 90 con: 150000 con: 'Confirmado' con: 4 con: 2002.
b1 := Banda crearbanda: 'B002' con: 'El Mató a un Policía Motorizado' con: 'Indie' con: 'Escenario Alternativo' con: (Time fromString: '19:30:00') con: 60 con: 45000 con: 'Cancelado' con: 5 con: 2003.
b2 := Banda crearbanda: 'B003' con: 'Peces Raros' con: 'Electrónica' con: 'Carpa Acústica' con: (Time fromString: '23:45:00') con: 75 con: 60000 con: 'Reprogramado' con: 2 con: 2014.
b3 := Banda crearbanda: 'B004' con: 'Los Ramones (Tributo)' con: 'Punk' con: 'Escenario Rock' con: (Time fromString: '18:00:00') con: 40 con: 25000 con: 'Confirmado' con: 4 con: 2018.
s2 := Solista crearsolista: 'S001' con: 'Lali' con: 'Pop' con: 'Escenario Principal' con: (Time fromString: '20:30:00') con: 40 con: 80000 con: 'Confirmado' con: 'Voz' con: 'Argentina'.
s3 := Solista crearsolista: 'S002' con: 'Ed Sheeran' con: 'Pop/Acústico' con: 'Carpa Acústica' con: (Time fromString: '21:00:00') con: 120 con: 180000 con: 'Confirmado' con: 'Guitarra' con: 'Reino Unido'.
s4 := Solista crearsolista: 'S003' con: 'Bizarrap' con: 'Electrónica' con: 'Escenario Alternativo' con: (Time fromString: '01:00:00') con: 90 con: 120000 con: 'Cancelado' con: 'Sintetizador' con: 'Argentina'.

fest agregarfestival: b0.
fest agregarfestival: b2.
fest agregarfestival: b1.
fest agregarfestival: b3.
fest agregarfestival: s2.
fest agregarfestival: s3.
fest agregarfestival: s4.

opcion := ''.
[opcion ~= '0- salir'] whileTrue: [
    opcion := ChoicePrompter choices: #(
        '1- agregar espectaculo'
        '2- buscar y modificar por codigo'
        '3- eliminar por codigo'
        '4- listar confirmados'
        '5- filtrar por genero'
        '6- duracion menor a 45 minutos'
        '7- promedio confirmados y superiores'
        '8- show de mayor costo'
        '9- presupuesto disponible'
        '10- eliminar todos los shows cancelados'
        '11- cantidad por escenario (diccionario)'
        '12- ver todos los espectaculos'
        '0- salir'
    ).
    opcion isNil ifTrue: [opcion := '0- salir'].

    (opcion = '1- agregar espectaculo') ifTrue: [
        tipo := ChoicePrompter choices: #('Solista' 'Banda' 'Cancelar').
        ((tipo = 'Solista') or: [tipo = 'Banda']) ifTrue: [
            codigo := Prompter prompt: 'Codigo unico del espectaculo'.
            ((codigo isNil) or: [codigo = ''])
            ifTrue: [MessageBox notify: 'Codigo vacio o carga cancelada']
            ifFalse: [
                repetido := (fest vertodos) detect: [:e | e vercodigo = codigo] ifNone: [nil].
                repetido notNil
                ifTrue: [MessageBox notify: 'El codigo ya existe']
                ifFalse: [
                    nombre := Prompter prompt: 'Nombre artistico'.
                    genero := Prompter prompt: 'Genero musical'.
                    escenario := Prompter prompt: 'Escenario'.
                    textoHora := Prompter prompt: 'Hora de inicio (0 a 23)'.
                    textoMin := Prompter prompt: 'Minutos de inicio (0 a 59)'.
                    textoDur := Prompter prompt: 'Duracion en minutos (solo numeros enteros)'.
                    textoCache := Prompter prompt: 'Cache contratado (solo numeros enteros)'.
                    estado := ChoicePrompter choices: #('Confirmado' 'Reprogramado' 'Cancelado').
                    ((nombre isNil) or: [genero isNil or: [escenario isNil or: [estado isNil]]])
                    ifTrue: [MessageBox notify: 'Carga cancelada: faltan datos']
                    ifFalse: [
                        ((numeroValido value: textoHora) and: [
                          (numeroValido value: textoMin) and: [
                          (numeroValido value: textoDur) and: [numeroValido value: textoCache]]])
                        ifFalse: [MessageBox notify: 'Hora, minutos, duracion o cache incorrectos']
                        ifTrue: [
                            ((textoHora asNumber < 24) and: [textoMin asNumber < 60])
                            ifFalse: [MessageBox notify: 'Hora o minutos fuera de rango']
                            ifTrue: [
                                hora := Time hours: textoHora asNumber minutes: textoMin asNumber seconds: 0.
                                duracion := textoDur asNumber.
                            cache := textoCache asNumber.
                            (duracion <= 0)
                            ifTrue: [MessageBox notify: 'La duracion debe ser mayor que cero']
                            ifFalse: [
                                espectaculo := nil.
                                (tipo = 'Solista') ifTrue: [
                                    instrumento := Prompter prompt: 'Instrumento principal'.
                                    pais := Prompter prompt: 'Pais de origen'.
                                    ((instrumento notNil) and: [pais notNil]) ifTrue: [
                                        espectaculo := Solista crearsolista: codigo con: nombre con: genero con: escenario con: hora con: duracion con: cache con: estado con: instrumento con: pais
                                    ]
                                ].
                                (tipo = 'Banda') ifTrue: [
                                    textoCant := Prompter prompt: 'Cantidad de integrantes (solo numeros enteros)'.
                                    textoAnio := Prompter prompt: 'Anio de formacion (solo numeros enteros)'.
                                    ((numeroValido value: textoCant) and: [numeroValido value: textoAnio]) ifTrue: [
                                        cantidad := textoCant asNumber.
                                        anio := textoAnio asNumber.
                                        ((cantidad > 0) and: [anio > 0]) ifTrue: [
                                            espectaculo := Banda crearbanda: codigo con: nombre con: genero con: escenario con: hora con: duracion con: cache con: estado con: cantidad con: anio
                                        ]
                                    ]
                                ].
                                espectaculo isNil
                                ifTrue: [MessageBox notify: 'No se cargo: faltan datos o hay valores incorrectos']
                                ifFalse: [
                                    suma := 0.
                                    (fest vertodos) do: [:e | suma := suma + (e calcularCache)].
                                    ((suma + (espectaculo calcularCache)) <= fest verpresupuesto)
                                    ifTrue: [
                                        fest agregarfestival: espectaculo.
                                        MessageBox notify: 'Espectaculo agregado correctamente'
                                    ]
                                    ifFalse: [MessageBox notify: 'Presupuesto insuficiente']
                                ]
                            ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ].

    (opcion = '2- buscar y modificar por codigo') ifTrue: [
        codigo := Prompter prompt: 'Codigo del espectaculo a modificar'.
        codigo notNil ifTrue: [
            espectaculo := (fest vertodos) detect: [:e | e vercodigo = codigo] ifNone: [nil].
            espectaculo isNil
            ifTrue: [MessageBox notify: 'No existe ese codigo']
            ifFalse: [
                MessageBox notify: ('Encontrado: ', espectaculo vernombrear).
                campo := ChoicePrompter choices: #(
                    '1- Codigo'
                    '2- Nombre artistico'
                    '3- Genero'
                    '4- Escenario'
                    '5- Horario'
                    '6- Duracion'
                    '7- Cache'
                    '8- Estado'
                    '9- Instrumento (solista) o integrantes (banda)'
                    '10- Pais (solista) o anio de formacion (banda)'
                    '0- Cancelar'
                ).

                (campo = '1- Codigo') ifTrue: [
                    nuevo := Prompter prompt: 'Nuevo codigo'.
                    ((nuevo notNil) and: [nuevo ~= '']) ifTrue: [
                        repetido := (fest vertodos) detect: [:e | (e vercodigo = nuevo) and: [e ~= espectaculo]] ifNone: [nil].
                        repetido isNil
                        ifTrue: [espectaculo modcodigo: nuevo. MessageBox notify: 'Codigo modificado']
                        ifFalse: [MessageBox notify: 'Ya existe ese codigo']
                    ]
                ].
                (campo = '2- Nombre artistico') ifTrue: [
                    nuevo := Prompter prompt: 'Nuevo nombre'.
                    nuevo notNil ifTrue: [espectaculo modnombre: nuevo]
                ].
                (campo = '3- Genero') ifTrue: [
                    nuevo := Prompter prompt: 'Nuevo genero'.
                    nuevo notNil ifTrue: [espectaculo modgenero: nuevo]
                ].
                (campo = '4- Escenario') ifTrue: [
                    nuevo := Prompter prompt: 'Nuevo escenario'.
                    nuevo notNil ifTrue: [espectaculo modescenario: nuevo]
                ].
                (campo = '5- Horario') ifTrue: [
                    textoHora := Prompter prompt: 'Nueva hora de inicio (0 a 23)'.
                    textoMin := Prompter prompt: 'Nuevos minutos de inicio (0 a 59)'.
                    ((numeroValido value: textoHora) and: [numeroValido value: textoMin])
                    ifFalse: [MessageBox notify: 'Hora de inicio incorrecta']
                    ifTrue: [
                        ((textoHora asNumber < 24) and: [textoMin asNumber < 60])
                        ifFalse: [MessageBox notify: 'Hora o minutos fuera de rango']
                        ifTrue: [
                            hora := Time hours: textoHora asNumber minutes: textoMin asNumber seconds: 0.
                            espectaculo modhora: hora.
                            MessageBox notify: 'Hora de inicio modificada'
                        ]
                    ]
                ].
                (campo = '6- Duracion') ifTrue: [
                    textoDur := Prompter prompt: 'Nueva duracion en minutos (solo numeros enteros)'.
                    (numeroValido value: textoDur)
                    ifFalse: [MessageBox notify: 'Duracion incorrecta']
                    ifTrue: [
                        duracion := textoDur asNumber.
                        (duracion > 0)
                        ifTrue: [espectaculo modduracion: duracion. MessageBox notify: 'Duracion modificada']
                        ifFalse: [MessageBox notify: 'La duracion debe ser mayor que cero']
                    ]
                ].
                (campo = '7- Cache') ifTrue: [
                    textoNuevo := Prompter prompt: 'Nuevo cache (solo enteros)'.
                    (numeroValido value: textoNuevo)
                    ifFalse: [MessageBox notify: 'Cache incorrecto']
                    ifTrue: [
                        nuevo := textoNuevo asNumber.
                        suma := 0.
                        (fest vertodos) do: [:e | suma := suma + (e costototal )].
                        maxDisponible := fest verpresupuesto - suma + (espectaculo costototal ).
                        cache := espectaculo vercache.
                        espectaculo modcache: nuevo.
                        nuevoCosto := espectaculo costototal .
                        espectaculo modcache: cache.
                        (nuevoCosto <= maxDisponible)
                        ifTrue: [espectaculo modcache: nuevo. MessageBox notify: 'Cache modificado']
                        ifFalse: [MessageBox notify: 'Se supera el presupuesto del festival']
                    ]
                ].
                (campo = '8- Estado') ifTrue: [
                    estado := ChoicePrompter choices: #('Confirmado' 'Reprogramado' 'Cancelado').
                    estado notNil ifTrue: [espectaculo modestado: estado. MessageBox notify: 'Estado modificado']
                ].
                (campo = '9- Instrumento (solista) o integrantes (banda)') ifTrue: [
                    (espectaculo class = Solista)
                    ifTrue: [
                        nuevo := Prompter prompt: 'Nuevo instrumento principal'.
                        nuevo notNil ifTrue: [espectaculo modinstrumento: nuevo]
                    ]
                    ifFalse: [
                        textoNuevo := Prompter prompt: 'Nueva cantidad de integrantes (solo enteros)'.
                        (numeroValido value: textoNuevo)
                        ifFalse: [MessageBox notify: 'Cantidad incorrecta']
                        ifTrue: [
                            nuevo := textoNuevo asNumber.
                            suma := 0.
                            (fest vertodos) do: [:e | suma := suma + (e costototal )].
                            maxDisponible := fest verpresupuesto - suma + (espectaculo costototal ).
                            cantidad := espectaculo vercantidad.
                            espectaculo modcantidad: nuevo.
                            nuevoCosto := espectaculo calcularCache.
                            espectaculo modcantidad: cantidad.
                            ((nuevo > 0) and: [nuevoCosto <= maxDisponible])
                            ifTrue: [espectaculo modcantidad: nuevo. MessageBox notify: 'Cantidad modificada']
                            ifFalse: [MessageBox notify: 'Cantidad invalida o presupuesto insuficiente']
                        ]
                    ]
                ].
                (campo = '10- Pais (solista) o anio de formacion (banda)') ifTrue: [
                    (espectaculo class = Solista)
                    ifTrue: [
                        nuevo := Prompter prompt: 'Nuevo pais de origen'.
                        nuevo notNil ifTrue: [espectaculo modpaisorigen: nuevo]
                    ]
                    ifFalse: [
                        textoNuevo := Prompter prompt: 'Nuevo anio de formacion (solo enteros)'.
                        (numeroValido value: textoNuevo)
                        ifFalse: [MessageBox notify: 'Anio incorrecto']
                        ifTrue: [
                            nuevo := textoNuevo asNumber.
                            (nuevo > 0) ifTrue: [espectaculo modanioformacion: nuevo]
                        ]
                    ]
                ].
            ]
        ]
    ].

    (opcion = '3- eliminar por codigo') ifTrue: [
        codigo := Prompter prompt: 'Codigo del espectaculo a eliminar'.
        codigo notNil ifTrue: [
            espectaculo := (fest vertodos) detect: [:e | e vercodigo = codigo] ifNone: [nil].
            espectaculo isNil
            ifTrue: [MessageBox notify: 'No existe ese codigo']
            ifFalse: [
                (MessageBox confirm: ('Eliminar a ', espectaculo vernombrear, '?')) ifTrue: [
                    fest eliminar: espectaculo.
                    MessageBox notify: 'Espectaculo eliminado'
                ]
            ]
        ]
    ].

    (opcion = '4- listar confirmados') ifTrue: [
        Transcript clear.
        lista := (fest vertodos) select: [:e | e verestado = 'Confirmado'].
        Transcript show: 'ESPECTACULOS CONFIRMADOS'. Transcript cr.
        lista isEmpty ifTrue: [Transcript show: 'No hay espectaculos confirmados'. Transcript cr].
        lista do: [:e |
            Transcript show: 'Codigo: ', e vercodigo,
                ' | Artista: ', e vernombrear,
                ' | Genero: ', e vergenero,
                ' | Escenario: ', e verescenario,
                ' | Hora: ', e verhorario displayString,
                ' | Minutos: ', e verduracion displayString,
                ' | Cache: $', e vercache displayString,
                ' | Estado: ', e verestado,
                ' | Total: $', (e calcularCache) displayString.
            Transcript cr.
        ].
        MessageBox notify: 'Listado de confirmados en System Transcript'
    ].

    (opcion = '5- filtrar por genero') ifTrue: [
        genero := Prompter prompt: 'Genero musical a buscar'.
        genero notNil ifTrue: [
            lista := (fest vertodos) select: [:e | e vergenero = genero].
            Transcript clear.
            Transcript show: 'ESPECTACULOS DEL GENERO: ', genero. Transcript cr.
            lista isEmpty ifTrue: [Transcript show: 'No se encontraron espectaculos'. Transcript cr].
            lista do: [:e |
                Transcript show: 'Codigo: ', e vercodigo,
                    ' | Artista: ', e vernombrear,
                    ' | Genero: ', e vergenero,
                    ' | Escenario: ', e verescenario,
                    ' | Hora: ', e verhorario displayString,
                    ' | Minutos: ', e verduracion displayString,
                    ' | Cache: $', e vercache displayString,
                    ' | Estado: ', e verestado,
                    ' | Total: $', (e calcularCache) displayString.
                Transcript cr.
            ].
            MessageBox notify: 'Filtro generado en System Transcript'
        ]
    ].

    (opcion = '6- duracion menor a 45 minutos') ifTrue: [
        lista := (fest vertodos) select: [:e | e verduracion < 45].
        Transcript clear.
        Transcript show: 'DURACION MENOR A 45 MINUTOS'. Transcript cr.
        lista isEmpty ifTrue: [Transcript show: 'No hay shows menores a 45 minutos'. Transcript cr].
        lista do: [:e |
            Transcript show: 'Codigo: ', e vercodigo,
                ' | Artista: ', e vernombrear,
                ' | Genero: ', e vergenero,
                ' | Escenario: ', e verescenario,
                ' | Hora: ', e verhorario displayString,
                ' | Minutos: ', e verduracion displayString,
                ' | Cache: $', e vercache displayString,
                ' | Estado: ', e verestado,
                ' | Total: $', (e calcularCache) displayString.
            Transcript cr.
        ].
        MessageBox notify: 'Listado de shows cortos en System Transcript'
    ].

    (opcion = '7- promedio confirmados y superiores') ifTrue: [
        lista := (fest vertodos) select: [:e | e verestado = 'Confirmado'].
        Transcript clear.
        lista isEmpty
        ifTrue: [Transcript show: 'No hay espectaculos confirmados'. Transcript cr]
        ifFalse: [
            suma := 0.
            lista do: [:e | suma := suma + (e calcularCache)].
            promedio := suma / lista size.
            Transcript show: 'PROMEDIO DE CONFIRMADOS: $', promedio displayString. Transcript cr.
            Transcript show: 'CONFIRMADOS QUE SUPERAN EL PROMEDIO:'. Transcript cr.
            lista do: [:e |
                (e calcularCache > promedio) ifTrue: [
                    Transcript show: 'Codigo: ', e vercodigo,
                        ' | Artista: ', e vernombrear,
                        ' | Genero: ', e vergenero,
                        ' | Escenario: ', e verescenario,
                        ' | Hora: ', e verhorario displayString,
                        ' | Minutos: ', e verduracion displayString,
                        ' | Cache: $', e vercache displayString,
                        ' | Estado: ', e verestado,
                        ' | Total: $', (e calcularCache) displayString.
                    Transcript cr.
                ]
            ]
        ].
        MessageBox notify: 'Promedio calculado en System Transcript'
    ].

    (opcion = '8- show de mayor costo') ifTrue: [
        mayor := nil.
        (fest vertodos) do: [:e |
            mayor isNil
            ifTrue: [mayor := e]
            ifFalse: [((e calcularCache) > (mayor calcularCache)) ifTrue: [mayor := e]]
        ].
        mayor isNil
        ifTrue: [MessageBox notify: 'No hay espectaculos cargados']
        ifFalse: [
            MessageBox notify: ('Mayor costo: ', mayor vernombrear,
                ' - $', (mayor calcularCache) displayString)
        ]
    ].

    (opcion = '9- presupuesto disponible') ifTrue: [
        total := 0.
        (fest vertodos) do: [:e | total := total + (e calcularCache)].
        disponible := fest verpresupuesto - total.
        MessageBox notify: ('Presupuesto: $', fest verpresupuesto displayString,
            ' | Gastado: $', total displayString,
            ' | Disponible: $', disponible displayString)
    ].

    (opcion = '10- eliminar todos los shows cancelados') ifTrue: [
        (MessageBox confirm: 'Eliminar todos los espectaculos cancelados?') ifTrue: [
            lista := (fest vertodos) select: [:e | e verestado = 'Cancelado'].
            eliminados := lista size.
            lista do: [:e | fest eliminar: e].
            MessageBox notify: ('Espectaculos eliminados: ', eliminados displayString)
        ]
    ].

    (opcion = '11- cantidad por escenario (diccionario)') ifTrue: [
        lista := (fest vertodos) reject: [:e | e verestado = 'Cancelado'].
        colEscenarios := lista collect: [:e | e verescenario].
        sinRep := colEscenarios asSet.
        dic := Dictionary new.
        sinRep do: [:el | dic at: el put: (colEscenarios occurrencesOf: el)].
        Transcript clear.
        Transcript show: 'SHOWS PROGRAMADOS POR ESCENARIO'. Transcript cr.
        dic isEmpty ifTrue: [Transcript show: 'No hay espectaculos programados'. Transcript cr].
        dic keysDo: [:clave |
            Transcript show: clave, ' - Cantidad: ', (dic at: clave) displayString.
            Transcript cr
        ].
        MessageBox notify: 'Diccionario generado en System Transcript'
    ].

    (opcion = '12- ver todos los espectaculos') ifTrue: [
        Transcript clear.
        Transcript show: 'TODOS LOS ESPECTACULOS'. Transcript cr.
        (fest vertodos) do: [:e |
            Transcript show: 'Codigo: ', e vercodigo,
                ' | Artista: ', e vernombrear,
                ' | Genero: ', e vergenero,
                ' | Escenario: ', e verescenario,
                ' | Hora: ', e verhorario displayString,
                ' | Minutos: ', e verduracion displayString,
                ' | Cache: $', e vercache displayString,
                ' | Estado: ', e verestado,
                ' | Total: $', (e calcularCache) displayString.
            Transcript cr.
        ].
        Transcript show: 'Total: ', fest tamanio displayString. Transcript cr.
        MessageBox notify: 'Listado completo generado en System Transcript'
    ]
].
MessageBox notify: 'Finalizo el sistema de gestion del festival'.
