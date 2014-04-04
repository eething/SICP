#lang racket

(define (even? n) (= (remainder n 2) 0))
(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (multi a b)
  (define (iter a b n)
    (cond ((= b 0) 0)
          ((= b 1) a)
          ((even? b) (double (multi a (halve b))))
          (else (+ a (double (multi a (halve (- b 1))))))))
  (iter a b 1))

(multi 3 0)
(multi 3 1)
(multi 3 2)
(multi 3 3)
(multi 3 4)
(multi 3 5)
(multi 3 6)
(multi 3 7)