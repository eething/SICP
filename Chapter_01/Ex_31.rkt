#lang racket

(define (inc n) (+ n 1))
(define (cube n) (* n n n))

(define (sum1 term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum1 term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(product cube 3 inc 5)
(product-iter cube 3 inc 5)

(define (get-pi n)
  (define (fraction n)
    (if (even? n)
        (/ (+ n 2) (+ n 1))
        (/ (+ n 1) (+ n 2))))
  (product fraction 1.0 inc n))

(/ pi 4)
(get-pi 10)
(get-pi 100)
(get-pi 1000)
