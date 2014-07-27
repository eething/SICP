#lang racket


(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (add-1 zero))
(define two (add-1 one))

(define direct-one (lambda (f) (lambda (x) (f x))))
(define direct-two (lambda (f) (lambda (x) (f (f x)))))


(define (square x) (* x x))

((zero square) 3)
((one square) 3)
((two square) 3)

((direct-one square) 3)
((direct-two square) 3)
