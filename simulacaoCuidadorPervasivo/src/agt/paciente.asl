// Agent alice in project simulacaoCuidadorPervasivo

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true  <- 
    .print("paciente pronto para a simulação.......").


+evento(barulho): turno(madrugada) & clima(ventania)  
    <- 
       .print("vou gritar de medo");
       //.broadcast(tell,som(gritar)).
       som(gritar).

+evento(barulho): turno(madrugada)
    <-
       .print("vou levantar");
       //.broadcast(tell,movimento(levantar)).
       movimento(levantar).

+evento(barulho): true
    <-
       .print("vou chamar conhecido");
       //.broadcast(tell,som(chamar)). 
       som(chamar).

//turno madrugada
//clima ventania
//evento barulho
//	--- (som) gritar medo
//	--- (som) chamar conjuge ou filho(a) ou parente
//	---- (movimento) levantar