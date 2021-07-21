---
title: Programming in Cilk
permalink: /programming/
sidebar:
  nav: "docs"
tags: opencilk tutorial 
---

OpenCilk makes it easy to parallelize an existing serial C or C++
program.

1. Modify the source file to include the `cilk/cilk.h` header file.

2. Expose logical parallelism within the program using [Cilk's three
keywords](keywords): `cilk_spawn`, `cilk_sync` and
`cilk_for`.

3. [Compile](compiling) the program using the OpenCilk compiler by
passing the extra compiler flag `-fopencilk`.

4. Run the resulting binary.

We also recommend the following best practices for Cilk programming.

1. Use [Cilksan](cilksan) to check that your Cilk program is free from
   unintended races.

2. Use [Cilkscale](cilkscale) to measure your program's [parallel
   scalability](dag) and zero-in on scalability bottlenecks.
