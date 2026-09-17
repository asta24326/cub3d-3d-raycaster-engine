# 🎮 cub3D — 3D Raycaster Game Engine in C

A 1992-style 3D raycaster game engine built entirely from scratch in C, inspired by the legendary *Wolfenstein 3D*. Developed as part of the 42 School curriculum by [Aidar Sharafeev](https://github.com/asta24326) and [lorlov](https://github.com/lorlov).

![Score](https://img.shields.io/badge/Score-122%2F100-brightgreen?style=for-the-badge)
![C Language](https://img.shields.io/badge/C-00599C?style=for-the-badge&logo=c&logoColor=white)
![42 Berlin](https://img.shields.io/badge/42-Berlin-000000?style=for-the-badge&logo=42&logoColor=white)
![MiniLibX](https://img.shields.io/badge/Library-MiniLibX-orange?style=for-the-badge)
![Valgrind](https://img.shields.io/badge/Valgrind-Leak%20Free-brightgreen?style=for-the-badge)

## 🎬 Gameplay Screenshot

![cub3D Raycaster Engine](https://drive.google.com/uc?export=view&id=12ycG6bhVXJ2aLWpXIk_j1kpVuZOnxB03)

## 🚀 Key Features

- **Real-Time Raycasting Engine:** Renders a 3D perspective from a 2D grid map using the DDA (Digital Differential Analysis) algorithm.
- **Directional Texture Mapping:** Wall textures dynamically change depending on compass orientation (North, South, East, West).
- **Defensive Map Parsing:** Validates `.cub` map integrity, checks wall enclosures, verifies color ranges, and prevents memory leaks on invalid inputs.
- **Smooth Controls & Collision:** Handles continuous multi-key movement, camera rotation, and wall collision detection without clipping.

## 📦 Built With

- **C** — Core language
- **MiniLibX** — X11 / AppKit graphics interface
- **GCC** — Compiler
- **Make** — Build automation
- **Valgrind** — Memory leak detection and analysis

## 🚦 Running the Project

### 1. Clone the Repository

```bash
git clone https://github.com/asta24326/cub3D.git
cd cub3D
```

### 2. Build the Project

```bash
make
```

### 3. Launch the Game

```bash
./cub3D maps/valid_map.cub
```

### Controls

| Key | Action |
|-----|--------|
| **W** | Move forward |
| **A** | Strafe left |
| **S** | Move backward |
| **D** | Strafe right |
| **← / →** | Rotate camera left/right |
| **ESC** | Exit cleanly (zero memory leaks) |
| **Close Button** | Exit cleanly |

## 📍 The Process

We approached cub3D as a low-level graphics and systems architecture challenge. Rather than using external 3D frameworks, we translated 2D coordinates into 3D projections manually.

### Architecture Overview

We split the engineering process into two core components:

1. **Custom Parser** — Validates and sanitizes raw configuration files
   - Verifies map boundaries and wall enclosure
   - Validates color and texture specifications
   - Prevents memory leaks on invalid inputs

2. **Rendering Engine** — Math-heavy 3D projection system
   - Applies DDA algorithm to step through the grid per screen column
   - Minimizes rendering math cycles
   - Applies fish-eye lens correction relative to player camera plane

By applying the DDA algorithm to trace rays for each screen column, we achieved efficient rendering without modern GPU acceleration while maintaining consistent frame rates.

## 🧠 What I Learned & Overall Growth

### Applied Linear Algebra & Graphics
- Mastered vector projections and camera plane mathematics
- Calculated delta distances and applied matrix transformations
- Successfully mapped 2D arrays to 3D field-of-view rendering

### Performance Optimization
- Leveraged the DDA algorithm for high frame rates
- Optimized for execution without GPU hardware acceleration
- Balanced mathematical complexity with real-time performance demands

### Defensive Parsing & Resource Tracking
- Built strict validation for user configuration files
- Ensured all pointers, texture surfaces, and window contexts clean up perfectly on error or exit
- Implemented comprehensive error handling throughout the application lifecycle

### State Engine Management
- Coordinated user inputs with frame rendering
- Integrated window event hooks inside an asynchronous event loop
- Managed continuous multi-key input states without conflicts

## 💡 How It Can Be Improved

### Textured Floors & Ceilings
- Implement raycasted horizontal plane rendering
- Add floor and ceiling texture support for immersive environment coverage

### Interactive Map Elements
- Add dynamic doors with open/close mechanics
- Implement collectible items and pickups
- Introduce ambient lighting and shadow attenuation for atmosphere

### Sprite Rendering
- Implement billboarded 2D sprites for realistic scaling
- Add depth buffering for proper z-ordering
- Support for enemies and dynamic environment objects

### Mouse Look
- Integrate continuous mouse cursor tracking
- Implement smoother first-person camera panning
- Add mouse sensitivity adjustments

### Advanced Features
- Implement minimap display for player orientation
- Add particle effects (explosions, impacts)
- Support for multiple weapon animations
- Network multiplayer capabilities

## 📊 Project Statistics

- **Score:** 122/100 (with bonuses)
- **Memory:** Completely leak-free (verified with Valgrind)
- **Language:** Pure C with no external 3D libraries
- **Development Time:** Completed within 42 School project timeline
- **Collaborators:** Aidar Sharafeev & lorlov

## 🔗 Related Resources

- [42 School Curriculum](https://42.fr/en/homepage/)
- [Raycasting Explained](https://en.wikipedia.org/wiki/Raycasting)
- [DDA Algorithm](https://en.wikipedia.org/wiki/Digital_differential_analyzer)
- [Wolfenstein 3D — The Game That Started It All](https://en.wikipedia.org/wiki/Wolfenstein_3D)

## 📝 License

This project is part of the 42 School curriculum. Please refer to the [42 School's subject PDF](https://github.com/asta24326/cub3D) for licensing and usage guidelines.

---

**Built with ❤️ at 42 Berlin**
