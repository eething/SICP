#lang racket

(define (my-cons x y)
  (lambda (m) (m x y)))

(define (my-car z)
  (z (lambda (p q) p)))

(define (my-cdr z)
  (z (lambda (p q) q)))

(define data (my-cons 3 5))
(my-car data)
(my-cdr data)

((lambda (m) (m 3 5)) (lambda (p q) p))
((lambda (p q) p) 3 5)