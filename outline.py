import cv2

# Load image
img = cv2.imread("unnamed.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Optional: blur to reduce noise
blurred = cv2.GaussianBlur(gray, (5, 5), 0)

# Detect edges using Canny
edges = cv2.Canny(blurred, 50, 150)

# Save the result
cv2.imwrite("shirt_outline.png", edges)

