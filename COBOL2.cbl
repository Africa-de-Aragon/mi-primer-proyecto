       identification division.
       program-id. COBOL2.
       environment division.
       data division.
       working-storage section.
       01 WS-CONTINENTES.
           05 CONT-ITEM OCCURS 3 TIMES INDEXED BY IDX.
               10 CONT-NOMBRE    PIC X(20).
               10 CONT-HABITANTES PIC 9(9).
       01 WS-CONTINENTES-REDEF REDEFINES WS-CONTINENTES.
           05 CONTINENTES-REDEF OCCURS 3 TIMES INDEXED BY IDX-REDEF.
               10 REDEF-NOMBRE    PIC X(20).
               10 REDEF-HABITANTES PIC 9(9).
       01 NOMBRE-BUSCADO     PIC X(20).
       01 CONTADOR           PIC 9(3) VALUE 0.
       01 INDICE-ENCONTRADO  PIC 9(1) VALUE 0.
       01 FIN-BUSQUEDA       PIC X(01) VALUE 'N'.
           88 BUSQUEDA-TERMINADA VALUE 'S'.
       procedure division.
       inicio.
           move "AFRICA"   to CONT-NOMBRE (1)
           move 100000000    to CONT-HABITANTES (1)
           move "AMERICA"   to CONT-NOMBRE (2)
           move 1200000000   to CONT-HABITANTES (2)
           move "OCEANIA"   to CONT-NOMBRE (3)
           move 40000000     to CONT-HABITANTES (3)
           display "Ingrese el nombre del continente:".
           accept NOMBRE-BUSCADO from sysin.
           perform buscar-continente
           if INDICE-ENCONTRADO > 0
               display "Habitantes: " CONT-HABITANTES (INDICE-ENCONTRADO)
           else
               display "Continente no encontrado."
           end-if
           display "Total de consultas: " CONTADOR
           goback.
       buscar-continente.
           set IDX to 1
           move 0 to INDICE-ENCONTRADO
           move 'N' to FIN-BUSQUEDA
           perform until BUSQUEDA-TERMINADA or IDX > 3
               if NOMBRE-BUSCADO = CONT-NOMBRE (IDX)
                   add 1 to CONTADOR
                   move IDX to INDICE-ENCONTRADO
                   move 'S' to FIN-BUSQUEDA
               else
                   add 1 to IDX
               end-if
           end-perform.
       end program COBOL2.
