# Memory Allocator Project: Turbo Malloc Competition 🏆  

This project was my entry into the **Turbo Malloc Contest**, a competitive programming challenge where over 250 students implemented custom memory allocators in C to outperform both peers and the **glibc malloc**. The goal was to achieve superior performance and efficiency across a variety of test cases while adhering to correctness requirements.

---

## 🚀 Project Overview  

I developed a custom memory allocator that implemented `malloc`, `calloc`, `realloc`, and `free` from scratch. The allocator was designed to optimize memory usage, reduce fragmentation, and improve execution times. My implementation utilized **First Fit** and **Best Fit** allocation strategies, along with significant optimizations to metadata and free list management.

---

## 🛠️ Implementation Details  

### Allocation Strategies
I tested 2 strategies of which I found the first to ultimately be faster through testing:

1. **First Fit:**  
   - The allocator scanned the free list for the first block large enough to satisfy the allocation request.  
   - This strategy was simple and fast, making it ideal for smaller allocations or workloads with low fragmentation.  

2. **Best Fit:**  
   - The allocator searched for the smallest block that could satisfy the request, minimizing wasted space.  
   - While slightly slower than First Fit, this approach reduced external fragmentation over time.  

### Metadata Optimization  
One of the key innovations in my implementation was reducing metadata size from **52 bytes** to **24 bytes**. This was achieved by:  
- Removing unnecessary pointers like backward tags (`btag`) and redundant pointers in the free list structure.  
- Leveraging **address calculation** and pointer arithmetic to infer block sizes and relationships instead of storing explicit values.  

This optimization not only reduced overhead but also improved cache locality, leading to faster memory operations.

### Free List Management  
I implemented an **address-ordered free linked list**, which maintained free blocks in ascending order of their addresses. This allowed for:  
- Faster coalescing of adjacent free blocks during deallocation.  
- Improved performance in Best Fit searches due to predictable block ordering.

---

## 🎯 Results  

### Performance Against glibc  
My allocator was tested against the standard library's glibc implementation across a variety of test cases, including small allocations, large allocations, and mixed workloads. The scoring formula rewarded implementations that minimized execution time and memory usage relative to glibc.

#### Key Achievements:  
- **Beating 250+ Students:** My allocator outperformed all other student implementations in both correctness and performance.  
- **Only One to Beat glibc Optimized Allocator:** I achieved a performance score **20% better than glibc**, making my implementation the only one to surpass its optimized version in the contest.

---

## 📊 Contest Scoring Formula 💡  

The contest scoring formula evaluated both execution time and memory efficiency:  
![image](https://github.com/user-attachments/assets/cad2d41c-d08a-41f0-b121-982fb6252c2c)

Where:

- **n**: The number of tests.
- **reference** (in the subscript): Refers to the reference implementation (e.g., glibc).
- **student** (in the subscript): Refers to the student’s implementation.
- **time_reference,i**: The time the reference implementation spends on test `i`.
- **time_student,i**: The time the student’s implementation spends on test `i`.
- **avg_reference,i**: The average memory used by the reference implementation on test `i`.
- **avg_student,i**: The average memory used by the student’s implementation on test `i`.
- **max_reference,i**: The maximum memory used by the reference implementation on test `i`.
- **max_student,i**: The maximum memory used by the student’s implementation on test `i`. 

Higher scores indicated better performance relative to glibc.

---

## 🏆 Results Breakdown  

### Standard Library (glibc) ✨  
![image](https://github.com/user-attachments/assets/925aaf93-f68d-4066-9e5d-22f1d6a3c918)

### Standard Library (glibc optimized) ✨  
![image](https://github.com/user-attachments/assets/d8cecb3e-7412-40cb-9b54-496faae80c17)

### My Memory Allocator ✨  
![image](https://github.com/user-attachments/assets/e9344dcc-3512-498e-acf4-17b8901f6097)

### Performance Comparison:  
| Metric                 | My Allocator       | glibc             | Improvement |
|------------------------|--------------------|-------------------|-------------|
| Performance Score      | 122.17             | 100.00            | +20%        |
| Avg Memory Usage       | Lower              | Higher            | Significant |
| Execution Time         | Faster             | Slower            | Noticeable  |

---

## 📈 Analysis of Success  

### Why My Allocator Outperformed glibc:  
1. **Efficient Metadata Design:** Reducing metadata size from 52 bytes to 24 bytes minimized overhead and improved cache locality.  
2. **Optimized Free List Management:** The address-ordered free linked list enabled faster coalescing and reduced fragmentation over time.  
3. **Balanced Allocation Strategies:** Combining First Fit and Best Fit approaches allowed my allocator to adapt effectively to different workloads.

---

## 🔗 Useful Links  

- [Memory Allocator Competition](https://grd-cs341-01.cs.illinois.edu/malloc)
- [C Memory Allocation API Documentation](http://man7.org/linux/man-pages/man)
