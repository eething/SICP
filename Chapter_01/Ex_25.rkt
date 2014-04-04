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

(define (expmod base exp m expmode)
  (cond ((= expmode 0)
         (cond ((= exp 0) 1)
               ((even? exp) (remainder (square (expmod base (/ exp 2) m expmode)) m))
               (else (remainder (* base (expmod base (- exp 1) m expmode)) m))))
        ((= expmode 1)
         (remainder (fast-expt-r base exp) m))
        ((= expmode 2)
         (remainder (fast-expt-i base exp) m))))

(define (fermat-test n expmode)
  (define (try-it a)
    (= (expmod a n n expmode) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times expmode)
  (cond ((= times 0) true)
        ((fermat-test n expmode) (fast-prime? n (- times 1) expmode))
        (else false)))

(define (timed-fast-prime-test n expmode)
  (start-fast-prime-test n (current-inexact-milliseconds) expmode))

(define (start-fast-prime-test n start-time expmode)
  (if (fast-prime? n 100 expmode)
      (report-prime n (- (current-inexact-milliseconds) start-time)) null ))



;test
(display "expmod : normal")
(timed-fast-prime-test 1009 0)
(timed-fast-prime-test 32933 0)
(timed-fast-prime-test 66047 0)
(newline)

(display "expmod : fast-expt-r")
(timed-fast-prime-test 1009 1)
(timed-fast-prime-test 32933 1)
(timed-fast-prime-test 66047 1)
(newline)

(display "expmod : fast-expt-i")
(timed-fast-prime-test 1009 2)
(timed-fast-prime-test 32933 2)
(timed-fast-prime-test 66047 2)
(newline)
