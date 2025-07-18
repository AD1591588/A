# UndressAV05 Model Download

This repository contains the downloaded `undressav05.safetensors` model from Hugging Face.

## Files

- `models/undressav05.safetensors` - The main model file (9.18 MB)
- `download_model.py` - Script used to download the model
- `load_model_example.py` - Example script showing how to load and inspect the model
- `requirements.txt` - Python dependencies

## Model Information

- **Model Type**: LoRA (Low-Rank Adaptation) for Stable Diffusion
- **Base Model**: NovelAI (nai.ckpt)
- **Network Dimension**: 8
- **Network Alpha**: 8.0
- **Training Steps**: 5,119
- **Resolution**: 512x512
- **Total Size**: 0.14 MB (compressed LoRA weights)

## Usage in Your App

### Basic Loading

```python
from safetensors import safe_open
import torch

# Load the model
model_path = "models/undressav05.safetensors"

with safe_open(model_path, framework="pt", device="cpu") as f:
    # Get all tensor names
    tensor_names = f.keys()
    
    # Load specific tensors
    for name in tensor_names:
        tensor = f.get_tensor(name)
        # Use the tensor in your application
```

### Integration with Stable Diffusion

This is a LoRA model that can be applied to Stable Diffusion models. You'll need to:

1. Load a base Stable Diffusion model
2. Apply this LoRA to modify the model's behavior
3. Use the modified model for inference

### Example Integration

```python
# This is a conceptual example - you'll need to adapt it to your specific SD implementation
from diffusers import StableDiffusionPipeline
from safetensors import safe_open

# Load base model
pipe = StableDiffusionPipeline.from_pretrained("runwayml/stable-diffusion-v1-5")

# Load and apply LoRA
with safe_open("models/undressav05.safetensors", framework="pt") as f:
    # Apply LoRA weights to the model
    # Implementation depends on your SD framework
    
# Generate images
prompt = "your prompt here"
image = pipe(prompt).images[0]
```

## Dependencies

Install the required packages:

```bash
pip install -r requirements.txt
```

Or manually:

```bash
pip install huggingface_hub safetensors torch
```

## Model Metadata

The model was trained on:
- 5,460 total images
- 4 datasets with different undressing scenarios
- 15 epochs of training
- Mixed precision (bf16) training

## Notes

- This is a LoRA model, not a standalone model
- It requires a base Stable Diffusion model to function
- The model contains 792 tensors with LoRA weights
- Training was completed on June 21, 2023

## License

Please check the original model's license on Hugging Face for usage terms.
