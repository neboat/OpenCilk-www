---
title: OpenCilk
layout: splash
classes:
  - landing
keywords: Cilk, Reducers, Cilksan, Cilkprof, Tapir, multicore, parallel programing
description: OpenCilk seeks to provide quality open-source parallel-programming software and support services for the benefit of application programmers and computer-science researchers.
excerpt: "Welcome to OpenCilk!  Here you can find recent developments with the Cilk multithreaded programming technology."
header:
  overlay_color: rgba(73, 157, 102, 1)
  actions:
    - label: "Download OpenCilk"
      url: /download/
    - label: "Start coding"
      url: /programming/
feature_row:
  - title: "Placeholder 1"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
  - title: "Placeholder 2"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
    url: "#test-link"
    btn_label: "Read More"
    btn_class: "btn--inverse"
  - title: "Placeholder 3"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
---
  <!-- overlay_color: rgba(46, 139, 87, 1) -->

{% include feature_row %}

## Featured news

{% if paginator %}
  {% assign posts = paginator.posts %}
{% else %}
  {% assign posts = site.posts %}
{% endif %}

{% assign entries_layout = page.entries_layout | default: 'list' %}
<div class="entries-{{ entries_layout }}">
  {% for post in posts %}
	{% if post.featured %}
      {% include archive-single.html type=entries_layout %}
	{% endif %}
  {% endfor %}
</div>

{% include paginator.html %}

## What is Cilk?  What is OpenCilk?

***Cilk*** aims to make parallel programming a simple extension of
ordinary serial programming.  Other concurrency platforms, such as
[Intel's Threading Building Blocks
(TBB)](https://www.threadingbuildingblocks.org/) and
[OpenMP](http://www.openmp.org/), share similar goals of making
parallel programming easier.  But Cilk sets itself apart from other
concurrency platforms through its simple design and implementation and
its powerful suite of provably effective software productivity tools.
These properties make Cilk well suited as a platform for
next-generation multicore research.

***OpenCilk*** is the newest open-source implementation of the Cilk
parallel-computing platform.  OpenCilk is largely compatible with the
[Cilk Plus](https://www.cilkplus.org/) language extension to C and
C++; see the [programming guide](documentation) for details.  OpenCilk
incorporates several enhancements to the Cilk platform:

- **Compilation based on Tapir/LLVM:** The OpenCilk compiler is based
on the Tapir/LLVM compiler to compile and optimize parallel programs
more efficiently and effectively than existing compilers for parallel
programming languages.

- **Provably efficient scheduling:** The Cilk runtime system
implements a randomized work-stealing scheduler that is guaranteed to
schedule the parallel program efficiently on whatever parallel
processors are available at runtime.

- **Regression-testing for races:** The Cilksan determinacy-race
detector offers provable guarantees that enable effective
regression-testing of Cilk programs for determinism.

- **Scalability analysis:** The Cilkscale scalability analyzer
efficiently measures the parallel scalability of a Cilk program,
helping programmers find performance bottlenecks that inhibit a
program from speeding up on increasing numbers of processors.

## What's in the works?

There are several enhancements to the OpenCilk system currently under
development:

- New language constructs, including support for spawning statements,
  Cilk scopes that are automatically synced when control leaves their
  lexical scope, and support for inlets.
- A new implementation of reducer hyperobjects that includes an
  improved language syntax for using reducers, a more efficient
  implementation of reducers in the runtime system, and compiler
  optimizations that target reducers in Cilk programs.
- Various parallel compiler optimizations, including general sync
  elimination, fusion of `cilk_for` loops, and automatic coarsening of
  `cilk_for` loops.
- Runtime interoperability with Pthreads, to allow programmers to
  parallelize individual Pthreads using Cilk without breaking existing
  concurrency mechanisms in the program.
- Performance enhancements to the Cilksan determinacy-race detector.
  These enhancements include data-compression schemes to reduce
  Cilksan's space overhead, a more efficient implementation of the
  Cilksan algorithm, and incorporation of compiler analysis of
  determinacy races into Cilksan.
- Improved scalability analysis and profiling.  These improvements
  including augmenting Cilkscale to analyze scheduling overheads, to
  profile the work and span of a Cilk program, and to analyze the
  sensitivity of each function on the whole program's scalability.
- Integration of the CSI framework for compiler instrumentation.  The
  CSI framework makes it easy for tool writers to write efficient
  dynamic-analysis tools that use compiler instrumentation without
  modifying the compiler or understanding its internals.
- Enhanced documentation on programming in Cilk and on using each
  component of the Cilk platform.  As a result, developers working on
  other parallel languages, such as [OpenMP](http://www.openmp.org/),
  [Julia](https://julialang.org/), or
  [Rayon](https://github.com/rayon-rs/rayon), can selectively make use
  of components of the Cilk platform, such as the Tapir/LLVM compiler,
  the runtime system, or the tool suite.
- Educational and teaching materials, workshops, and tutorials on
  Cilk.
- A cloud VM with the complete package of Cilk technologies installed
  and properly configured, to make it easy to try out Cilk.
- Cilk software libraries, including libraries for graph computations,
  such as [Ligra](https://people.eecs.berkeley.edu/~jshun/ligra.html).
- A suite of benchmark applications written in Cilk, including
  benchmarks in the [Problem-based benchmark
  suite](http://www.cs.cmu.edu/~pbbs/).

Have a suggestion or feature request?  We want to hear about it!  Post
your suggestion on our [issue
tracker](https://github.com/OpenCilk/opencilk-project/issues).

## Next steps

- [Download and install](download) the OpenCilk system.
- Get started [programming](programming) with Cilk.
- Read about the [history](history) of Cilk.
- Learn about [who we are](about).

## Contact us

Have a question about Cilk?  Want to keep up to date on the latest
Cilk technology?  Found a bug?  Have a suggestion?  Let us know!

- Send questions and suggestions to `contact _at_ opencilk _dot_ org`.
- Report bugs through `bugs _at_ opencilk _dot_ org`.

