/* Copyright (C) Continuum Graphics - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Joseph Conover <support@continuum.graphics>, January 2018
 */

#version 120

#define frag
#define gbuffers_water

uniform sampler2D noisetex;

#include "/gbuffers_main_translucent.fsh"
