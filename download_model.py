#!/usr/bin/env python3
"""
Script to download the undressav05 model from Hugging Face
"""

import os
from huggingface_hub import hf_hub_download

def download_model():
    """Download the undressav05 model from Hugging Face"""
    
    # Model repository and file information
    repo_id = "Bugsys0302/undressav05"
    filename = "undressav05.safetensors"
    
    print(f"Downloading {filename} from {repo_id}...")
    
    try:
        # Download the model file
        local_path = hf_hub_download(
            repo_id=repo_id,
            filename=filename,
            local_dir="./models",  # Save to a models directory
            local_dir_use_symlinks=False  # Download actual file, not symlink
        )
        
        print(f"✅ Model downloaded successfully!")
        print(f"📁 Saved to: {local_path}")
        
        # Get file size
        file_size = os.path.getsize(local_path)
        file_size_mb = file_size / (1024 * 1024)
        print(f"📊 File size: {file_size_mb:.2f} MB")
        
        return local_path
        
    except Exception as e:
        print(f"❌ Error downloading model: {e}")
        return None

if __name__ == "__main__":
    # Create models directory if it doesn't exist
    os.makedirs("./models", exist_ok=True)
    
    # Download the model
    model_path = download_model()
    
    if model_path:
        print(f"\n🎉 Model is ready for use in your app!")
        print(f"Use this path in your application: {model_path}")
    else:
        print("\n❌ Failed to download model. Please check your internet connection and try again.")