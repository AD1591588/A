#!/usr/bin/env python3
"""
Example script showing how to load and inspect the undressav05 SafeTensors model
"""

import os
from safetensors import safe_open

def load_and_inspect_model(model_path):
    """Load and inspect the SafeTensors model"""
    
    if not os.path.exists(model_path):
        print(f"❌ Model file not found: {model_path}")
        return None
    
    print(f"🔍 Loading model from: {model_path}")
    
    try:
        # Open the SafeTensors file
        with safe_open(model_path, framework="pt", device="cpu") as f:
            # Get all tensor names
            tensor_names = f.keys()
            
            print(f"📋 Model contains {len(tensor_names)} tensors:")
            
            # Display tensor information
            total_size = 0
            for i, name in enumerate(tensor_names[:10]):  # Show first 10 tensors
                tensor = f.get_tensor(name)
                size_mb = tensor.numel() * tensor.element_size() / (1024 * 1024)
                total_size += size_mb
                print(f"  {i+1:2d}. {name}: {tensor.shape} ({size_mb:.2f} MB)")
            
            if len(tensor_names) > 10:
                print(f"  ... and {len(tensor_names) - 10} more tensors")
            
            print(f"📊 Total model size: {total_size:.2f} MB")
            
            # Get model metadata if available
            metadata = f.metadata()
            if metadata:
                print(f"📝 Model metadata:")
                for key, value in metadata.items():
                    print(f"  {key}: {value}")
            
            return f
            
    except Exception as e:
        print(f"❌ Error loading model: {e}")
        return None

def get_model_info(model_path):
    """Get basic information about the model file"""
    
    if not os.path.exists(model_path):
        return None
    
    file_size = os.path.getsize(model_path)
    file_size_mb = file_size / (1024 * 1024)
    
    return {
        "path": model_path,
        "size_mb": file_size_mb,
        "exists": True
    }

if __name__ == "__main__":
    # Model path
    model_path = "models/undressav05.safetensors"
    
    # Get basic file info
    info = get_model_info(model_path)
    if info:
        print(f"📁 Model file info:")
        print(f"  Path: {info['path']}")
        print(f"  Size: {info['size_mb']:.2f} MB")
        print(f"  Exists: {info['exists']}")
        print()
    
    # Load and inspect the model
    model = load_and_inspect_model(model_path)
    
    if model:
        print(f"\n✅ Model loaded successfully!")
        print(f"💡 You can now use this model in your application.")
        print(f"🔧 To use in your app, import the model like this:")
        print(f"   from safetensors import safe_open")
        print(f"   with safe_open('{model_path}', framework='pt') as f:")
        print(f"       # Load your tensors here")
    else:
        print(f"\n❌ Failed to load model.")