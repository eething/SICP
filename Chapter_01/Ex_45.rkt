#lang racket

(define (average a b)
  (/ (+ a b) 2));

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

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

"= sqrt ="
(define (sqrt2 x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
(sqrt2 4)
(sqrt2 9)

"= cbrt ="
(define (cbrt x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))
(cbrt 8)
(cbrt 27)

"= qdrt ="
;(define (qdrt-fail x)
;  (fixed-point (average-damp (lambda (y) (/ x (* y y y)))) 1.0))
(define (qdrt x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y))))) 1.0))
(qdrt 16)
(qdrt 81)

"= nth-root ="

(define (square x) (* x x))

(define (nth-root n x)
  (fixed-point ((repeat average-damp (floor (/ (log n) (log 2)))) (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(nth-root 2 9)
(nth-root 3 27)
(nth-root 4 81)
(nth-root 5 243)
(nth-root 6 729)
