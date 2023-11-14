---- MODULE modulo_4_counter ----
EXTENDS Naturals, TLC

VARIABLE r1, r2, y

Init == (* Initial values *)
        /\ r1 \in BOOLEAN
        /\ r2 \in BOOLEAN
        /\ y \in BOOLEAN
        /\ r1 = FALSE /\ r2 = FALSE /\ y = TRUE

Next == (* State transition function *)
        /\ r1' = ~r2
        /\ r2' = ~r2
        /\ y' = ~(r1 \/ r2)

Spec == Init /\ [][Next]_<<r1, r2, y>>

Invariant == (* Invariant property *)
             [](~r1 \/ ~r2)

Goal == (* System properties to check *)
        /\ ~(r1 /\ r2)  (* Example property to check *)

\* Uncomment the following line to check additional goals
/\ ([]<>(y = TRUE))

====

\* Uncomment the following line to check the goal property
CHECK Goal
