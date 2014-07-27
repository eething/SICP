#lang racket

(define (my-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (count-exponent n divisor)
  (define (iter x)
    (if (= 0 (remainder n (expt divisor x)))
        (iter (+ x 1))
        (- x 1)))
  (iter 1))

(define (my-car z)
  (count-exponent z 2))

(define (my-cdr z)
  (count-exponent z 3))

(define data (my-cons 3 5))
data
(my-car data)
(my-cdr data)
