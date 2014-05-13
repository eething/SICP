#lang racket

(define (inc n) (+ n 1))
(define (identity n) n)
(define (cube n) (* n n n))
(define (square n) (* n n))

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

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((not (filter a)) (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter)))))

(filtered-accumulate * 1 cube 1 inc 5 odd?)
(filtered-accumulate * 1 cube 1 inc 5 even?)


;prime? 이 없으므로 odd? 로 대체
(define (sum-square a b) (filtered-accumulate + 0 square a inc b odd?))
(sum-square 1 10)

(define (prod-rp n)
  (define (asdf? a) (= (gcd a n) 1))
  (filtered-accumulate * 1 identity 1 inc n asdf?))
(prod-rp 10)
(prod-rp 12)
