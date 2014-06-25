#lang racket

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) 0.00001))

(define (iterative-improve improve close?)
  (lambda (x)
    (let ((next (improve x)))
      (if (close? x next)
      next
      ((iterative-improve improve close?) next)))))

(define (sqrt x)
  ((iterative-improve
    (lambda (y)
      (/ (+ (/ x y) y) 2))
   close-enough?) 1.0))

(define (fixed-point f first-guess)
  ((iterative-improve
    f
    close-enough?) first-guess))
