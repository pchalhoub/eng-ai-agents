(define (problem route-multiple-requests)(:domain openrouter-routing)

  (:objects
    req1 req2 req3 req4 req5 - request
    OpenAI Anthropic Google Google-AI-Studio Amazon-Bedrock Groq SambaNova Cohere Mistral Together Together2 Fireworks DeepInfra Lepton Novita Avian Lambda Azure Modal AnyScale Replicate Perplexity Recursal OctoAI DeepSeek Infermatic AI21 Featherless Inflection xAI Cloudflare SF-Compute Minimax Nineteen Liquid GMICloud Stealth NCompass InferenceNet Friendli AionLabs Alibaba Nebius Chutes Kluster Crusoe Targon Ubicloud Parasail Phala Cent-ML Venice OpenInference Atoma Enfer AI01 HuggingFace Mancer Mancer2 Hyperbolic Hyperbolic2 Lynn2 Lynn Reflection - provider
    cheap moderate expensive - cost
    slowest slow fast fastest - gpu
    gemini2 gpt4o claude35sonnet grok2vision deepseekv3 ministral8b commandr7b - model
    coding textgen web - function
    few midrange most - tokens
  )

  (:init
    (request_cost req1 cheap)
    (request_cost req2 moderate)
    (request_cost req3 expensive)
    (request_cost req4 moderate)
    (request_cost req5 cheap)
    (model_cost gemini2 cheap)
    (model_cost claude35sonnet expensive)
    (model_cost gpt4o moderate)
    (model_cost grok2vision moderate)
    (model_cost deepseekv3 cheap)
    (model_cost ministral8b expensive)
    (model_cost commandr7b cheap)
    
    (request_function req1 textgen)
    (request_function req2 web)
    (request_function req3 coding)
    (request_function req4 coding)
    (request_function req5 textgen)
    
    (required_tokens textgen few)
    (required_tokens textgen midrange) ;required to allow path for models with midrange maxtokens that can also support textgen (i.e. if it can support midrange it can support few)
    (required_tokens textgen most) ;required to allow path for models with most maxtokens that can also support textgen
    (required_tokens web most)
    (required_tokens coding midrange)
    (required_tokens coding most) ;required to allow path for models with most maxtokens that can also support coding
    
    (maxtokens gemini2 midrange)
    (maxtokens gpt4o most)
    (maxtokens claude35sonnet midrange)
    (maxtokens grok2vision most)
    (maxtokens deepseekv3 midrange)
    (maxtokens ministral8b midrange)
    (maxtokens commandr7b few)
    
    (model_function gemini2 textgen)
    (model_function gemini2 coding)
    (model_function gpt4o textgen)
    (model_function gpt4o coding)
    (model_function gpt4o web)
    (model_function claude35sonnet textgen)
    (model_function claude35sonnet coding)
    (model_function grok2vision web)
    (model_function deepseekv3 textgen)
    (model_function deepseekv3 coding)
    (model_function ministral8b textgen)
    (model_function ministral8b coding)
    (model_function commandr7b textgen)
    
    (request_gpu req1 fast)
    (request_gpu req2 fast)
    (request_gpu req3 fastest)
    (request_gpu req4 fast)
    (request_gpu req5 fast)
    (model_gpu gemini2 fast)
    (model_gpu gpt4o fast)
    (model_gpu ministral8b fastest)
    (model_gpu grok2vision fast)
    (model_gpu deepseekv3 slowest)
    (model_gpu claude35sonnet fastest)
    (model_gpu commandr7b fast)
    
    (model_provider gemini2 Google)
    (model_provider gpt4o OpenAI)
    (model_provider claude35sonnet Anthropic)
    (model_provider grok2vision xAI)
    (model_provider deepseekv3 DeepSeek)
    (model_provider ministral8b Mistral)
    (model_provider commandr7b Cohere)
  )

  (:goal
    (and
      (routed req1)
      (routed req2)
      (routed req3)
      (routed req4)
      (routed req5)
    )
  )
)