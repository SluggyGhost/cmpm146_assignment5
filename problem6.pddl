(define (problem move-out-2)
   (:domain rooms2)
   (:objects c1 - character
             left-hand right-hand - hand
             red-ball vase green-block pyramid blue-cup stick coat hat whiteboard - item
          r1 r2 r3 r4 r5 r6 hw1 hw2 hw3 hw4 - room)

(:init
; room connections
(connected r1 hw1)
(connected hw1 r1)
(connected hw1 hw2)
(connected hw2 hw1)
(connected r2 hw2)
(connected hw2 r2)
(connected hw2 r5)
(connected r5 hw2)
(connected hw2 hw3)
(connected hw3 hw2)
(connected hw3 hw4)
(connected hw4 hw3)
(connected hw3 r3)
(connected r3 hw3)
(connected hw3 r4)
(connected r4 hw3)
(connected hw4 r6)
(connected r6 hw4)
; item locations
(in red-ball hw1)
(in vase r2)
(in green-block hw2)
(in pyramid r5)
(in blue-cup hw3)
(in stick r3)
(in coat r4)
(in hat hw4)
(in whiteboard r6)
; character settings
(at c1 r1)
(free-hand left-hand)
(free-hand right-hand)
)

(:goal (and (in red-ball r1)
            (in vase r1)
            (in green-block r1)
            (in pyramid r1)
            (in blue-cup r1)
            (in stick r1)
            (in coat r1)
            (in hat r1)
            (in whiteboard r1)))

)
