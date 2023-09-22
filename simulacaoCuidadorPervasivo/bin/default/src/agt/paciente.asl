// Agent alice in project simulacaoCuidadorPervasivo

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true  <- 
    .print("paciente pronto para a simulação.......").


+turno(noite) : true <-
    .print("vi que é noite");
    .broadcast(tell,grito(fraco)).