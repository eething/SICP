#lang racket

;(define (make-rat n d) (cons n d))
(define (make-rat n d)
  (if (or (and (< n 0) (< d 0)) (and (> n 0) (< d 0)))
      (cons (- n) (- d)) (cons n d)))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))


(add-rat (make-rat -1 2) (make-rat 1 3))
(sub-rat (make-rat -1 2) (make-rat 1 3))
(mul-rat (make-rat -1 2) (make-rat 1 3))
(div-rat (make-rat -1 2) (make-rat 1 3))