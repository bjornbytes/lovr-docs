return {
  summary = 'A mesh used for audio simulation.',
  description = [[
    AudioMeshes are triangle meshes that define geometry for audio simulation.  They are used for
    two types of audio effects:

    - **Reverb**, from sound reflecting off of solid objects in the scene.
    - **Occlusion**, where sounds will be quieter when they're behind walls.

    Audio mesh triangles can have an `AudioMaterial`, controlling how it absorbs and reflects sound.
    For example, carpet will absorb more energy than concrete or metal.

    Audio meshes can be translated, rotated, and scaled dynamically.
  ]],
  extends = 'Object',
  constructors = {
    'lovr.audio.newAudioMesh',
    'AudioMesh:clone'
  }
}
