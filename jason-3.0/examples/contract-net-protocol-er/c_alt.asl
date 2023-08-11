// alternative implementation without .wait(<condition>), see plan for !bid

/* Initial beliefs and rules */

all_proposals_received(CNPId, NP)                // NP: number of participants
  :- .count(propose(CNPId,_)[source(_)], NO) &   // NO: number of proposes received
     .count(refuse(CNPId)[source(_)], NR) &      // NR: number of refusals received
     NP = NO + NR.

/* Initial goals */

!run.
!register.
+!register <- .df_register(initiator).

/* Plans */
+!run
   <- .wait(1000);  // wait participants introduction
      !!cnp(1,fix(computer));
      !!cnp(2,banana);
   .

+!cnp(Id,Task) <- !call(LP); !bids(LP); !winner(LO,W); !result(LO,W). {

    +!call(LP)
       <- .df_search("participant",LP);
          .print("Sending CFP to ",LP);
          .send(LP,tell,cfp(Id,Task)).

    +!bids(LP) : all_proposals_received(Id, .length(LP)). // all proposals received already!
    +!bids(LP) : NP = .length(LP) <: false
       <- .wait(4000); .done.
       {
          +propose(Id,_) : all_proposals_received(Id, NP) <- .done.
          +refuse(Id)    : all_proposals_received(Id, NP) <- .done.
       }

    +!winner(LO,WAg)
        : .findall(offer(O,A),propose(Id,O)[source(A)],LO) & LO \== []
       <- .print("Offers are for ",Task," are ",LO);
          .min(LO,offer(WOf,WAg)); // sort offers, the first is the best
          .print("Winner for ",Task," is ",WAg," with ",WOf).
    +!winner([],nowinner)
       <- .print("CNP ",Id," with no offer!").

    +!result(LO,WAg)
       <- for( .member( offer(_,WAg), LO) ) {
             .send(WAg,tell,accept_proposal(Id));
          }
          for( .member( offer(_,Ag), LO) & Ag \== WAg) {
             .send(Ag,tell,reject_proposal(Id));
          }.
}
