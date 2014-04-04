#lang racket

(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (fast-expt-r b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt-r b (/ n 2))))
        (else (* b (fast-expt-r b (- n 1))))))

(define (fast-expt-i b n)
  (define (fast-expt-i-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-i-iter a (square b) (/ n 2)))
          (else (fast-expt-i-iter (* a b) b (- n 1)))))
  (fast-expt-i-iter 1 b n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n k)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it k))

(define (fast-prime? n times)
  (cond ((= times 1) true)
        ((fermat-test n times) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-fast-prime-test n)
  (start-fast-prime-test n (current-inexact-milliseconds)))

(define (start-fast-prime-test n start-time)
  (if (fast-prime? n (- n 1))
      (report-prime n (- (current-inexact-milliseconds) start-time)) null ))



;test

(timed-fast-prime-test 561)
(timed-fast-prime-test 1105)
(timed-fast-prime-test 1729)
(timed-fast-prime-test 2465)
(timed-fast-prime-test 2821)
(timed-fast-prime-test 6601)
(newline)
