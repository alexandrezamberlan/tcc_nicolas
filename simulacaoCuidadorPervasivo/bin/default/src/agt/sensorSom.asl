// Agent bob in project simulacaoCuidadorPervasivo

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("pronto para tratar eventos de som").


+som(gritar): true  
    <- .print("sensoriei um grito do paciente").