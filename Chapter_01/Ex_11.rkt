#lang racket

;recursive
(define (fr n)
  (if (< n 3)
      n
      (+ (fr (- n 1)) (* 2 (fr (- n 2))) (* 3 (fr (- n 3))))))

(fr 0)
(fr 1)
(fr 2)
(fr 3)
(fr 4)
(fr 5)
(fr 6)
(fr 7)
(fr 8)
(fr 9)
(fr 10)

;iterative
(define (fi a b c n)
  (if (< n 3)
      c
      (fi b c (+ c (* 2 b) (* 3 a)) (- n 1))))

(define (f n)
  (if (< n 3)
      n
      (fi 0 1 2 n)))

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)
(f 7)
(f 8)
(f 9)
(f 10)
