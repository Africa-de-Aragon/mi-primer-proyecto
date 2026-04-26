       identification division.
       program-id. hello.
       
       environment division.
       configuration section.
       
       data division.
       working-storage section.
       01 nombre PIC X(50).
       
       procedure division.
           display "hola mundo".
           display "¿Como estas?".              
           DISPLAY "¿Cual es tu nombre?".
           ACCEPT nombre.
           DISPLAY "HOLA " nombre.
           perform 2 times
               display "¡Bienvenido a COBOL!"
           end-perform.
           display "¡Adios!".
        goback.
       
       end program hello.
