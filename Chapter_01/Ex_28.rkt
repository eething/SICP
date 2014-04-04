#lang racket

(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (report-no-prime n)
  (newline)
  (display n)
  (display " *** Not Prime"))

(define (square-check x s m)
  (if (and (not (= x 1))
           (not (= x (- m 1)))
           (= s 1))
      0
      s))

(define (square-remainder-check x m)
  (square-check x (remainder (square x) m) m))  

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (square-remainder-check (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (mr-test n)
  (define (check x)
    (= x 1))
  (define (try-it a)
    (check (expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 1) true)
        ((mr-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-fast-prime-test n)
  (start-fast-prime-test n (current-inexact-milliseconds)))

(define (start-fast-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (current-inexact-milliseconds) start-time)) (report-no-prime n) ))



;test

(timed-fast-prime-test 561)
(timed-fast-prime-test 1105)
(timed-fast-prime-test 1729)
(timed-fast-prime-test 2465)
(timed-fast-prime-test 2821)
(timed-fast-prime-test 6601)
(newline)
