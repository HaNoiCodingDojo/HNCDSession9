#!/usr/bin/newlisp

(load-unittest)

(context 'InternetVoting)

(define (new-candidate name)
  (list name 0))

(define (vote-for candidate)
  (list         (get-name candidate)
                (+ 1 (get-vote candidate))
))


(define (get-first-winners)
  (setq sortedList (args))
  (sort sortedList (fn (candidate1 candidate2)
                     (> (get-vote candidate1) (get-vote candidate2))))
  (println sortedList)
  (if (= 1 (length sortedList))
      sortedList
      (= (get-vote (sortedList 0)) (get-vote (sortedList 1)))
      sortedList
      (list (first sortedList)))
  )

(define (get-vote candidate)
  (candidate 1))

(define (get-name candidate)
  (candidate 0))

(define-test (test_getVote)
  (setq john (new-candidate "john"))
  (assert= 0 (get-vote john)))

(define-test (test_getName)
  (setq john (new-candidate "john"))
  (assert= "john" (get-name john)))

(define-test (test_twoCandidateWithOneVoteForOneCandidate)
  (setq john (new-candidate "john")
        mary (new-candidate "mary"))
  (setq john (vote-for john))
  (assert= (list john) (get-first-winners john mary)))

(define-test (test_twoCandidateWithTwoVoteForEachCandidate)
  (setq john (new-candidate "john")
        mary (new-candidate "mary"))
  (setq john (vote-for john))
  (setq mary (vote-for mary))
  (assert= (list mary john) (get-first-winners john mary)))

(define-test (test_oneCandidateWithOneVoteForHimAndHeIsTheFirstPlaceWinner)
  (setq john (new-candidate "john"))
  (setq john (vote-for john))
  (assert= (list john) (get-first-winners john))

  )

(define-test (test_threeCandidatesWithNoVotes)
  (setq john (new-candidate "john"))
  (setq mary (new-candidate "mary"))
  (setq antiJohn (new-candidate "antiJohn"))
  (assert= (list john mary antiJohn) (get-first-winners john mary antiJohn)))

(UnitTest:run-all 'InternetVoting)

(context 'MAIN)
(exit)
