;; Simple Counter Contract
;; This contract demonstrates basic Clarity concepts:
;; - State management with data-var
;; - Public functions for reading and writing state
;; - Basic arithmetic operations

(define-data-var counter uint u0)

;; Get the current counter value
(define-public (get-counter)
  (ok (var-get counter))
)

;; Increment the counter by 1
(define-public (increment)
  (let ((current (var-get counter)))
    (var-set counter (+ current u1))
    (ok (var-get counter))
  )
)

;; Decrement the counter by 1 (won't go below 0)
(define-public (decrement)
  (let ((current (var-get counter)))
    (if (<= current u0)
      (err u1) ;; Error if trying to decrement below 0
      (begin
        (var-set counter (- current u1))
        (ok (var-get counter))
      )
    )
  )
)

;; Reset the counter to 0
(define-public (reset)
  (begin
    (var-set counter u0)
    (ok (var-get counter))
  )
)

;; Set the counter to a specific value
(define-public (set-counter (value uint))
  (begin
    (var-set counter value)
    (ok (var-get counter))
  )
)
