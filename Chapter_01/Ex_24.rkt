#lang racket

(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))

;slow

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n) (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (current-inexact-milliseconds) start-time)) null ))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))



;fast

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-fast-prime-test n)
  (start-fast-prime-test n (current-inexact-milliseconds)))

(define (start-fast-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (current-inexact-milliseconds) start-time)) null ))



;test

(display "=== slow ===")
(timed-prime-test 1009)
(timed-prime-test 32933)
(timed-prime-test 66047)
(timed-prime-test 139969)
(timed-prime-test 160001)
(timed-prime-test 263167)
(timed-prime-test 2097593)
(timed-prime-test 433494437)
(timed-prime-test 780291637)
(timed-prime-test 1405695061)
(timed-prime-test 2147483647)
(timed-prime-test 2971215073)
(newline)
(newline)

(display "=== fast ===")
(timed-fast-prime-test 1009)
(timed-fast-prime-test 32933)
(timed-fast-prime-test 66047)
(timed-fast-prime-test 139969)
(timed-fast-prime-test 160001)
(timed-fast-prime-test 263167)
(timed-fast-prime-test 2097593)
(timed-fast-prime-test 433494437)
(timed-fast-prime-test 780291637)
(timed-fast-prime-test 1405695061)
(timed-fast-prime-test 2147483647)
(timed-fast-prime-test 2971215073)
(newline)