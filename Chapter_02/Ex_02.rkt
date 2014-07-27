#lang racket

(define (make-point x y) (cons x y))
(define (x-point n) (car n))
(define (y-point n) (cdr n))

(define (make-segment a b) (cons a b))
(define (start-segment m) (car m))
(define (end-segment m) (cdr m))
 
(define (midpoint-segment seg)
  (let ((a (start-segment seg))
        (b (end-segment seg)))
  (make-point (/ (+ (x-point a) (x-point b)) 2) (/ (+ (y-point a) (y-point b)) 2))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define c (make-point 2 5))
(define d (make-point 6 9))
(print-point c)
(print-point d)
(print-point (midpoint-segment (make-segment c d)))


