#lang racket

(define (square x) (* x x))

(define (mycompose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (repeat f n)
  (lambda (x)
    (if (= n 1)
    (f x)
    ((compose f (repeat f (- n 1))) x))))

((repeat square 2) 5)
((repeated square 2) 5)
