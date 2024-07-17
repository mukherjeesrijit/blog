## Problem Statement
### Difficulty
Medium

Design a custom PyTorch `Dataset` and `DataLoader` for a medical imaging task involving brain scans. Your task is to preprocess and load MRI images along with their corresponding labels for a binary classification problem.

### Input
- `root_dir`: Root directory containing the MRI images and labels.
- `transform`: Optional data transformation to apply (e.g., normalization, augmentation).

### Output
- A tuple `(image, label)` where:
  - `image`: Processed MRI image tensor.
  - `label`: Binary label indicating the presence or absence of a medical condition.

### Example

```python
from torch.utils.data import Dataset, DataLoader
from torchvision import transforms
from PIL import Image

class BrainMRI_Dataset(Dataset):
    def __init__(self, root_dir, transform=None):
        self.root_dir = root_dir
        self.transform = transform
        # Load file paths and labels here
        
    def __len__(self):
        # Return the total number of samples
        
    def __getitem__(self, idx):
        # Implement logic to load and preprocess each sample
        # Return a tuple (image, label)
        
# Example usage:
transform = transforms.Compose([
    transforms.Resize((256, 256)),
    transforms.ToTensor()
])
dataset = BrainMRI_Dataset(root_dir='path/to/data', transform=transform)
dataloader = DataLoader(dataset, batch_size=4, shuffle=True)

for batch_idx, (images, labels) in enumerate(dataloader):
    # Train your model using images and labels
    pass
