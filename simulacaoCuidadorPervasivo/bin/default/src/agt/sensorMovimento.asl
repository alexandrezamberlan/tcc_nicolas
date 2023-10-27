!start.

+!start : true  <- 
    .print("pronto para a simulação.......").

+movimento(levantar) : true  
    <- .print("sensoriei que o paciente levantou");
       .send(atuadorSmartTV,tell,levanta);
       .send(atuadorIluminacao,tell,levanta);
       -tv(desligada).  