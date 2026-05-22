# cub3D

*This project has been created as part of the 42 curriculum by `lorlov` and `asharafe`.*

A 1992-style 3D raycaster game engine built entirely from scratch in C, inspired by the legendary *Wolfenstein 3D*. This project explores computer graphics, mathematical projections, custom parsing, and rigorous memory/error management in low-level systems programming.

[![ CLICK ON THE SCREENSHOT AND WATCH THE GAMEPLAY](https://drive.google.com/uc?export=view&id=12ycG6bhVXJ2aLWpXIk_j1kpVuZOnxB03)](https://drive.google.com/file/d/1XL65deVnCVVKG8h0_fHqrtP-BpfuXj8D/view?usp=sharing)

CLICK ON THE SCREENSHOT AND WATCH THE GAMEPLAY

## 🚀 Features

* **Real-Time Raycasting:** Renders a fluid 3D perspective from a 2D grid map using the DDA (Digital Differential Analysis) algorithm.
* **Texture Mapping:** Wall textures change dynamically based on the compass direction (North, South, East, West) the player is facing.
* **Custom Map Parser:** Validates map configurations, checks for wall enclosures, prevents leaks, and handles unexpected or duplicate layout elements gracefully.
* **Fluid Controls:** Smooth player movement, rotation, and wall collision detection to ensure smooth navigation without clipping.

## 🧠 What I Learned

Building a raycaster from the ground up shifts your perspective from *using* tools to *engineering* them. This project deepened my understanding of several core computer science and engineering concepts:

* **Applied Linear Algebra & Trigonometry:** Translating abstract vectors, camera planes, and ray-intersection angles into pixel-by-pixel rendering matrix manipulation.
* **Algorithmic Efficiency:** Implementing the **DDA (Digital Differential Analysis)** algorithm to optimize ray-stepping, minimizing calculation cycles per vertical line to maintain a high, fluid frame rate.
* **Defensive Resource Management:** Handling deep memory allocations for textures, parsed map structures, and window contexts in C. Every single pointer allocation is tracked and freed, ensuring 100% leak-free exits on both clean shutdowns and unexpected parsing errors.
* **State Machine Design:** Managing player inputs, real-time camera transformations, and screen rendering smoothly within a unified game loop without blocking the main execution thread.

## 💎 Key Value of This Project

The true value of `cub3D` isn't just about making a nostalgic game—it's a rigorous exercise in software architecture and hardware constraints.

1. **Bridging the Gap Between 2D and 3D:** It demonstrates how complex, multi-dimensional visual experiences can be engineered using simple 2D arrays and fundamental geometry, without relying on heavy modern graphics APIs like OpenGL, DirectX, or Vulkan.
2. **Data Integrity & Robust Parsing:** Writing a custom parser that reads, validates, and sanitizes unstructured configuration files (`.cub`) teaches how to handle unpredictable user data safely—a critical skill for building secure, production-grade applications in any language.
3. **Optimizing Under Constraints:** Working with the minimal graphical capabilities of the MiniLibX library forces highly optimized code. When you only have the power to push individual pixel colors directly to an image buffer, your engine logic has to be clean, lean, and intentional.

## 🛠️ Technical Challenges & Architecture

### Raycasting Mechanics
The core engine projects 2D grid data into a 3D field of view by calculating individual ray vectors for every vertical column of the screen. To prevent the "fish-eye" distortion effect, the distance to the wall is mathematically corrected relative to the camera plane vector rather than the player's single coordinate point.

### Parsing & Edge-Case Validation
A major focus of this project is defensive programming. The custom configuration parser ensures:
* The map layout is fully enclosed by walls (`1`). Any open paths to outer space throw a precise error.
* Exactly one starting position (`N`, `S`, `E`, or `W`) is defined.
* Texture paths and floor/ceiling RGB colors are structurally valid and verified accessible before launching any graphical window context.

## 📦 Installation & Setup

### Prerequisites
* GCC or Clang compiler
* MiniLibX library dependencies (X11 / AppKit depending on your operating system environment)

### Building the Project
Clone the repository and compile using the provided Makefile:

```bash
git clone [https://github.com/yourusername/cub3D.git](https://github.com/yourusername/cub3D.git)
cd cub3D
make
🎮 How to Play
Run the executable with a valid .cub map configuration file as an argument:

Bash
./cub3D maps/valid_map.cub
Controls
W A S D — Move forward, backward, and strafe left/right

Left / Right Arrow Keys — Rotate the camera view panorama

ESC or clicking the window close button — Exit the game cleanly, freeing all system allocations
