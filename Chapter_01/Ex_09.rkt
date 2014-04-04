#lang racket

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (plus1 a b)
  (if (= a 0)
      b
      (inc (plus1 (dec a) b))))

(define (plus2 a b)
  (if (= a 0)
      b
      (plus2 (dec a) (inc b))))


(plus1 3 5)
;recursive
;(inc (plus1 2 5))
;(inc (inc (plus1 1 5)))
;(inc (inc (inc (plus1 0 5))))
;(inc (inc (inc 5)))
;(inc (inc 6))
;(inc 7)
;8

(plus2 3 5)
;iterative
;(plus2 2 6)
;(plus2 1 7)
;(plus2 0 8)
;8
