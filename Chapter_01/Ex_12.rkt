#lang racket

;recursive
(define (Pascal-r n x)
  (if (or (= x 1) (= x n))
      1
      (+ (Pascal-r (- n 1) (- x 1)) (Pascal-r (- n 1) x))))

;iterative
;(define (Pascal-i n x)
;  (if (or (= x 1) (= x n)
;      1
;      (GG))))

(define Pascal Pascal-r)
;(define Pascal Pascal-i)

(Pascal 1 1)
"---"
(Pascal 2 1)
(Pascal 2 2)
"---"
(Pascal 3 1)
(Pascal 3 2)
(Pascal 3 3)
"---"
(Pascal 4 1)
(Pascal 4 2)
(Pascal 4 3)
(Pascal 4 4)
"---"
(Pascal 5 1)
(Pascal 5 2)
(Pascal 5 3)
(Pascal 5 4)
(Pascal 5 5)