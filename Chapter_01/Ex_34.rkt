#lang racket

(define (square n) (* n n))

(define (f g) (g 2))


(f square)
(f (lambda (z) (* z (+ z 1))))

(f f)
