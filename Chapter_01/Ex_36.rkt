#lang racket

(define (close? a b) (< (abs (- a b)) 0.00001))

(define (report n)
  (display n)
  (newline))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (report guess)
      (if (close? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
