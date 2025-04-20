(define (domain openrouter-routing)

  (:requirements :typing :fluents :negative-preconditions)

  (:types
    request
    llm
    provider
    task
    function
    budget
    numtokens
    cost
  )

  (:predicates
    (request_task ?r - request ?t - task)
    (task_function ?t - task ?f - function)
    (supports_function ?l - llm ?f - function)
    (provides_provider ?p - provider ?l - llm)
    (request_budget ?r - request ?b - budget)
    (function_numtokens ?f - function ?n - numtokens)
    (llm_numtokens ?l - llm ?n - numtokens)
    (provider_cost ?p - provider ?c - cost)
    (routed ?r - request ?l - llm)
  )

  (:action route_request
    :parameters (?r - request ?l - llm ?p - provider ?t - task ?f - function ?b - budget ?n - numtokens ?c - cost)
    :precondition (and
      (request_task ?r ?t)
      (task_function ?t ?f)
      (supports_function ?l ?f)
      (provides_provider ?p ?l)
      (request_budget ?r ?b)
      (function_numtokens ?f ?n)
      (llm_numtokens ?l ?n)
      (provider_cost ?p ?c)
    )
    :effect (and
      (routed ?r ?l)
    )
  )
)