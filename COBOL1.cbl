       identification division.
       program-id. COBOL1.
       environment division.
       input-output section.
       file-control.
           select nombres-file assign to "nombres.txt"
               organization is line sequential.
       data division.
       file section.
       FD nombres-file.
       01 nombres-record.
           05 nombre PIC X(20).
       working-storage section.
       01 fin-archivo       PIC X(01) VALUE "N".
           88 eof           VALUE "S".
       01 contador          PIC 9(03) VALUE 0.
       procedure division.
       inicio.
           open input nombres-file
           perform hasta-eof
           close nombres-file
           display "Total de nombres leidos: " contador
           goback.
       hasta-eof.
           read nombres-file
               at end
                   move "S" to fin-archivo
               not at end
                   display "Nombre: " nombre
                   add 1 to contador
           end-read
           if not eof
               perform hasta-eof
           end-if.
       end program COBOL1.
