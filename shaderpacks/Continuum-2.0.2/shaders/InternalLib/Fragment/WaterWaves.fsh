/* Copyright (C) Continuum Graphics - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Joseph Conover <support@continuum.graphics>, Febuary 2018
 */


#include "/InternalLib/Misc/NoiseTexture.glsl"

float GerstnerWave(vec2 coord, vec2 waveDirection, float globalTime, float waveSteepness, float waveAmplitude, float waveLength) {
    const float g = 19.6;

    // Wave number calculation
    float k = TAU / waveLength;
    float w = sqrt(g * k);

    // Count waves
    float x = w * globalTime - k * dot(waveDirection, coord);
    float wave = sin(x) * 0.5 + 0.5;

    return waveAmplitude * pow(wave, waveSteepness);
}

float GetWavesHeight(vec3 worldPosition) {
    const int octaves = 11;
	const float invoctaves = 1.0 / float(octaves);

    vec2 noisePosition = worldPosition.xz * 0.005;

    float allWaves = 0.0;

    float waveSpeed     = TIME * 0.25;
    float waveSteepness = 0.9;
    float waveAmplitude = 0.1;
    float waveLength    = 3.5;
    vec2 waveDirection  = vec2(0.5, 0.2);

    const float r  = 0.4;
	const vec2 sc  = vec2(sin(r), cos(r));
	const mat2 rot = mat2(sc.y, -sc.x, sc.x, sc.y);

    for(int i = 0; i < octaves; ++i) {
        vec2 internalNoise = Get2DNoiseSmooth(noisePosition / sqrt(waveLength)).xy;

        allWaves += GerstnerWave(worldPosition.xz + (internalNoise * 2.0 - 1.0) * sqrt(waveLength), waveDirection, waveSpeed, waveSteepness, waveAmplitude, waveLength) - internalNoise.x * waveAmplitude;

        waveSteepness *= 0.95;
        waveAmplitude *= 0.6;
        waveLength    *= 0.72;
        waveSpeed     *= 1.075;

		waveDirection *= rot;
		noisePosition *= rot;
    }

	return -allWaves;
}

vec3 GetWavesNormal(vec3 position) {
    // TODO: Water parallax here.

	const float delta  = 0.08;
	const float iDelta = 1.0 / delta;

	float t = GetWavesHeight(position);
	float h = GetWavesHeight(position + vec3(delta, 0.0, 0.0));
	float v = GetWavesHeight(position + vec3(0.0, 0.0, delta));

	float dx = (t - h) * iDelta;
	float dz = (t - v) * iDelta;

    return normalize(vec3(dx, dz, 1.0));
}
