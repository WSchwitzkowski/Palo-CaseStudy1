#pragma once

#include <cmath>
#include <cstdio>
#include <algorithm>
#include <omp.h>

#if defined(__INTEL_COMPILER)
#include <malloc.h>
#else
#include <mm_malloc.h>
#endif // defined(__GNUC__)

#ifdef __INTEL_COMPILER
#define _HAS_CONDITIONAL_EXPLICIT 0
#endif

// Struct zur Beschreibung eines Teilchens
struct Particle {  
	float x, y, z; // Koordinaten des Teilchens
	float vx, vy, vz;  // Geschwindigkeiten des Teilchens
};

// Prototypen
void MoveParticles(const int nr_Particles, Particle* const partikel, const float dt);
