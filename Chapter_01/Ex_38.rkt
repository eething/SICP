#lang racket

(define (close? a b) (< (abs (- a b)) 0.00001))

(define (report n r b)
  (display n)
  (display " -> ")
  (display (abs (- b r)))
  (newline)
  r)

(define (d i)
  (if (= (remainder i 3) 2)
      (* (+ (/ (- i 2) 3) 1) 2)
      1))

(define (cont-frac n d k)
  (define (try i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (try (+ i 1))))))
  (try 1))

;(define grinv (/ 1 (/ (+ 1 (sqrt 5)) 2)))
(define e (- (exp 1) 2))

(define (cf k)
  (cont-frac (lambda (i) 1.0) d k))

(define (test-cont-frac)
  (define (try k)
    (if (close? (cf k) e)
        (report k (cf k) e)
        (try (+ k 1))))
    (try 1))

(test-cont-frac)


(define (cont-frac-iter n d k)
  (define (try i r)
    (if (= i 0)
        r
        (try (- i 1) (/ (n i) (+ (d i) r)))))
  (try k 0))

(define (cfi k)
  (cont-frac-iter (lambda (i) 1.0) d k))

(define (test-cont-frac-iter)
  (define (try k)
    (if (close? (cfi k) e)
        (report k (cfi k) e)
        (try (+ k 1))))
    (try 1))

(test-cont-frac-iter)
