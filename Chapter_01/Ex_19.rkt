#lang racket

;{ bq+aq+ap } / { bp+aq }
;{ bpq+bq2+aq2+ap2+2apq+bpq+aq2 } / { bp2+apq+bq2+aq2+apq }
;{ b(q2+2pq) + a(q2+p2 + q2+2pq) } / { b(p2+q2) + a(q2+2pq)}

(define (even? n) (= (remainder n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a b (+ (* p p) (* q q)) (+ (* q q) (* 2 p q)) (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- count 1)))))

(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)