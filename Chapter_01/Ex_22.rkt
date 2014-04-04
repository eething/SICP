#lang racket

(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n) (= n (smallest-divisor n)))

(define (timed-prime-test n)
;  (newline)
;  (display "Prime Test : ")
;  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (current-inexact-milliseconds) start-time)) null ))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes n)
  (cond ((= n 10001) (newline) (display "DONE.."))
        (else (timed-prime-test n) (search-for-primes (+ n 2)))))

(search-for-primes 999)

;(timed-prime-test 9)
;(timed-prime-test 17)
;(timed-prime-test 683)
;(timed-prime-test 32933)
;(timed-prime-test 66047)
;(timed-prime-test 139969)
;(timed-prime-test 160001)
;(timed-prime-test 263167)
;(timed-prime-test 2097593)
;(timed-prime-test 433494437)
;(timed-prime-test 780291637)
;(timed-prime-test 1405695061)
;(timed-prime-test 2147483647)
;(timed-prime-test 2971215073)
;(timed-prime-test 6643838879)
;(timed-prime-test 8589935681)
;(timed-prime-test 13091204281)
;(timed-prime-test 19577194573)
;(timed-prime-test 25209506681)
;(timed-prime-test 119218851371)
;(timed-prime-test 5600748293801)
;(timed-prime-test 10963707205259)
;(timed-prime-test 15285151248481)
;(timed-prime-test 59604644783353249)
;(timed-prime-test 523347633027360537213687137)


;시간측정이 제대로 안되고 있음-_-
;이렇게 하면 잘 됨
;(current-inexact-milliseconds)
;(current-inexact-milliseconds)
;근데 이렇게 하면 안 됨, 인자 계산 순서때문인 거 같은데 아 그지깽깽이-_-
;(display (current-inexact-milliseconds))
;(newline)
;(display (current-inexact-milliseconds))
;(newline)
