(define (problem route-multiple-requests)(:domain openrouter-routing)

  (:objects
    req1 req2 req3 - request
    gpt claude gemini - llm
    openai anthropic google - provider
    summarization write-code email - task
    generate-text summarize-text code - function
    expensive moderate cheap - cost
    low midrange high - budget
    few fair many - numtokens
  )

  (:init
    ;requesttotask
    (request_task req1 email)
    (request_task req2 summarization)
    (request_task req3 write-code)

    ;tasktofunction
    (task_function email generate-text)
    (task_function summarization summarize-text)
    (task_function write-code code)
    
    ;functiontollm
    (supports_function gpt generate-text)
    (supports_function gpt summarize-text)
    (supports_function gpt code)
    (supports_function claude code)
    (supports_function claude generate-text)
    (supports_function gemini generate-text)
    (supports_function gemini summarize-text)
    (supports_function gemini code)

    ;providerllm
    (provides_provider openai gpt)
    (provides_provider anthropic claude)
    (provides_provider google gemini)
    
    ;budgetforeachrequest
    (request_budget req1 midrange)
    (request_budget req2 low)
    (request_budget req3 high)
    
    ;numtokensrequiredperfunction
    (function_numtokens generate-text fair)
    (function_numtokens summarize-text few)
    (function_numtokens code many)
    
    ;maxnumtokensperllm
    (llm_numtokens gpt fair)
    (llm_numtokens claude many)
    (llm_numtokens gemini few)
    
    ;costpernumtokenforeachprovider
    (provider_cost openai moderate)
    (provider_cost anthropic expensive)
    (provider_cost google cheap)

    ;req1: write an email to my client
    ;(request_task req1 email)
    ;(request_function req1 generate-text)
    ;(request_dollarlimit req1 midrange)
    ;(request_numtokens req1 many)
    ;(request_costlevel req1 moderate)

    ;req2: summarize a technical article or paper
    ;(request_task req2 summarization)
    ;(request_function req2 summarize-text)
    ;(request_dollarlimit req2 high)
    ;(request_numtokens req2 many)
    ;(request_costlevel req2 expensive)

    ;req3: translate a message from french to english
    ;(request_task req3 translation)
    ;(request_function req3 generate-text)
    ;(request_dollarlimit req3 low)
    ;(request_numtokens req3 few)
    ;(request_costlevel req3 cheap)
  )

  (:goal
    (and
      (routed req1 gpt)
      (routed req2 gemini)
      (routed req3 claude)
    )
  )
)