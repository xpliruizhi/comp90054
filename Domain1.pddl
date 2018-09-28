(define (domain blocks_problem)

    (:requirements
        :typing
    )
    (:predicates (On ?x ?y)
        (Holding ?x)
        (Ontable ?x)
        (Clear ?x)
        (Armfree)
    )
    (:action Pickup
        :parameters (?x)
        :precondition (and (Ontable ?x) (Clear ?x) (Armfree))
        :effect (and (Holding ?x) (not (Ontable ?x)) (not(Clear ?x)) (not(Armfree)))
    )
    (:action Unstack
        :parameters (?x ?y)
        :precondition (and (Clear ?x) (On ?x ?y) (Armfree))
        :effect (and (Holding ?x)(Clear ?y)
        (not (Clear ?x)) (not (On ?x ?y)) (not (Armfree)))
    )
    (:action Stack
        :parameters (?x ?y)
        :precondition (and (Holding ?x) (Clear ?y))
        :effect (and (On ?x ?y)(Clear ?x)(Armfree)
        (not(Holding ?x)) (not (Clear ?y)))
    )
    (:action Putdown
        :parameters (?x)
        :precondition (and (Holding ?x))
        :effect (and (Ontable ?x)(Clear ?x)(Armfree)
        (not (Holding ?x)))
    )
)