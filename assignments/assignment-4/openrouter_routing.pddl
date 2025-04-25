(define (domain openrouter-routing)

  (:requirements :typing :fluents :negative-preconditions)

  (:types
    request
    order
    parameters
    fallbacks
    data
    ignore
    quantizations
    sort
  )

  (:predicates
    (request_quantizations ?r - request ?q - quantizations)
    (order_quantizations ?o - order ?q - quantizations)
    (request_sort ?r - request ?s - sort)
    (order_sort ?o - order ?s - sort)
    (allow_fallbacks ?r - request ?f - fallbacks)
    (order_price ?o - order ?f - fallbacks)
    (require_parameters ?r - request ?p - parameters)
    (order_parameters ?o - order ?p - parameters)
    (data_collection ?r - request ?d - data)
    (order_data ?o - order ?d - data)
    (routed ?r - request ?o - order)
    (request_ignore ?r - request ?i - ignore)
  )

  (:action route_request
    :parameters (?r - request ?o - order ?q - quantizations ?s - sort ?f - fallbacks ?p - parameters ?d - data ?i - ignore)
    :precondition (and
      (request_quantizations ?r ?q)
      (order_quantizations ?o ?q)
      (request_sort ?r ?s)
      (order_sort ?o ?s)
      (allow_fallbacks ?r ?f)
      (order_price ?o ?f) ;ensure order has best price if fallbacks is false or otherwise if fallbacks is true
      (require_parameters ?r ?p)
      (order_parameters ?o ?p); ensure order has all parameters if true or not if false
      (data_collection ?r ?d)
      (order_data ?o ?d) ;check if order collects data
    )
    :effect (and
      (routed ?r ?o)
      (not (request_ignore ?r ?i))
    )
  )
)