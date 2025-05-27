import cv2
import numpy as np

img = cv2.imread("unnamed.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
blurred = cv2.GaussianBlur(gray, (5, 5), 0)
edges = cv2.Canny(blurred, 50, 150)


kernel = np.ones((2, 2), np.uint8)  
thick_edges = cv2.dilate(edges, kernel, iterations=1)

cv2.imwrite("shirt_outline_thick3.png", thick_edges)
