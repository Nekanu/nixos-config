{
  services.ollama = {
    enable = true;
    acceleration = "rocm"; # Use ROCm for acceleration
    loadModels = [
      "mistral:7b"
      "deepseek-r1:8b"
      "gemma3n:e4b"
      "codellama:7b"
    ];
  };
}
