#lang racket

(define dx 0.00001)

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

(define (avr3 a b c) (/ (+ a b c) 3))
(define (smooth f)
  (lambda (x) (avr3 (f (- x dx)) (f x) (f (+ x dx)))))

((smooth square) 2)
(((repeated smooth 1) square) 2)
(((repeated smooth 2) square) 2)
(((repeated smooth 3) square) 2)
