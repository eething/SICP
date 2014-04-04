#lang racket


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;applicative order
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd 40 6)
;(gcd 6 (remainder 40 6))
;(gcd 6 4)
;(gcd 4 (remainder 6 4))
;(gcd 4 2)
;(gcd 2 (remainder 4 2))
;(gcd 2 0)
;2

;normal order
;(define r remainder)
;;(gcd 206 40)
;(if (= 40 0) 206
;    (gcd 40 (r 206 40)))
;(if (= (remainder 206 40) 0) 40
;    (gcd (r 206 40) (r 40 (r 206 40))))
;(if (= (remainder 40 (remainder 206 40)) 0) 6
;    (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))
;(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) 4
;    (gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))))
;(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;    (gcd (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) (r (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))))
