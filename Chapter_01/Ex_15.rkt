#lang racket

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine x)
  (if (not (> (abs x) 0.1))
      x
      (p (sine (/ x 3)))))

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
(p (p (p (p 0.1495))))
(p (p (p 0.4351345505)))
(p (p 0.9758465331678770763868813495))
(p -0.7895631144708220087624507318397)
-0.3998034574133434577668796393197

(define (jaram a)
  (ceiling (/ (log (/ a 0.1)) (log 3))))

(jaram 0.09)
(jaram 0.1001)
(jaram 12.15)