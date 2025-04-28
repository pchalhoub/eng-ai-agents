(define (domain openrouter-routing)

  (:requirements :typing :fluents :negative-preconditions)

  (:types
    request
    provider
    cost
    gpu
    model
    function
    tokens
  )

  (:predicates
    (request_cost ?r - request ?c - cost)
    (model_cost ?m - model ?c - cost)
    (request_gpu ?r - request ?g - gpu)
    (model_gpu ?m - model ?g - gpu)
    (model_provider ?m - model ?p - provider)
    (request_function ?r - request ?f - function)
    (model_function ?m - model ?f - function)
    (required_tokens ?f - function ?t - tokens)
    (maxtokens ?m - model ?t - tokens)
    (routed ?r - request)
  )

  (:action route_request
    :parameters (?r - request ?m - model ?c - cost ?g - gpu ?p - provider ?f - function ?t - tokens)
    :precondition (and
      (request_cost ?r ?c)
      (model_cost ?m ?c)
      (request_gpu ?r ?g)
      (model_gpu ?m ?g)
      (model_provider ?m ?p)
      (request_function ?r ?f)
      (model_function ?m ?f)
      (required_tokens ?f ?t)
      (maxtokens ?m ?t)
      (not (routed ?r))
    )
    :effect (and
      (routed ?r)
    )
  )
)
