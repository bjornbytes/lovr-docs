return {
  tag = 'modules',
  summary = 'Renders graphics using the GPU.',
  description = [[
    The graphics module renders graphics or performs computation using the GPU.

    Work Submission
    ---

    The GPU is a separate device that runs asynchronously from the main system.  Work is sent to
    the GPU in chunks.  A chunk of work is started using `lovr.graphics.begin`, and a chunk is
    submitted to the GPU using `lovr.graphics.submit`.  All graphics work must happen between
    these two calls.  Normally they are called automatically by the default main loop provided
    by `lovr.run`, but it's possible to call them yourself to do graphics work at different
    times, like in `lovr.update` or some other callback.

    Although it's common to use a single chunk for all work in a frame, chunks do not correspond
    to frames and the work for a frame can be submitted in multiple chunks.  The advantage of
    this is that the GPU can start processing work for earlier chunks while more chunks are
    being recorded.  Overlapping CPU and GPU work like this can improve performance.

    There are only 3 types of work that happen within a chunk: **render**, **compute**, and
    **transfer**.

    Rendering
    ---

    The only way to render graphics is to call `lovr.graphics.render`.  This function takes a
    render target and a set of `Batch` objects that define what should be drawn.

    A render target consists of up to 4 color textures and an optional depth buffer.

    Rendering to array textures with multiple layers will broadcast draws to each layer, using a
    different camera for each view.  This can be used to efficiently render stereo, cubemaps,
    splitscreen, or anything where the same objects need to be rendered from mulitple views.

    The content to render can be provided as prerecorded `Batch` objects or as a callback
    function that records a new temporary batch.

    Compute
    ---

    Compute shaders can only be dispatched inside `lovr.graphics.compute`.  This function takes
    a list of `Batch` objects, similar to `lovr.graphics.render`.

    Inside of a call to `lovr.graphics.compute`, there is no synchronization, meaning that the
    Batches and their compute dispatches can run in any order and are not expected to depend on
    each other.  If a compute shader relies on results from a previous compute dispatch, they
    should go in distinct calls to `compute`.

    Transfer
    ---

    Transfer operations do not happen in a dedicated scope but are functions on the 2 GPU resources,
    `Buffer` and `Texture` objects.  An important aspect of transfers is that they always run before
    render and compute work in the chunk.  To interleave transfers with other work, multiple chunks
    must be used.

    Hardware Info
    ---

    There are a wide variety of GPUs, each with their own set of capabilities and limitations.  The
    graphics module exposes information about the current GPU using 3 functions:

    - `lovr.graphics.getHardware` exposes general hardware info (e.g. model number).
    - `lovr.graphics.getFeatures` exposes features, (e.g. extra functions in shaders).
    - `lovr.graphics.getLimits` exposes limits (e.g. maximum texture size).

    Threading
    ---

    The graphics module supports multithreaded rendering.  There are some important rules to
    follow to ensure thread safety and avoid crashes or corrupted data.

    Only one chunk can be recorded at a time.  During `lovr.graphics.begin` and
    `lovr.graphics.submit`, no other graphics work may occur on other threads.  Within a chunk,
    graphics and compute work can be recorded on multiple threads.

    Within a chunk, any number of `lovr.graphics.render` and `lovr.graphics.compute` calls can
    be running on threads simultaneously.  Use the `order` parameter to these functions to
    define the order that they will run in, so threads don't need to wait for each other.

    A `Batch` object can only be recorded on a single thread at a time, but multiple batches can
    be recorded in parallel and later passed to a render/compute call.

    Transfers will run in any order, before all of the render and compute for the chunk.
  ]]
}
