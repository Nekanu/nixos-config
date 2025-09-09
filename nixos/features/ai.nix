{
  services.ollama = {
    enable = true;
    acceleration = "rocm"; # Use ROCm for acceleration
    loadModels = [
      "mistral:7b"
      "deepseek-r1:8b"
      "llama3.1:8b"
      "qwen2.5-coder:1.5b-base"
      "nomic-embed-text:latest"
    ];
  };
}
