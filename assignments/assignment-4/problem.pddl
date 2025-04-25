(define (problem route-multiple-requests)(:domain openrouter-routing)

  (:objects
    req1 req2 req3 - request
    OpenAI Anthropic Google Google-AI-Studio Amazon-Bedrock Groq SambaNova Cohere Mistral Together Together2 Fireworks DeepInfra Lepton Novita Avian Lambda Azure Modal AnyScale Replicate Perplexity Recursal OctoAI DeepSeek Infermatic AI21 Featherless Inflection xAI Cloudflare SF-Compute Minimax Nineteen Liquid GMICloud Stealth NCompass InferenceNet Friendli AionLabs Alibaba Nebius Chutes Kluster Crusoe Targon Ubicloud Parasail Phala Cent-ML Venice OpenInference Atoma Enfer AI01 HuggingFace Mancer Mancer2 Hyperbolic Hyperbolic2 Lynn2 Lynn Reflection - order
    int4 int8 fp4 fp6 fp8 fp16 bf16 fp32 unknown - quantizations
    price throughput latency - sort
    true false - fallbacks
    true false - parameters
    allow deny - data
    OpenAI Anthropic Google Google-AI-Studio Amazon-Bedrock Groq SambaNova Cohere Mistral Together Together2 Fireworks DeepInfra Lepton Novita Avian Lambda Azure Modal AnyScale Replicate Perplexity Recursal OctoAI DeepSeek Infermatic AI21 Featherless Inflection xAI Cloudflare SF-Compute Minimax Nineteen Liquid GMICloud Stealth NCompass InferenceNet Friendli AionLabs Alibaba Nebius Chutes Kluster Crusoe Targon Ubicloud Parasail Phala Cent-ML Venice OpenInference Atoma Enfer AI01 HuggingFace Mancer Mancer2 Hyperbolic Hyperbolic2 Lynn2 Lynn Reflection - ignore
  )

  (:init
    (request_quantizations req1 int4)
    (request_quantizations req2 int8)
    (request_quantizations req3 fp32)
    
    (order_quantizations OpenAI int4)
    (order_quantizations OpenAI int8)
    (order_quantizations Google int8)
    (order_quantizations Google fp8)
    (order_quantizations Anthropic fp6)
    (order_quantizations Anthropic fp32)
    
    (request_sort req1 price)
    (request_sort req2 latency)
    (request_sort req3 throughput)
    
    (order_sort OpenAI price)
    (order_sort Google latency)
    (order_sort Anthropic throughput)
    
    (allow_fallbacks req1 false)
    (allow_fallbacks req2 true)
    (allow_fallbacks req3 true)
    
    (order_price OpenAI false)
    (order_price Google true)
    (order_price Anthropic true)
    
    (require_parameters req1 true)
    (require_parameters req2 true)
    (require_parameters req3 false)
    
    (order_parameters OpenAI true)
    (order_parameters Google true)
    (order_parameters Anthropic false)
    
    (data_collection req1 deny)
    (data_collection req2 allow)
    (data_collection req3 deny)
    
    (order_data OpenAI deny)
    (order_data Google allow)
    (order_data Anthropic deny)
    
    (request_ignore req1 Groq)
    (request_ignore req1 Cohere)
    (request_ignore req1 DeepSeek)
    (request_ignore req2 Groq)
    (request_ignore req2 DeepSeek)
    (request_ignore req3 Cloudflare)
  )

  (:goal
    (and
      (routed req1 OpenAI)
      (routed req2 Google)
      (routed req3 Anthropic)
    )
  )
)