#lang racket

(define (d i)
  (if (= (remainder i 3) 2)
      (* (+ (/ (- i 2) 3) 1) 2)
      1))

(define (tan-cf x k)
  (define (d i)
    (- (* i 2) 1))
  (define (try i)
    (if (= i k)
        0
        (/ (* x x) (- (d i) (try (+ i 1))))))
  (/ (try 1) x))

(tan-cf pi 10)
(tan-cf (/ pi 2) 10)
(tan-cf (/ pi 3) 10)
(tan-cf (/ pi 4) 10)
(tan-cf (/ pi 6) 10)
"---"
(define (tan-cfi x k)
  (define (d i)
    (- (* i 2) 1))
  (define (try i r)
    (if (= i 0)
        r
        (try (- i 1) (/ (* x x) (- (d i) r)))))
  (/ (try (- k 1) 0) x))

(tan-cfi pi 10)
(tan-cfi (/ pi 2) 10)
(tan-cfi (/ pi 3) 10)
(tan-cfi (/ pi 4) 10)
(tan-cfi (/ pi 6) 10)
