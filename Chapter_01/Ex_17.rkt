#lang racket

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (multi a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (double (multi a (halve b))))
        (else (+ a (multi a (- b 1))))))

(multi 3 0)
(multi 3 1)
(multi 3 2)
(multi 3 3)
(multi 3 4)
(multi 3 5)
(multi 3 6)
(multi 3 7)