---
draft: true
title: An atlas of agent coding tools
---


I recently had the misfoetune of trying out several different local coding models on my Mac. This is an attempt to diversify fron Claude

## The stack
One problem with agentic coding in 2026 is that there are integration points at every layer that make any one setup difficult to configure and reproduce.

- Hardware backend
  - Examples: CUDA, MLX (TODO FIND THE PROPER NAME), Metal, Vulkan, CPU-only
  - Speaks: pytorch, ggml,
- Inference server
  - Examples: llama-cpp, mlx, ollama's go backend
- Inference meta-server
   - Examples: lmstudio, llama-server, ollama, oMLX
   - speaks: openai's chat ckmpletions API
- agent 
  - cobfigures context, procides tools
  
## Experiment
  
