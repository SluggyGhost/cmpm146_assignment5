(define (domain rooms2)
  (:requirements :adl :typing)
  (:types key item - holdable 
          left-hand right-hand - hand
          character room
         )

(:predicates 
(at ?c - character ?r - room)
(connected ?a - room ?b - room)
(in ?i - holdable ?r - room)
(holds ?hand - hand ?i - holdable)
(free-hand ?hand - hand)
(locked-door ?from - room ?to - room)
(is-key ?k - key ?from - room ?to - room))

(:action move
  :parameters (?who - character ?from - room ?to - room )
  :precondition (and (at ?who ?from) (connected ?from ?to))
  :effect (and (not (at ?who ?from))
               (at ?who ?to)))
			   
(:action pick-up
  :parameters (?who - character ?hand - hand ?at - room ?what - holdable)
  :precondition (and (free-hand ?hand)
                     (at ?who ?at)
					 (in ?what ?at))
  :effect (and (not (free-hand ?hand))
               (not (in ?what ?at))
			   (holds ?hand ?what)))
			   
(:action drop
  :parameters (?who - character ?hand - hand ?at - room ?what - holdable)
  :precondition (and (holds ?hand ?what)
                     (at ?who ?at))
  :effect (and (free-hand ?hand)
               (in ?what ?at)
			   (not (holds ?hand ?what))))

(:action unlock
  :parameters (?who - character ?hand - hand ?from - room ?to - room ?key - key)
  :precondition (and (locked-door ?from ?to)
                     (is-key ?key ?from ?to)
                     (holds ?hand ?key)
                     (at ?who ?from))
  :effect (and (not (holds ?hand ?key))
               (free-hand ?hand)
               (not (locked-door ?from ?to))
               (not (locked-door ?to ?from))
               (connected ?from ?to)
               (connected ?to ?from))
)

)
  
  
