#lang racket

(define (close? a b) (< (abs (- a b)) 0.00001))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close? guess next)
          next
          (try next))))
  (try first-guess))

(/ (+ 1 (sqrt 5)) 2)
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)