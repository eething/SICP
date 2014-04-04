#lang racket


(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))

;all

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



;odd

(define (smallest-odd-divisor n)
  (find-odd-divisor n 2))

(define (next n)
  (cond ((= n 2) (+ n 1))
        (else (+ n 2))))

(define (find-odd-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-odd-divisor n (next test-divisor)))))

(define (prime-odd? n) (= n (smallest-odd-divisor n)))

(define (timed-odd-prime-test n)
  (start-odd-prime-test n (current-inexact-milliseconds)))

(define (start-odd-prime-test n start-time)
  (if (prime-odd? n)
      (report-prime n (- (current-inexact-milliseconds) start-time)) null ))



;test

(display "=== all ===")
(timed-prime-test 2971215073)
(timed-prime-test 6643838879)
(timed-prime-test 8589935681)
(newline)

(display "=== odd ===")
(timed-odd-prime-test 2971215073)
(timed-odd-prime-test 6643838879)
(timed-odd-prime-test 8589935681)
(newline)