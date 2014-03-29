#lang racket

(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))

;small
(define (good-enough-small? guess x) (< (abs (- (square guess) x)) 0.001))
                                       
(define (improve guess x) (average guess (/ x guess)))

(define (sqrt-iter-small guess x)
  (if (good-enough-small? guess x)
      guess
      (sqrt-iter-small (improve guess x)
                 x)))

(define (sqrt-s x) (sqrt-iter-small 1.0 x))

;big
(define (good-enough-big? guess x) (< (abs (- (square guess) x)) 10))

(define (sqrt-iter-big guess x)
  (if (good-enough-big? guess x)
      guess
      (sqrt-iter-big (improve guess x)
                 x)))

(define (sqrt-b x) (sqrt-iter-big 1.0 x))

;dynamic
(define (good-enough-dynamic? guess x) (< (abs (- (square guess) x)) (/ x 100000)))

(define (sqrt-iter-dynamic guess x)
  (if (good-enough-dynamic? guess x)
      guess
      (sqrt-iter-dynamic (improve guess x)
                 x)))

(define (sqrt-d x) (sqrt-iter-dynamic 1.0 x))

"small"
(sqrt-s 4)
(sqrt-s 1000000)
"big"
(sqrt-b 4)
(sqrt-b 1000000)
"dynamic"
(sqrt-d 4)
(sqrt-d 1000000)