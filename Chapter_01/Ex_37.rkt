#lang racket

(define (close? a b) (< (abs (- a b)) 0.00001))

(define (report n r b)
  (display n)
  (display " -> ")
  (display (abs (- b r)))
  (newline)
  r)

(define (cont-frac n d k)
  (define (try i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (try (+ i 1))))))
  (try 1))

(define grinv (/ 1 (/ (+ 1 (sqrt 5)) 2)))

(define (cf k)
  (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))

(define (test-cont-frac)
  (define (try k)
;    (display k) (display ":") (display (cf k)) (newline)
    (if (close? (cf k) grinv)
        (report k (cf k) grinv)
        (try (+ k 1))))
    (try 1))

(test-cont-frac)


(define (cont-frac-iter n d k)
  (define (try i r)
    (if (= i k)
        r
        (try (+ i 1) (/ (n i) (+ (d i) r)))))
  (try 1 1))

(define (cfi k)
  (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k))

(define (test-cont-frac-iter)
  (define (try k)
    (if (close? (cfi k) grinv)
        (report k (cfi k) grinv)
        (try (+ k 1))))
    (try 1))

(test-cont-frac-iter)
