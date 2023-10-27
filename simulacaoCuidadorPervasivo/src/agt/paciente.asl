estado(calmo).

!start.

+!start : true  <- 
    .print("pronto para a simulação.......").

+evento(barulho): turno(madrugada) & clima(ventania)  
    <- 
       .print("vou gritar de medo");
       -estado(calmo);
       +estado(agitado);
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
       som(gritar).

+tv(ligada): estado(calmo)
    <-
    .print("..... estou bem").

+tv(ligada): estado(agitado)
    <-
    som(gritar);
    .send(cuidador,tell,paciente(grito)).
    

//turno madrugada
//clima ventania
//evento barulho
//	--- (som) gritar medo
//	--- (som) chamar conjuge ou filho(a) ou parente
//	---- (movimento) levantar