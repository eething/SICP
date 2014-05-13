#lang racket

(define (inc n) (+ n 1))
(define (cube n) (* n n n))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))
 
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum-acc term a next b) (accumulate + 0 term a next b))
(define (prod-acc term a next b) (accumulate * 1 term a next b))

(define (sum-acc-iter term a next b) (accumulate-iter + 0 term a next b))
(define (prod-acc-iter term a next b) (accumulate-iter * 1 term a next b))

(sum-acc cube 3 inc 5)
(prod-acc cube 3 inc 5)
(sum-acc-iter cube 3 inc 5)
(prod-acc-iter cube 3 inc 5)
