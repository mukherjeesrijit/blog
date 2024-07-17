## Problem Statement

You are given a dataset of images and labels. Implement a PyTorch DataLoader that takes batches of images and labels and returns them for training a deep learning model. Each batch should consist of `batch_size` images and corresponding labels.

### Input

- `images`: A list of paths to image files.
- `labels`: A list of integer labels corresponding to each image.
- `batch_size`: An integer indicating the size of each batch.

### Output

- A generator or iterable that yields batches of images and labels.

### Example

```python
from torchvision import datasets, transforms
from torch.utils.data import DataLoader

# Example data
images = ['/path/to/image1.jpg', '/path/to/image2.jpg', '/path/to/image3.jpg', '/path/to/image4.jpg']
labels = [0, 1, 0, 2]
batch_size = 2

# Create a custom dataset and dataloader
class CustomDataset(Dataset):
    def __init__(self, images, labels):
        self.images = images
        self.labels = labels
    
    def __len__(self):
        return len(self.images)
    
    def __getitem__(self, idx):
        image_path = self.images[idx]
        label = self.labels[idx]
        # Load and preprocess image (e.g., using torchvision.transforms)
        image = Image.open(image_path).convert('RGB')
        image = transforms.ToTensor()(image)
        return image, label

# Create DataLoader instance
dataset = CustomDataset(images, labels)
dataloader = DataLoader(dataset, batch_size=batch_size, shuffle=True)

# Accessing batches
for batch_images, batch_labels in dataloader:
    print("Batch Images:", batch_images)
    print("Batch Labels:", batch_labels)
```

### Constraints
* The maximum length of images and labels lists is 10,000.
* Each image can be assumed to be RGB and of fixed size.
* Ensure that the DataLoader efficiently handles batches and shuffles data when required.

### Learning Goal
This problem outlines the task of implementing a custom PyTorch DataLoader to handle batches of images and labels efficiently for training a deep learning model. Adjustments to batch size and dataset handling can provide varying levels of difficulty or additional constraints as needed.
