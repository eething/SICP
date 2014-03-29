#lang racket

(define (good-enough? guess x) (< (abs (- (* guess guess guess) x)) 0.001))
                                       
(define (improve guess x) (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (cbrt x) (cbrt-iter 1.0 x))

(cbrt 8)
(cbrt 27)
(cbrt 64)
(cbrt 125)
(cbrt 216)
(cbrt 343)
(cbrt 512)
(cbrt 729)
(cbrt 1000)