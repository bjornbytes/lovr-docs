declare extern type userdata with end
declare extern type lightuserdata with end

declare extern type quaternion with
  x: number
  y: number
  z: number
  w: number
end

type Vec2 = {number}
type Vec3 = {number} | vector
type Vec4 = {number}
type Quat = {number} | quaternion
type Mat4 = {number}

declare class Joint end
declare class Shape end

declare class Object
  function release(self)
  function type(self): string
end

type AudioMaterial =
  | "generic"
  | "brick"
  | "carpet"
  | "ceramic"
  | "concrete"
  | "glass"
  | "gravel"
  | "metal"
  | "plaster"
  | "rock"
  | "wood"

type AudioShareMode =
  | "shared"
  | "exclusive"

type AudioType =
  | "playback"
  | "capture"

type Effect =
  | "absorption"
  | "attenuation"
  | "occlusion"
  | "reverb"
  | "spatialization"
  | "transmission"

type TimeUnit =
  | "seconds"
  | "frames"

type VolumeUnit =
  | "linear"
  | "db"

declare class Source extends Object
  function clone(self): Source
  function getDirectivity(self): (number, number)
  function getDuration(self, unit: TimeUnit?): number
  function getOrientation(self): (number, number, number, number)
  function getPitch(self): number
  function getPose(self): (number, number, number, number, number, number, number)
  function getPosition(self): (number, number, number)
  function getRadius(self): number
  function getSound(self): Sound
  function getVolume(self, units: VolumeUnit?): number
  function isEffectEnabled(self, effect: Effect): boolean
  function isLooping(self): boolean
  function isPlaying(self): boolean
  function isSpatial(self): boolean
  function pause(self)
  function play(self): boolean
  function seek(self, position: number, unit: TimeUnit?)
  function setDirectivity(self, weight: number, power: number)
  function setEffectEnabled(self, effect: Effect, enable: boolean)
  function setLooping(self, loop: boolean)
  function setOrientation(self, angle: number, ax: number, ay: number, az: number)
  function setOrientation(self, orientation: Quat)
  function setPitch(self, pitch: number)
  function setPose(self, x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number)
  function setPose(self, position: Vec3, orientation: Quat)
  function setPosition(self, x: number, y: number, z: number)
  function setPosition(self, position: Vec3)
  function setRadius(self, radius: number)
  function setVolume(self, volume: number, units: VolumeUnit?)
  function stop(self)
  function tell(self, unit: TimeUnit?): number
end

type AudioModule = {
  getAbsorption: () -> (number, number, number),
  getDevice: (type: AudioType?) -> (string | nil, userdata | nil),
  getDevices: (type: AudioType?) -> {},
  getOrientation: () -> (number, number, number, number),
  getPose: () -> (number, number, number, number, number, number, number),
  getPosition: () -> (number, number, number),
  getSampleRate: () -> number,
  getSpatializer: () -> string,
  getVolume: (units: VolumeUnit?) -> number,
  isStarted: (type: AudioType?) -> boolean,
  newSource:
    & ((file: string | Blob, options: {}?) -> Source)
    & ((sound: Sound, options: {}?) -> Source),
  setAbsorption: (low: number, mid: number, high: number) -> (),
  setDevice: (type: AudioType?, id: userdata?, sink: Sound?, mode: AudioShareMode?) -> boolean,
  setGeometry:
    & ((vertices: {}, indices: {}, material: AudioMaterial?) -> boolean)
    & ((model: Model, material: AudioMaterial?) -> boolean),
  setOrientation:
    & ((angle: number, ax: number, ay: number, az: number) -> ())
    & ((orientation: Quat) -> ()),
  setPose:
    & ((x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number) -> ())
    & ((position: Vec3, orientation: Quat) -> ()),
  setPosition:
    & ((x: number, y: number, z: number) -> ())
    & ((position: Vec3) -> ()),
  setVolume: (volume: number, units: VolumeUnit?) -> (),
  start: (type: AudioType?) -> boolean,
  stop: (type: AudioType?) -> boolean,
}

type AnimationProperty =
  | "translation"
  | "rotation"
  | "scale"
  | "weights"

type AttributeType =
  | "i8"
  | "u8"
  | "i16"
  | "u16"
  | "i32"
  | "u32"
  | "f32"

type ChannelLayout =
  | "mono"
  | "stereo"
  | "ambisonic"

type DefaultAttribute =
  | "position"
  | "normal"
  | "uv"
  | "color"
  | "tangent"
  | "joints"
  | "weights"

type ModelDrawMode =
  | "points"
  | "lines"
  | "linestrip"
  | "lineloop"
  | "strip"
  | "triangles"
  | "fan"

type SampleFormat =
  | "f32"
  | "i16"

type SmoothMode =
  | "step"
  | "linear"
  | "cubic"

type TextureFormat =
  | "r8"
  | "rg8"
  | "rgba8"
  | "bgra8"
  | "r16"
  | "rg16"
  | "rgba16"
  | "r16f"
  | "rg16f"
  | "rgba16f"
  | "r32f"
  | "rg32f"
  | "rgba32f"
  | "rgb565"
  | "rgb5a1"
  | "rgb10a2"
  | "rg11b10f"
  | "d16"
  | "d24"
  | "d24s8"
  | "d32f"
  | "d32fs8"
  | "bc1"
  | "bc2"
  | "bc3"
  | "bc4u"
  | "bc4s"
  | "bc5u"
  | "bc5s"
  | "bc6uf"
  | "bc6sf"
  | "bc7"
  | "astc4x4"
  | "astc5x4"
  | "astc5x5"
  | "astc6x5"
  | "astc6x6"
  | "astc8x5"
  | "astc8x6"
  | "astc8x8"
  | "astc10x5"
  | "astc10x6"
  | "astc10x8"
  | "astc10x10"
  | "astc12x10"
  | "astc12x12"

declare class Blob extends Object
  function getSize(self): number
  function getName(self): string
  function getPointer(self): userdata
  function getString(self, offset: number?, size: number?): string
  function getI8(self, offset: number?, count: number?): number
  function getU8(self, offset: number?, count: number?): number
  function getI16(self, offset: number?, count: number?): number
  function getU16(self, offset: number?, count: number?): number
  function getI32(self, offset: number?, count: number?): number
  function getU32(self, offset: number?, count: number?): number
  function getF32(self, offset: number?, count: number?): number
  function getF64(self, offset: number?, count: number?): number
  function setI8(self, offset: number, ...: number)
  function setI8(self, offset: number, table: {number})
  function setU8(self, offset: number, ...: number)
  function setU8(self, offset: number, table: {number})
  function setI16(self, offset: number, ...: number)
  function setI16(self, offset: number, table: {number})
  function setU16(self, offset: number, ...: number)
  function setU16(self, offset: number, table: {number})
  function setI32(self, offset: number, ...: number)
  function setI32(self, offset: number, table: {number})
  function setU32(self, offset: number, ...: number)
  function setU32(self, offset: number, table: {number})
  function setF32(self, offset: number, ...: number)
  function setF32(self, offset: number, table: {number})
  function setF64(self, offset: number, ...: number)
  function setF64(self, offset: number, table: {number})
end

declare class Image extends Object
  function encode(self): Blob
  function getBlob(self): Blob
  function getDimensions(self): (number, number)
  function getFormat(self): TextureFormat
  function getHeight(self): number
  function getPixel(self, x: number, y: number): (number, number, number, number)
  function getPointer(self, level: number?, layer: number?): userdata
  function getWidth(self): number
  function mapPixel(self, callback: () -> (), x: number?, y: number?, w: number?, h: number?)
  function paste(self, source: Image, x: number?, y: number?, fromX: number?, fromY: number?, width: number?, height: number?)
  function setPixel(self, x: number, y: number, r: number, g: number, b: number, a: number?)
end

declare class ModelData extends Object
  function getAnimationChannelCount(self, animation: number | string): number
  function getAnimationCount(self): number
  function getAnimationDuration(self, animation: string | number): number
  function getAnimationKeyframe(self, animation: number, channel: number, keyframe: number): (number, number)
  function getAnimationKeyframeCount(self, animation: string | number, channel: number): number
  function getAnimationName(self, index: number): string | nil
  function getAnimationNode(self, animation: number, channel: number): number
  function getAnimationProperty(self, animation: string | number, channel: number): AnimationProperty
  function getAnimationSmoothMode(self, animation: string | number, channel: number): SmoothMode
  function getBlendShapeCount(self): number
  function getBlendShapeName(self, index: number): string
  function getBlob(self, index: number): Blob
  function getBlobCount(self): number
  function getBoundingBox(self): (number, number, number, number, number, number)
  function getBoundingSphere(self): (number, number, number, number)
  function getCenter(self): (number, number, number)
  function getDepth(self): number
  function getDimensions(self): (number, number, number)
  function getHeight(self): number
  function getImage(self, index: number): Image
  function getImageCount(self): number
  function getMaterial(self, material: number): {}
  function getMaterialCount(self): number
  function getMaterialName(self, index: number): string
  function getMeshCount(self): number
  function getMeshDrawMode(self, mesh: number): ModelDrawMode
  function getMeshIndex(self, mesh: number, index: number): number
  function getMeshIndexCount(self, mesh: number): number
  function getMeshIndexFormat(self, mesh: number): (AttributeType, number, number, number)
  function getMeshMaterial(self, mesh: number): number
  function getMeshVertex(self, mesh: number, vertex: number): number
  function getMeshVertexCount(self, mesh: number): number
  function getMeshVertexFormat(self, mesh: number): {}
  function getMetadata(self): string
  function getNodeChildren(self, node: string | number): {number}
  function getNodeCount(self): number
  function getNodeMeshes(self, node: string | number): {}
  function getNodeName(self, index: number): string
  function getNodeOrientation(self, node: string | number): (number, number, number, number)
  function getNodeParent(self, node: string | number): number
  function getNodePose(self, node: string | number): (number, number, number, number, number, number, number)
  function getNodePosition(self, node: string | number): (number, number, number)
  function getNodeScale(self, node: string | number): (number, number, number)
  function getNodeSkin(self, node: string | number): number
  function getNodeTransform(self, node: string | number): (number, number, number, number, number, number, number, number, number, number)
  function getRootNode(self): number
  function getSkinCount(self): number
  function getSkinInverseBindMatrix(self, skin: number, joint: number): number
  function getSkinJoints(self, skin: number): {}
  function getTriangleCount(self): number
  function getTriangles(self): ({}, {})
  function getVertexCount(self): number
  function getWidth(self): number
end

declare class Rasterizer extends Object
  function getAdvance(self, glyph: string | number): number
  function getAscent(self): number
  function getBearing(self, glyph: string | number): number
  function getBoundingBox(self, glyph: string | number): (number, number, number, number)
  function getBoundingBox(self): (number, number, number, number)
  function getCurves(self, glyph: string | number, three: boolean): {}
  function getDescent(self): number
  function getDimensions(self, glyph: string): (number, number)
  function getDimensions(self): (number, number)
  function getFontSize(self): number
  function getGlyphCount(self): number
  function getHeight(self, glyph: string | number): number
  function getHeight(self): number
  function getKerning(self, first: string | number, second: string | number): number
  function getLeading(self): number
  function getWidth(self, glyph: string | number): number
  function getWidth(self): number
  function hasGlyphs(self, ...: string | number): boolean
  function newImage(self, glyph: string | number, spread: number?, padding: number?): Image
end

declare class Sound extends Object
  function getBlob(self): Blob
  function getByteStride(self): number
  function getCapacity(self): number
  function getChannelCount(self): number
  function getChannelLayout(self): ChannelLayout
  function getDuration(self): number
  function getFormat(self): SampleFormat
  function getFrameCount(self): number
  function getFrames(self, count: number?, srcOffset: number?): ({number}, number)
  function getFrames(self, t: {}, count: number?, srcOffset: number?, dstOffset: number?): ({number}, number)
  function getFrames(self, blob: Blob, count: number?, srcOffset: number?, dstOffset: number?): number
  function getFrames(self, sound: Sound, count: number?, srcOffset: number?, dstOffset: number?): number
  function getSampleCount(self): number
  function getSampleRate(self): number
  function isCompressed(self): boolean
  function isStream(self): boolean
  function setFrames(self, source: {} | Blob | Sound, count: number?, dstOffset: number?, srcOffset: number?): number
end

type DataModule = {
  newBlob:
    & ((size: number, name: string?) -> Blob)
    & ((contents: string, name: string?) -> Blob)
    & ((source: Blob, name: string?) -> Blob),
  newImage:
    & ((file: string | Blob) -> Image)
    & ((width: number, height: number, format: TextureFormat?, data: Blob?) -> Image)
    & ((source: Image) -> Image),
  newModelData: (file: string | Blob) -> ModelData,
  newRasterizer:
    & ((file: string | Blob, size: number?) -> Rasterizer)
    & ((size: number?) -> Rasterizer),
  newSound:
    & ((frames: number, format: SampleFormat?, channels: ChannelLayout?, sampleRate: number?, contents: Blob | string | nil | nil) -> Sound)
    & ((file: string | Blob, decode: boolean?) -> Sound),
}

type DisplayType =
  | "headset"
  | "window"

type KeyCode =
  | "a"
  | "b"
  | "c"
  | "d"
  | "e"
  | "f"
  | "g"
  | "h"
  | "i"
  | "j"
  | "k"
  | "l"
  | "m"
  | "n"
  | "o"
  | "p"
  | "q"
  | "r"
  | "s"
  | "t"
  | "u"
  | "v"
  | "w"
  | "x"
  | "y"
  | "z"
  | "0"
  | "1"
  | "2"
  | "3"
  | "4"
  | "5"
  | "6"
  | "7"
  | "8"
  | "9"
  | "space"
  | "return"
  | "tab"
  | "escape"
  | "backspace"
  | "up"
  | "down"
  | "left"
  | "right"
  | "home"
  | "end"
  | "pageup"
  | "pagedown"
  | "insert"
  | "delete"
  | "f1"
  | "f2"
  | "f3"
  | "f4"
  | "f5"
  | "f6"
  | "f7"
  | "f8"
  | "f9"
  | "f10"
  | "f11"
  | "f12"
  | "`"
  | "-"
  | "="
  | "["
  | "]"
  | "\\"
  | ";"
  | "'"
  | ","
  | "."
  | "/"
  | "kp0"
  | "kp1"
  | "kp2"
  | "kp3"
  | "kp4"
  | "kp5"
  | "kp6"
  | "kp7"
  | "kp8"
  | "kp9"
  | "kp."
  | "kp/"
  | "kp*"
  | "kp-"
  | "kp+"
  | "kpenter"
  | "kp="
  | "lctrl"
  | "lshift"
  | "lalt"
  | "lgui"
  | "rctrl"
  | "rshift"
  | "ralt"
  | "rgui"
  | "capslock"
  | "scrolllock"
  | "numlock"

type EventModule = {
  clear: () -> (),
  poll: () -> (() -> ()),
  push: (name: string, ...any) -> (),
  quit: (code: number?) -> (),
  restart: () -> (),
}

type FileAction =
  | "create"
  | "delete"
  | "modify"
  | "rename"

type OpenMode =
  | "r"
  | "w"
  | "a"

declare class File extends Object
  function getMode(self): OpenMode
  function getPath(self): string
  function getSize(self): (number, string)
  function isEOF(self): boolean
  function read(self, bytes: number): (string, number)
  function seek(self, offset: number)
  function tell(self): number
  function write(self, string: string, size: number?): (boolean, string)
  function write(self, blob: Blob, size: number?): (boolean, string)
end

type FilesystemModule = {
  append: (filename: string, content: string | Blob) -> (boolean, string | nil),
  createDirectory: (path: string) -> (boolean, string | nil),
  getAppdataDirectory: () -> string | nil,
  getDirectoryItems: (path: string) -> {string},
  getExecutablePath: () -> string | nil,
  getIdentity: () -> string | nil,
  getLastModified: (path: string) -> (number | nil, string | nil),
  getRealDirectory: (path: string) -> string | nil,
  getRequirePath: () -> string,
  getSaveDirectory: () -> string,
  getSize: (file: string) -> (number | nil, string | nil),
  getSource: () -> string | nil,
  getUserDirectory: () -> string | nil,
  getWorkingDirectory: () -> string | nil,
  isDirectory: (path: string) -> boolean,
  isFile: (path: string) -> boolean,
  isFused: () -> boolean,
  load: (filename: string, mode: string?) -> (() -> ()),
  mount: (path: string, mountpoint: string?, append: boolean?, root: string?) -> (boolean, string | nil),
  newBlob: (filename: string) -> Blob,
  newFile: (path: string, mode: OpenMode) -> (File, string),
  read: (filename: string) -> (string | nil, string | nil),
  remove: (path: string) -> (boolean, string | nil),
  setIdentity: (identity: string) -> (),
  setRequirePath: (path: string?) -> (),
  unmount: (path: string) -> boolean,
  unwatch: () -> (),
  watch: () -> (),
  write: (filename: string, content: string | Blob) -> (boolean, string),
}

type BlendAlphaMode =
  | "alphamultiply"
  | "premultiplied"

type BlendMode =
  | "alpha"
  | "add"
  | "subtract"
  | "multiply"
  | "lighten"
  | "darken"
  | "screen"
  | "none"

type CompareMode =
  | "none"
  | "equal"
  | "notequal"
  | "less"
  | "lequal"
  | "greater"
  | "gequal"

type CullMode =
  | "none"
  | "back"
  | "front"

type DataLayout =
  | "packed"
  | "std140"
  | "std430"

type DataType =
  | "i8x4"
  | "u8x4"
  | "sn8x4"
  | "un8x4"
  | "sn10x3"
  | "un10x3"
  | "i16"
  | "i16x2"
  | "i16x4"
  | "u16"
  | "u16x2"
  | "u16x4"
  | "sn16x2"
  | "sn16x4"
  | "un16x2"
  | "un16x4"
  | "i32"
  | "i32x2"
  | "i32x3"
  | "i32x4"
  | "u32"
  | "u32x2"
  | "u32x3"
  | "u32x4"
  | "f16x2"
  | "f16x4"
  | "f32"
  | "f32x2"
  | "f32x3"
  | "f32x4"
  | "mat2"
  | "mat3"
  | "mat4"
  | "index16"
  | "index32"

type DefaultShader =
  | "unlit"
  | "normal"
  | "font"
  | "cubemap"
  | "equirect"
  | "fill"

type DrawMode =
  | "points"
  | "lines"
  | "triangles"

type DrawStyle =
  | "fill"
  | "line"

type FilterMode =
  | "nearest"
  | "linear"
  | "cubic"

type HorizontalAlign =
  | "left"
  | "center"
  | "right"

type MeshStorage =
  | "cpu"
  | "gpu"

type OriginType =
  | "root"
  | "parent"

type ShaderStage =
  | "vertex"
  | "fragment"
  | "compute"

type ShaderType =
  | "graphics"
  | "compute"

type StackType =
  | "transform"
  | "state"

type StencilAction =
  | "keep"
  | "zero"
  | "replace"
  | "increment"
  | "decrement"
  | "incrementwrap"
  | "decrementwrap"
  | "invert"

type TextureFeature =
  | "sample"
  | "render"
  | "storage"
  | "blit"
  | "cubic"

type TextureType =
  | "2d"
  | "3d"
  | "cube"
  | "array"

type TextureUsage =
  | "sample"
  | "render"
  | "storage"
  | "transfer"

type VerticalAlign =
  | "top"
  | "middle"
  | "bottom"

type Winding =
  | "clockwise"
  | "counterclockwise"

type WrapMode =
  | "clamp"
  | "repeat"
  | "mirror"
  | "border"

declare class Buffer extends Object
  function clear(self, offset: number?, extent: number?, value: number?)
  function getData(self, index: number?, count: number?): {}
  function getFormat(self): {}
  function getLength(self): number
  function getSize(self): number
  function getStride(self): number
  function mapData(self, offset: number?, extent: number?): lightuserdata
  function newReadback(self, offset: number?, extent: number?): Readback
  function setData(self, table: {}, destinationIndex: number?, sourceIndex: number?, count: number?)
  function setData(self, ...: number)
  function setData(self, vector: any)
  function setData(self, blob: Blob, destinationOffset: number?, sourceOffset: number?, size: number?)
  function setData(self, buffer: Buffer, destinationOffset: number?, sourceOffset: number?, size: number?)
end

declare class Font extends Object
  function getAscent(self): number
  function getDescent(self): number
  function getHeight(self): number
  function getKerning(self, first: string | number, second: string | number): number
  function getLineSpacing(self): number
  function getLines(self, string: string, wrap: number): {string}
  function getLines(self, strings: {}, wrap: number): {string}
  function getPixelDensity(self): number
  function getRasterizer(self): Rasterizer
  function getVertices(self, string: string, wrap: number?, halign: HorizontalAlign, valign: VerticalAlign): ({number}, Material)
  function getVertices(self, strings: {}, wrap: number?, halign: HorizontalAlign, valign: VerticalAlign): ({number}, Material)
  function getWidth(self, string: string): number
  function getWidth(self, strings: {}): number
  function setLineSpacing(self, spacing: number)
  function setPixelDensity(self, density: number)
  function setPixelDensity(self)
end

declare class Material extends Object
  function getProperties(self): {}
end

declare class Mesh extends Object
  function computeBoundingBox(self): boolean
  function getBoundingBox(self): (number, number, number, number, number, number)
  function getDrawMode(self): DrawMode
  function getDrawRange(self): (number, number, number)
  function getDrawRange(self)
  function getIndexBuffer(self): Buffer
  function getIndices(self): {number}
  function getMaterial(self): Material
  function getVertexBuffer(self): Buffer
  function getVertexCount(self): number
  function getVertexFormat(self): {}
  function getVertexStride(self): number
  function getVertices(self, index: number?, count: number?): {{number}}
  function setBoundingBox(self, minx: number, maxx: number, miny: number, maxy: number, minz: number, maxz: number)
  function setBoundingBox(self)
  function setDrawMode(self, mode: DrawMode)
  function setDrawRange(self, start: number, count: number, offset: number)
  function setDrawRange(self)
  function setIndexBuffer(self, buffer: Buffer)
  function setIndices(self, t: {number})
  function setIndices(self, blob: Blob, type: DataType)
  function setIndices(self)
  function setMaterial(self, material: Material)
  function setMaterial(self, texture: Texture)
  function setVertices(self, vertices: {{number}}, index: number?, count: number?)
  function setVertices(self, blob: Blob, index: number?, count: number?)
end

declare class Model extends Object
  function animate(self, animation: string, time: number, blend: number?)
  function clone(self): Model
  function getAnimationCount(self): number
  function getAnimationDuration(self, animation: string | number): number
  function getAnimationName(self, index: number): string | nil
  function getBlendShapeCount(self): number
  function getBlendShapeName(self, index: number): string
  function getBlendShapeWeight(self, blendshape: string | number): number
  function getBoundingBox(self): (number, number, number, number, number, number)
  function getBoundingSphere(self): (number, number, number, number)
  function getCenter(self): (number, number, number)
  function getData(self): ModelData
  function getDepth(self): number
  function getDimensions(self): (number, number, number)
  function getHeight(self): number
  function getIndexBuffer(self): Buffer
  function getMaterial(self, which: string | number): Material
  function getMaterialCount(self): number
  function getMaterialName(self, index: number): string
  function getMesh(self, index: number): Mesh
  function getMeshCount(self): number
  function getMetadata(self): string
  function getNodeChildren(self, node: string | number): {number}
  function getNodeCount(self): number
  function getNodeName(self, index: number): string
  function getNodeOrientation(self, node: string | number, origin: OriginType?): (number, number, number, number)
  function getNodeParent(self, node: number): number
  function getNodePose(self, node: string | number, origin: OriginType?): (number, number, number, number, number, number, number)
  function getNodePosition(self, node: string | number, space: OriginType?): (number, number, number)
  function getNodeScale(self, node: string | number, origin: OriginType?): (number, number, number)
  function getNodeTransform(self, node: string | number, origin: OriginType?): (number, number, number, number, number, number, number, number, number, number)
  function getRootNode(self): number
  function getTexture(self, index: number): Texture
  function getTextureCount(self): number
  function getTriangleCount(self): number
  function getTriangles(self): ({number}, {number})
  function getVertexBuffer(self): Buffer
  function getVertexCount(self): number
  function getWidth(self): number
  function hasJoints(self): boolean
  function resetBlendShapes(self)
  function resetNodeTransforms(self)
  function setBlendShapeWeight(self, blendshape: string | number, weight: number)
  function setNodeOrientation(self, node: string | number, angle: number, ax: number, ay: number, az: number, blend: number?)
  function setNodeOrientation(self, node: string | number, orientation: Quat, blend: number?)
  function setNodePose(self, node: string | number, x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number, blend: number?)
  function setNodePose(self, node: string | number, position: Vec3, orientation: Quat, blend: number?)
  function setNodePosition(self, node: string | number, x: number, y: number, z: number, blend: number?)
  function setNodePosition(self, node: string | number, position: Vec3, blend: number?)
  function setNodeScale(self, node: string | number, sx: number, sy: number, sz: number, blend: number?)
  function setNodeScale(self, node: string | number, scale: Vec3, blend: number?)
  function setNodeTransform(self, node: string | number, x: number, y: number, z: number, sx: number, sy: number, sz: number, angle: number, ax: number, ay: number, az: number, blend: number?)
  function setNodeTransform(self, node: string | number, position: Vec3, scale: Vec3, orientation: Quat, blend: number?)
  function setNodeTransform(self, node: string | number, transform: Mat4, blend: number?)
end

declare class Pass extends Object
  function barrier(self)
  function beginTally(self): number
  function box(self, x: number?, y: number?, z: number?, width: number?, height: number?, depth: number?, angle: number?, ax: number?, ay: number?, az: number?, style: DrawStyle?)
  function box(self, position: Vec3, size: Vec3, orientation: Quat, style: DrawStyle?)
  function box(self, transform: Mat4, style: DrawStyle?)
  function capsule(self, x: number?, y: number?, z: number?, radius: number?, length: number?, angle: number?, ax: number?, ay: number?, az: number?, segments: number?)
  function capsule(self, position: Vec3, radius: number?, length: number?, orientation: Quat, segments: number?)
  function capsule(self, transform: Mat4, segments: number?)
  function capsule(self, p1: Vec3, p2: Vec3, radius: number?, segments: number?)
  function circle(self, x: number?, y: number?, z: number?, radius: number?, angle: number?, ax: number?, ay: number?, az: number?, style: DrawStyle?, angle1: number?, angle2: number?, segments: number?)
  function circle(self, position: Vec3, radius: number?, orientation: Quat, style: DrawStyle?, angle1: number?, angle2: number?, segments: number?)
  function circle(self, transform: Mat4, style: DrawStyle?, angle1: number?, angle2: number?, segments: number?)
  function compute(self, x: number?, y: number?, z: number?)
  function compute(self, buffer: Buffer, offset: number?)
  function cone(self, x: number?, y: number?, z: number?, radius: number?, length: number?, angle: number?, ax: number?, ay: number?, az: number?, segments: number?)
  function cone(self, position: Vec3, radius: number?, length: number?, orientation: Quat, segments: number?)
  function cone(self, transform: Mat4, segments: number?)
  function cone(self, p1: Vec3, p2: Vec3, radius: number?, segments: number?)
  function cube(self, x: number?, y: number?, z: number?, size: number?, angle: number?, ax: number?, ay: number?, az: number?, style: DrawStyle?)
  function cube(self, position: Vec3, size: number?, orientation: Quat, style: DrawStyle?)
  function cube(self, transform: Mat4, style: DrawStyle?)
  function cylinder(self, x: number?, y: number?, z: number?, radius: number?, length: number?, angle: number?, ax: number?, ay: number?, az: number?, capped: boolean?, angle1: number?, angle2: number?, segments: number?)
  function cylinder(self, position: Vec3, radius: number?, length: number?, orientation: Quat, capped: boolean?, angle1: number?, angle2: number?, segments: number?)
  function cylinder(self, transform: Mat4, capped: boolean?, angle1: number?, angle2: number?, segments: number?)
  function cylinder(self, p1: Vec3, p2: Vec3, radius: number?, capped: boolean?, angle1: number?, angle2: number?, segments: number?)
  function draw(self, object: Model | Mesh | Texture, x: number?, y: number?, z: number?, scale: number?, angle: number?, ax: number?, ay: number?, az: number?, instances: number?)
  function draw(self, object: Model | Mesh | Texture, position: Vec3, scale3: Vec3, orientation: Quat, instances: number?)
  function draw(self, object: Model | Mesh | Texture, transform: Mat4, instances: number?)
  function fill(self, texture: Texture)
  function fill(self)
  function finishTally(self): number
  function getCanvas(self): {}
  function getCanvas(self)
  function getClear(self): {}
  function getDimensions(self): (number, number)
  function getHeight(self): number
  function getLabel(self): string
  function getProjection(self, view: number): (number, number, number, number)
  function getProjection(self, view: number, matrix: Mat4): Mat4
  function getStats(self): {}
  function getTallyBuffer(self): (Buffer, number)
  function getViewCount(self): number
  function getViewPose(self, view: number): (number, number, number, number, number, number, number)
  function getViewPose(self, view: number, matrix: Mat4, invert: boolean): Mat4
  function getWidth(self): number
  function line(self, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number, ...: number)
  function line(self, t: {number | Vec3})
  function line(self, v1: Vec3, v2: Vec3, ...: Vec3)
  function mesh(self, vertices: Buffer?, x: number?, y: number?, z: number?, scale: number?, angle: number?, ax: number?, ay: number?, az: number?, start: number?, count: number?, instances: number?)
  function mesh(self, vertices: Buffer?, position: Vec3, scales: Vec3, orientation: Quat, start: number?, count: number?, instances: number?)
  function mesh(self, vertices: Buffer?, transform: Mat4, start: number?, count: number?, instances: number?)
  function mesh(self, vertices: Buffer?, indices: Buffer, x: number?, y: number?, z: number?, scale: number?, angle: number?, ax: number?, ay: number?, az: number?, start: number?, count: number?, instances: number?, base: number?)
  function mesh(self, vertices: Buffer?, indices: Buffer, position: Vec3, scales: Vec3, orientation: Quat, start: number?, count: number?, instances: number?, base: number?)
  function mesh(self, vertices: Buffer?, indices: Buffer, transform: Mat4, start: number?, count: number?, instances: number?, base: number?)
  function mesh(self, vertices: Buffer?, indices: Buffer, draws: Buffer, drawcount: number?, offset: number?, stride: number?)
  function origin(self)
  function plane(self, x: number?, y: number?, z: number?, width: number?, height: number?, angle: number?, ax: number?, ay: number?, az: number?, style: DrawStyle?, columns: number?, rows: number?)
  function plane(self, position: Vec3, size: Vec2, orientation: Quat, style: DrawStyle?, columns: number?, rows: number?)
  function plane(self, transform: Mat4, style: DrawStyle?, columns: number?, rows: number?)
  function points(self, x: number, y: number, z: number, ...: any)
  function points(self, t: {number | Vec3})
  function points(self, v: Vec3, ...: any)
  function polygon(self, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number, ...: any)
  function polygon(self, t: {number | Vec3})
  function polygon(self, v1: Vec3, v2: Vec3, ...: any)
  function pop(self, stack: StackType?)
  function push(self, stack: StackType?)
  function reset(self)
  function rotate(self, angle: number, ax: number, ay: number, az: number)
  function rotate(self, rotation: Quat)
  function roundrect(self, x: number?, y: number?, z: number?, width: number?, height: number?, thickness: number?, angle: number?, ax: number?, ay: number?, az: number?, radius: number?, segments: number?)
  function roundrect(self, position: Vec3, size: Vec3, orientation: Quat, radius: number?, segments: number?)
  function roundrect(self, transform: Mat4, radius: number?, segments: number?)
  function scale(self, sx: number, sy: number?, sz: number?)
  function scale(self, scale: Vec3)
  function send(self, name: string, buffer: Buffer, offset: number?, extent: number?)
  function send(self, name: string, texture: Texture)
  function send(self, name: string, sampler: Sampler)
  function send(self, name: string, data: any)
  function setAlphaToCoverage(self, enable: boolean)
  function setBlendMode(self, blend: BlendMode, alphaBlend: BlendAlphaMode)
  function setBlendMode(self)
  function setBlendMode(self, index: number, blend: BlendMode, alphaBlend: BlendAlphaMode)
  function setBlendMode(self, index: number)
  function setCanvas(self, ...: Texture)
  function setCanvas(self, canvas: {})
  function setCanvas(self)
  function setClear(self, hex: number)
  function setClear(self, r: number, g: number, b: number, a: number?)
  function setClear(self, clear: boolean)
  function setClear(self, t: {})
  function setColor(self, r: number, g: number, b: number, a: number?)
  function setColor(self, t: {number})
  function setColor(self, hex: number, a: number?)
  function setColorWrite(self, enable: boolean)
  function setColorWrite(self, r: boolean, g: boolean, b: boolean, a: boolean)
  function setColorWrite(self, index: number, enable: boolean)
  function setColorWrite(self, index: number, r: boolean, g: boolean, b: boolean, a: boolean)
  function setCullMode(self, mode: CullMode)
  function setCullMode(self)
  function setDepthClamp(self, enable: boolean)
  function setDepthOffset(self, offset: number?, sloped: number?)
  function setDepthTest(self, test: CompareMode)
  function setDepthTest(self)
  function setDepthWrite(self, write: boolean)
  function setFaceCull(self, mode: CullMode)
  function setFaceCull(self)
  function setFont(self, font: Font)
  function setMaterial(self, material: Texture | Material)
  function setMaterial(self)
  function setMeshMode(self, mode: DrawMode)
  function setProjection(self, view: number, left: number, right: number, up: number, down: number, near: number?, far: number?)
  function setProjection(self, view: number, matrix: Mat4)
  function setSampler(self, sampler: Sampler | FilterMode | nil)
  function setScissor(self, x: number, y: number, w: number, h: number)
  function setScissor(self)
  function setShader(self, shader: Shader | DefaultShader)
  function setShader(self)
  function setStencilTest(self, test: CompareMode, value: number, mask: number?)
  function setStencilTest(self)
  function setStencilWrite(self, action: StencilAction | {StencilAction}, value: number?, mask: number?)
  function setStencilWrite(self)
  function setTallyBuffer(self, buffer: Buffer, offset: number)
  function setTallyBuffer(self)
  function setViewCull(self, enable: boolean)
  function setViewPose(self, view: number, x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number)
  function setViewPose(self, view: number, position: Vec3, orientation: Quat)
  function setViewPose(self, view: number, matrix: Mat4, inverted: boolean)
  function setViewport(self, x: number, y: number, w: number, h: number, dmin: number?, dmax: number?)
  function setViewport(self)
  function setWinding(self, winding: Winding)
  function setWireframe(self, enable: boolean)
  function skybox(self, skybox: Texture)
  function skybox(self)
  function sphere(self, x: number?, y: number?, z: number?, radius: number?, angle: number?, ax: number?, ay: number?, az: number?, longitudes: number?, latitudes: number?)
  function sphere(self, position: Vec3, radius: number?, orientation: Quat, longitudes: number?, latitudes: number?)
  function sphere(self, transform: Mat4, longitudes: number?, latitudes: number?)
  function text(self, text: string, x: number?, y: number?, z: number?, scale: number?, angle: number?, ax: number?, ay: number?, az: number?, wrap: number?, halign: HorizontalAlign?, valign: VerticalAlign?)
  function text(self, text: string, position: Vec3, scale: number?, orientation: Quat, wrap: number?, halign: HorizontalAlign?, valign: VerticalAlign?)
  function text(self, text: string, transform: Mat4, wrap: number?, halign: HorizontalAlign?, valign: VerticalAlign?)
  function text(self, colortext: {}, x: number?, y: number?, z: number?, scale: number?, angle: number?, ax: number?, ay: number?, az: number?, wrap: number?, halign: HorizontalAlign?, valign: VerticalAlign?)
  function text(self, colortext: {}, position: Vec3, scale: number?, orientation: Quat, wrap: number?, halign: HorizontalAlign?, valign: VerticalAlign?)
  function text(self, colortext: {}, transform: Mat4, wrap: number?, halign: HorizontalAlign?, valign: VerticalAlign?)
  function torus(self, x: number?, y: number?, z: number?, radius: number?, thickness: number?, angle: number?, ax: number?, ay: number?, az: number?, tsegments: number?, psegments: number?)
  function torus(self, position: Vec3, scale: Vec3, orientation: Quat, tsegments: number?, psegments: number?)
  function torus(self, transform: Mat4, tsegments: number?, psegments: number?)
  function transform(self, x: number, y: number, z: number, sx: number, sy: number, sz: number, angle: number, ax: number, ay: number, az: number)
  function transform(self, translation: Vec3, scale: Vec3, rotation: Quat)
  function transform(self, transform: Mat4)
  function translate(self, x: number, y: number, z: number)
  function translate(self, translation: Vec3)
end

declare class Readback extends Object
  function getBlob(self): Blob
  function getData(self): {}
  function getImage(self): Image
  function isComplete(self): boolean
  function wait(self): boolean
end

declare class Sampler extends Object
  function getAnisotropy(self): number
  function getCompareMode(self): CompareMode
  function getFilter(self): (FilterMode, FilterMode, FilterMode)
  function getMipmapRange(self): (number, number)
  function getWrap(self): (WrapMode, WrapMode, WrapMode)
end

declare class Shader extends Object
  function clone(self, source: Shader, flags: {}): Shader
  function getBufferFormat(self, name: string): ({}, number)
  function getLabel(self): string
  function getType(self): ShaderType
  function getWorkgroupSize(self): (number, number, number)
  function hasAttribute(self, name: string): boolean
  function hasAttribute(self, location: number): boolean
  function hasStage(self, stage: ShaderStage): boolean
  function hasVariable(self, name: string): boolean
end

declare class Texture extends Object
  function clear(self)
  function clear(self, hex: number, layer: number?, layerCount: number?, mipmap: number?, mipmapCount: number?)
  function clear(self, r: number, g: number, b: number, a: number, layer: number?, layerCount: number?, mipmap: number?, mipmapCount: number?)
  function clear(self, t: {number}, layer: number?, layerCount: number?, mipmap: number?, mipmapCount: number?)
  function clear(self, v3: Vec3, layer: number?, layerCount: number?, mipmap: number?, mipmapCount: number?)
  function clear(self, v4: Vec4, layer: number?, layerCount: number?, mipmap: number?, mipmapCount: number?)
  function generateMipmaps(self, base: number?, count: number?)
  function getDimensions(self): (number, number, number)
  function getFormat(self): (TextureFormat, boolean)
  function getHeight(self): number
  function getLabel(self): string
  function getLayerCount(self): number
  function getMipmapCount(self): number
  function getPixels(self, x: number?, y: number?, layer: number?, mipmap: number?, width: number?, height: number?): Image
  function getSampleCount(self): number
  function getSampler(self): Sampler
  function getType(self): TextureType
  function getWidth(self): number
  function hasUsage(self, ...: TextureUsage): boolean
  function newReadback(self, x: number?, y: number?, layer: number?, mipmap: number?, width: number?, height: number?): Readback
  function setPixels(self, source: Texture | Image, dstx: number?, dsty: number?, dstlayer: number?, dstmipmap: number?, srcx: number?, srcy: number?, srclayer: number?, srcmipmap: number?, width: number?, height: number?, layers: number?)
  function setSampler(self, mode: FilterMode)
  function setSampler(self, sampler: Sampler)
  function setSampler(self)
end

type GraphicsModule = {
  compileShader: (stage: ShaderStage, source: string | Blob) -> Blob,
  getBackgroundColor: () -> (number, number, number, number),
  getDefaultFont: () -> Font,
  getDevice: () -> {},
  getFeatures: () -> {},
  getLimits: () -> {},
  getWindowPass: () -> Pass | nil,
  isFormatSupported: (format: TextureFormat, ...TextureFeature) -> (boolean, boolean),
  isHDR: () -> boolean,
  isTimingEnabled: () -> boolean,
  newBuffer:
    & ((size: number) -> Buffer)
    & ((blob: Blob) -> Buffer)
    & ((format: {} | DataType, length: number?) -> Buffer)
    & ((format: {} | DataType, data: {} | Blob) -> Buffer),
  newFont:
    & ((file: string | Blob, size: number?, spread: number?) -> Font)
    & ((size: number?, spread: number?) -> Font)
    & ((rasterizer: Rasterizer, spread: number?) -> Font),
  newMaterial: (properties: {}) -> Material,
  newMesh:
    & ((count: number, storage: MeshStorage?) -> Mesh)
    & ((vertices: {}, storage: MeshStorage?) -> Mesh)
    & ((blob: Blob, storage: MeshStorage?) -> Mesh)
    & ((format: {}, count: number, storage: MeshStorage?) -> Mesh)
    & ((format: {}, vertices: {}, storage: MeshStorage?) -> Mesh)
    & ((format: {}, blob: Blob, storage: MeshStorage?) -> Mesh)
    & ((buffer: Buffer) -> Mesh),
  newModel:
    & ((file: string | Blob, options: {}?) -> Model)
    & ((modelData: ModelData, options: {}?) -> Model),
  newPass:
    & ((...Texture) -> Pass)
    & ((canvas: {}) -> Pass)
    & (() -> Pass),
  newSampler: (parameters: {}) -> Sampler,
  newShader:
    & ((vertex: string | DefaultShader | Blob, fragment: string | DefaultShader | Blob, options: {}?) -> Shader)
    & ((compute: string | Blob, options: {}?) -> Shader)
    & ((defaultshader: DefaultShader, options: {}?) -> Shader),
  newTexture:
    & ((file: string | Blob, options: {}?) -> Texture)
    & ((width: number, height: number, options: {}?) -> Texture)
    & ((width: number, height: number, layers: number, options: {}?) -> Texture)
    & ((image: string, options: {}?) -> Texture)
    & ((images: {string | Blob | Image}, options: {}?) -> Texture),
  newTextureView: (parent: Texture, options: {}?) -> Texture,
  present: () -> (),
  setBackgroundColor:
    & ((r: number, g: number, b: number, a: number?) -> ())
    & ((hex: number, a: number?) -> ())
    & ((table: {number}) -> ()),
  setTimingEnabled: (enable: boolean) -> (),
  submit:
    & ((...Pass | boolean | nil) -> boolean)
    & ((t: {Pass | boolean}) -> boolean),
  wait: () -> (),
}

type Device =
  | "head"
  | "floor"
  | "left"
  | "right"
  | "hand/left"
  | "hand/right"
  | "hand/left/grip"
  | "hand/right/grip"
  | "hand/left/point"
  | "hand/right/point"
  | "hand/left/pinch"
  | "hand/right/pinch"
  | "hand/left/poke"
  | "hand/right/poke"
  | "elbow/left"
  | "elbow/right"
  | "shoulder/left"
  | "shoulder/right"
  | "chest"
  | "waist"
  | "knee/left"
  | "knee/right"
  | "foot/left"
  | "foot/right"
  | "camera"
  | "keyboard"
  | "stylus"
  | "eye/left"
  | "eye/right"
  | "eye/gaze"

type DeviceAxis =
  | "trigger"
  | "thumbstick"
  | "thumbrest"
  | "touchpad"
  | "grip"
  | "nib"

type DeviceButton =
  | "trigger"
  | "thumbstick"
  | "thumbrest"
  | "touchpad"
  | "grip"
  | "menu"
  | "a"
  | "b"
  | "x"
  | "y"
  | "nib"

type FoveationLevel =
  | "low"
  | "medium"
  | "high"

type HeadsetDriver =
  | "simulator"
  | "openxr"

type HeadsetOrigin =
  | "head"
  | "floor"

type PassthroughMode =
  | "opaque"
  | "blend"
  | "add"

declare class Layer extends Object
  function getColor(self): (number, number, number, number)
  function getCurve(self): number
  function getDimensions(self): (number, number)
  function getOrientation(self): (number, number, number, number)
  function getPass(self): Pass
  function getPose(self): (number, number, number, number, number, number, number)
  function getPosition(self): (number, number, number)
  function getTexture(self): Texture
  function getViewport(self): (number, number, number, number)
  function setColor(self, r: number, g: number, b: number, a: number?)
  function setColor(self, t: {number})
  function setColor(self, hex: number, a: number?)
  function setCurve(self, curve: number?)
  function setDimensions(self, width: number, height: number)
  function setOrientation(self, angle: number, ax: number, ay: number, az: number)
  function setOrientation(self, orientation: Quat)
  function setPose(self, x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number)
  function setPose(self, position: Vec3, orientation: Quat)
  function setPosition(self, x: number, y: number, z: number)
  function setViewport(self, x: number, y: number, w: number, h: number)
end

type HeadsetModule = {
  animate:
    & ((model: Model) -> boolean)
    & ((device: Device?, model: Model) -> boolean),
  getAngularVelocity: (device: Device?) -> (number, number, number),
  getAxis: (device: Device, axis: DeviceAxis) -> number | nil,
  getBoundsDepth: () -> number,
  getBoundsDimensions: () -> (number, number),
  getBoundsGeometry: (t: {}?) -> {},
  getBoundsWidth: () -> number,
  getClipDistance: () -> (number, number),
  getDeltaTime: () -> number,
  getDirection: (device: Device?) -> (number, number, number),
  getDisplayDimensions: () -> (number, number),
  getDisplayHeight: () -> number,
  getDisplayWidth: () -> number,
  getDriver: () -> (HeadsetDriver, string),
  getFeatures: () -> {},
  getFoveation: () -> (FoveationLevel, boolean),
  getHandles: () -> (lightuserdata, lightuserdata),
  getHands: () -> {Device},
  getLayers: () -> {Layer},
  getName: () -> string,
  getOrientation: (device: Device?) -> (number, number, number, number),
  getPass: () -> Pass | nil,
  getPassthrough: () -> PassthroughMode,
  getPassthroughModes: () -> {},
  getPose: (device: Device?) -> (number, number, number, number, number, number, number),
  getPosition: (device: Device?) -> (number, number, number),
  getRefreshRate: () -> number | nil,
  getRefreshRates: () -> {} | nil,
  getSkeleton:
    & ((device: Device) -> {{number}} | nil)
    & ((device: Device, t: {}) -> {{number}} | nil),
  getTexture: () -> Texture | nil,
  getTime: () -> number,
  getVelocity: (device: Device?) -> (number, number, number),
  getViewAngles: (view: number) -> (number | nil, number | nil, number | nil, number | nil),
  getViewCount: () -> number,
  getViewPose: (view: number) -> (number | nil, number | nil, number | nil, number | nil, number | nil, number | nil, number | nil),
  isActive: () -> boolean,
  isDown: (device: Device, button: DeviceButton) -> boolean | nil,
  isFocused: () -> boolean,
  isMounted: () -> boolean,
  isSeated: () -> boolean,
  isTouched: (device: Device, button: DeviceButton) -> boolean | nil,
  isTracked: (device: Device?) -> boolean,
  isVisible: () -> boolean,
  newLayer: (width: number, height: number) -> Layer,
  newModel:
    & ((key: lightuserdata) -> Model)
    & ((device: Device?) -> Model),
  setBackground:
    & ((background: Image | {Image} | Texture) -> ())
    & (() -> ()),
  setClipDistance: (near: number, far: number) -> (),
  setFoveation:
    & ((level: FoveationLevel, dynamic: boolean?) -> boolean)
    & (() -> boolean),
  setLayers:
    & ((...Layer) -> ())
    & ((t: {}) -> ()),
  setPassthrough:
    & ((mode: PassthroughMode) -> boolean)
    & ((transparent: boolean) -> boolean)
    & (() -> boolean),
  setRefreshRate: (rate: number) -> boolean,
  start: () -> (),
  stop: () -> (),
  stopVibration: (device: Device?) -> (),
  submit: () -> (),
  update: () -> (),
  vibrate: (device: Device?, strength: number?, duration: number?, frequency: number?) -> boolean,
  wasPressed: (device: Device, button: DeviceButton) -> boolean,
  wasReleased: (device: Device, button: DeviceButton) -> boolean,
}

declare class Curve extends Object
  function addPoint(self, x: number, y: number, z: number, index: number?)
  function evaluate(self, t: number): (number, number, number)
  function getPoint(self, index: number): (number, number, number)
  function getPointCount(self): number
  function getTangent(self, t: number): (number, number, number)
  function removePoint(self, index: number)
  function render(self, n: number?, t1: number?, t2: number?): {number}
  function setPoint(self, index: number, x: number, y: number, z: number)
  function slice(self, t1: number, t2: number): Curve
end

declare class RandomGenerator extends Object
  function getSeed(self): (number, number)
  function getState(self): string
  function random(self): number
  function random(self, high: number): number
  function random(self, low: number, high: number): number
  function randomNormal(self, sigma: number?, mu: number?): number
  function setSeed(self, seed: number)
  function setSeed(self, low: number, high: number)
  function setState(self, state: string)
end

type MathModule = {
  drain: () -> (),
  gammaToLinear:
    & ((gr: number, gg: number, gb: number) -> (number, number, number))
    & ((color: {number}) -> (number, number, number))
    & ((x: number) -> number),
  getRandomSeed: () -> number,
  linearToGamma:
    & ((lr: number, lg: number, lb: number) -> (number, number, number))
    & ((color: {number}) -> (number, number, number))
    & ((x: number) -> number),
  mat4:
    & (() -> Mat4)
    & ((n: Mat4) -> Mat4)
    & ((position: Vec3?, scale: Vec3?, rotation: Quat?) -> Mat4)
    & ((position: Vec3?, rotation: Quat?) -> Mat4)
    & ((...number) -> Mat4)
    & ((d: number) -> Mat4),
  newCurve:
    & ((x: number, y: number, z: number, ...any) -> Curve)
    & ((v: Vec3, ...any) -> Curve)
    & ((points: {}) -> Curve)
    & ((n: number) -> Curve),
  newMat4:
    & (() -> Mat4)
    & ((n: Mat4) -> Mat4)
    & ((position: Vec3?, scale: Vec3?, rotation: Quat?) -> Mat4)
    & ((position: Vec3?, rotation: Quat?) -> Mat4)
    & ((...number) -> Mat4)
    & ((d: number) -> Mat4),
  newQuat:
    & ((angle: number?, ax: number?, ay: number?, az: number?, raw: boolean?) -> Quat)
    & ((r: Quat) -> Quat)
    & ((v: Vec3) -> Quat)
    & ((v: Vec3, u: Vec3) -> Quat)
    & ((m: Mat4) -> Quat)
    & (() -> Quat),
  newRandomGenerator:
    & (() -> RandomGenerator)
    & ((seed: number) -> RandomGenerator)
    & ((low: number, high: number) -> RandomGenerator),
  newVec2:
    & ((x: number?, y: number?) -> Vec2)
    & ((u: Vec2) -> Vec2),
  newVec3:
    & ((x: number?, y: number?, z: number?) -> Vec3)
    & ((u: Vec3) -> Vec3)
    & ((m: Mat4) -> Vec3)
    & ((q: Quat) -> Vec3),
  newVec4:
    & ((x: number?, y: number?, z: number?, w: number?) -> Vec4)
    & ((u: Vec4) -> Vec4),
  noise:
    & ((x: number) -> number)
    & ((x: number, y: number) -> number)
    & ((x: number, y: number, z: number) -> number)
    & ((x: number, y: number, z: number, w: number) -> number),
  quat:
    & ((angle: number?, ax: number?, ay: number?, az: number?, raw: boolean?) -> Quat)
    & ((r: Quat) -> Quat)
    & ((v: Vec3) -> Quat)
    & ((v: Vec3, u: Vec3) -> Quat)
    & ((m: Mat4) -> Quat)
    & (() -> Quat),
  random:
    & (() -> number)
    & ((high: number) -> number)
    & ((low: number, high: number) -> number),
  randomNormal: (sigma: number?, mu: number?) -> number,
  setRandomSeed: (seed: number) -> (),
  vec2:
    & ((x: number?, y: number?) -> Vec2)
    & ((u: Vec2) -> Vec2),
  vec3:
    & ((x: number?, y: number?, z: number?) -> Vec3)
    & ((u: Vec3) -> Vec3)
    & ((m: Mat4) -> Vec3)
    & ((q: Quat) -> Vec3),
  vec4:
    & ((x: number?, y: number?, z: number?, w: number?) -> Vec4)
    & ((u: Vec4) -> Vec4),
}

type JointType =
  | "ball"
  | "distance"
  | "hinge"
  | "slider"

type MotorMode =
  | "position"
  | "velocity"

type ShapeType =
  | "box"
  | "sphere"
  | "capsule"
  | "cylinder"
  | "convex"
  | "mesh"
  | "terrain"

declare class BallJoint extends Joint
end

declare class BoxShape extends Shape
  function getDimensions(self): (number, number, number)
  function setDimensions(self, width: number, height: number, depth: number)
end

declare class CapsuleShape extends Shape
  function getLength(self): number
  function getRadius(self): number
  function setLength(self, length: number)
  function setRadius(self, radius: number)
end

declare class Collider extends Object
  function addShape(self, shape: Shape)
  function applyAngularImpulse(self, x: number, y: number, z: number)
  function applyAngularImpulse(self, impulse: Vec3)
  function applyForce(self, x: number, y: number, z: number)
  function applyForce(self, x: number, y: number, z: number, px: number, py: number, pz: number)
  function applyForce(self, force: Vec3)
  function applyForce(self, force: Vec3, position: Vec3)
  function applyLinearImpulse(self, x: number, y: number, z: number)
  function applyLinearImpulse(self, x: number, y: number, z: number, px: number, py: number, pz: number)
  function applyLinearImpulse(self, impulse: Vec3)
  function applyLinearImpulse(self, impulse: Vec3, position: Vec3)
  function applyTorque(self, x: number, y: number, z: number)
  function applyTorque(self, torque: Vec3)
  function destroy(self)
  function getAABB(self): (number, number, number, number, number, number)
  function getAngularDamping(self): number
  function getAngularVelocity(self): (number, number, number)
  function getAutomaticMass(self): boolean
  function getCenterOfMass(self): (number, number, number)
  function getDegreesOfFreedom(self): (string, string)
  function getFriction(self): number
  function getGravityScale(self): number
  function getInertia(self): (number, number, number, number, number, number, number)
  function getJoints(self): {}
  function getLinearDamping(self): number
  function getLinearVelocity(self): (number, number, number)
  function getLinearVelocityFromLocalPoint(self, x: number, y: number, z: number): (number, number, number)
  function getLinearVelocityFromLocalPoint(self, point: Vec3): (number, number, number)
  function getLinearVelocityFromWorldPoint(self, x: number, y: number, z: number): (number, number, number)
  function getLinearVelocityFromWorldPoint(self, point: Vec3): (number, number, number)
  function getLocalPoint(self, wx: number, wy: number, wz: number): (number, number, number)
  function getLocalPoint(self, point: Vec3): (number, number, number)
  function getLocalVector(self, wx: number, wy: number, wz: number): (number, number, number)
  function getLocalVector(self, vector: Vec3): (number, number, number)
  function getMass(self): number
  function getOrientation(self): (number, number, number, number)
  function getPose(self): (number, number, number, number, number, number, number)
  function getPosition(self): (number, number, number)
  function getRestitution(self): number
  function getShape(self): Shape | nil
  function getShapes(self): {}
  function getTag(self): string | nil
  function getUserData(self): any
  function getWorld(self): World
  function getWorldPoint(self, x: number, y: number, z: number): (number, number, number)
  function getWorldPoint(self, point: Vec3): (number, number, number)
  function getWorldVector(self, x: number, y: number, z: number): (number, number, number)
  function getWorldVector(self, vector: Vec3): (number, number, number)
  function isAwake(self): boolean
  function isContinuous(self): boolean
  function isDestroyed(self): boolean
  function isEnabled(self): boolean
  function isGravityIgnored(self): boolean
  function isKinematic(self): boolean
  function isSensor(self): boolean
  function isSleepingAllowed(self): boolean
  function moveKinematic(self)
  function removeShape(self, shape: Shape)
  function resetMassData(self)
  function setAngularDamping(self, damping: number)
  function setAngularVelocity(self, vx: number, vy: number, vz: number)
  function setAngularVelocity(self, velocity: Vec3)
  function setAutomaticMass(self, enable: boolean)
  function setAwake(self, awake: boolean)
  function setCenterOfMass(self, x: number, y: number, z: number)
  function setCenterOfMass(self, center: Vec3)
  function setContinuous(self, continuous: boolean)
  function setDegreesOfFreedom(self, translation: string?, rotation: string?)
  function setEnabled(self, enable: boolean)
  function setFriction(self, friction: number)
  function setGravityIgnored(self, ignored: boolean)
  function setGravityScale(self, scale: number)
  function setInertia(self, dx: number, dy: number, dz: number, angle: number, ax: number, ay: number, az: number)
  function setInertia(self, diagonal: Vec3, rotation: Quat)
  function setKinematic(self, kinematic: boolean)
  function setLinearDamping(self, damping: number)
  function setLinearVelocity(self, vx: number, vy: number, vz: number)
  function setLinearVelocity(self, velocity: Vec3)
  function setMass(self, mass: number)
  function setOrientation(self, angle: number, ax: number, ay: number, az: number)
  function setOrientation(self, orientation: Quat)
  function setPose(self, x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number)
  function setPose(self, position: Vec3, orientation: Quat)
  function setPosition(self, x: number, y: number, z: number)
  function setPosition(self, position: Vec3)
  function setRestitution(self, restitution: number)
  function setSensor(self, sensor: boolean)
  function setSleepingAllowed(self, sleepy: boolean)
  function setTag(self, tag: string)
  function setTag(self)
  function setUserData(self, data: any)
end

declare class ConeJoint extends Joint
  function getAxis(self): (number, number, number)
  function getLimit(self): number
  function setLimit(self, limit: number)
end

declare class Contact
  function getColliders(self): (Collider, Collider)
  function getFriction(self): number
  function getNormal(self): (number, number, number)
  function getOverlap(self): number
  function getPoints(self): number
  function getRestitution(self): number
  function getShapes(self): (Shape, Shape)
  function getSurfaceVelocity(self): (number, number, number)
  function isEnabled(self): boolean
  function setEnabled(self, enable: boolean)
  function setFriction(self, friction: number)
  function setRestitution(self, restitution: number)
  function setSurfaceVelocity(self, x: number, y: number, z: number)
  function setSurfaceVelocity(self, velocity: Vec3)
end

declare class ConvexShape extends Shape
  function getFace(self, index: number): {}
  function getFaceCount(self): number
  function getPoint(self, index: number): (number, number, number)
  function getPointCount(self): number
  function getScale(self): number
end

declare class CylinderShape extends Shape
  function getLength(self): number
  function getRadius(self): number
  function setLength(self, length: number)
  function setRadius(self, radius: number)
end

declare class DistanceJoint extends Joint
  function getLimits(self): (number, number)
  function getSpring(self): (number, number)
  function setLimits(self, min: number?, max: number?)
  function setLimits(self)
  function setSpring(self, frequency: number?, damping: number?)
end

declare class HingeJoint extends Joint
  function getAngle(self): number
  function getAxis(self): (number, number, number)
  function getFriction(self): number
  function getLimits(self): (number, number)
  function getMaxMotorTorque(self): (number, number)
  function getMotorMode(self): MotorMode
  function getMotorSpring(self): (number, number)
  function getMotorTarget(self): number
  function getMotorTorque(self): number
  function getSpring(self): (number, number)
  function setFriction(self, friction: number)
  function setLimits(self, min: number, max: number)
  function setLimits(self)
  function setMaxMotorTorque(self, positive: number?, negative: number?)
  function setMotorMode(self, mode: MotorMode)
  function setMotorMode(self)
  function setMotorSpring(self, frequency: number?, damping: number?)
  function setMotorTarget(self, target: number)
  function setSpring(self, frequency: number?, damping: number?)
end

declare class Joint extends Object
  function destroy(self)
  function getAnchors(self): (number, number, number, number, number, number)
  function getColliders(self): (Collider, Collider)
  function getForce(self): number
  function getPriority(self): number
  function getTorque(self): number
  function getType(self): JointType
  function getUserData(self): any
  function isDestroyed(self): boolean
  function isEnabled(self): boolean
  function setEnabled(self, enabled: boolean)
  function setPriority(self, priority: number)
  function setUserData(self, data: any)
end

declare class MeshShape extends Shape
  function getScale(self): number
end

declare class Shape extends Object
  function containsPoint(self, x: number, y: number, z: number): boolean
  function containsPoint(self, point: Vec3): boolean
  function destroy(self)
  function getAABB(self): (number, number, number, number, number, number)
  function getCenterOfMass(self): (number, number, number)
  function getCollider(self): Collider
  function getDensity(self): number
  function getInertia(self): (number, number, number, number, number, number, number)
  function getMass(self): number
  function getOffset(self): (number, number, number, number, number, number, number)
  function getOrientation(self): (number, number, number, number)
  function getPose(self): (number, number, number, number, number, number, number)
  function getPosition(self): (number, number, number)
  function getType(self): ShapeType
  function getUserData(self): any
  function getVolume(self): number
  function isDestroyed(self): boolean
  function raycast(self, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number): (number, number, number, number, number, number, number | nil)
  function raycast(self, origin: Vec3, endpoint: Vec3): (number, number, number, number, number, number, number | nil)
  function setDensity(self, density: number)
  function setOffset(self, x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number)
  function setOffset(self, position: Vec3, rotation: Quat)
  function setUserData(self, data: any)
end

declare class SliderJoint extends Joint
  function getAxis(self): (number, number, number)
  function getFriction(self): number
  function getLimits(self): (number, number)
  function getMaxMotorForce(self): (number, number)
  function getMotorForce(self): number
  function getMotorMode(self): MotorMode
  function getMotorSpring(self): (number, number)
  function getMotorTarget(self): number
  function getPosition(self): number
  function getSpring(self): (number, number)
  function setFriction(self, friction: number)
  function setLimits(self, min: number, max: number)
  function setLimits(self)
  function setMaxMotorForce(self, positive: number?, negative: number?)
  function setMotorMode(self, mode: MotorMode)
  function setMotorMode(self)
  function setMotorSpring(self, frequency: number?, damping: number?)
  function setMotorTarget(self, target: number)
  function setSpring(self, frequency: number?, damping: number?)
end

declare class SphereShape extends Shape
  function getRadius(self): number
  function setRadius(self, radius: number)
end

declare class TerrainShape extends Shape
end

declare class WeldJoint extends Joint
end

declare class World extends Object
  function destroy(self)
  function disableCollisionBetween(self, tag1: string, tag2: string)
  function enableCollisionBetween(self, tag1: string, tag2: string)
  function getAngularDamping(self): (number, number)
  function getCallbacks(self): {}
  function getColliderCount(self): number
  function getColliders(self): {Collider}
  function getGravity(self): (number, number, number)
  function getJointCount(self): number
  function getJoints(self): {Joint}
  function getLinearDamping(self): (number, number)
  function getResponseTime(self): number
  function getStepCount(self): number
  function getTags(self): {string}
  function getTightness(self): number
  function interpolate(self, alpha: number)
  function isCollisionEnabledBetween(self, tag1: string, tag2: string): boolean
  function isDestroyed(self): boolean
  function isSleepingAllowed(self): boolean
  function newBoxCollider(self, x: number?, y: number?, z: number?, width: number?, height: number?, depth: number?): Collider
  function newBoxCollider(self, position: Vec3, size: Vec3): Collider
  function newCapsuleCollider(self, x: number?, y: number?, z: number?, radius: number?, length: number?): Collider
  function newCapsuleCollider(self, position: Vec3, radius: number?, length: number?): Collider
  function newCollider(self, x: number, y: number, z: number): Collider
  function newCollider(self, position: Vec3): Collider
  function newConvexCollider(self, x: number?, y: number?, z: number?, points: {}, scale: number?): Collider
  function newConvexCollider(self, position: Vec3, points: {}, scale: number?): Collider
  function newConvexCollider(self, x: number?, y: number?, z: number?, modelData: ModelData, scale: number?): Collider
  function newConvexCollider(self, position: Vec3, modelData: ModelData, scale: number?): Collider
  function newConvexCollider(self, x: number?, y: number?, z: number?, model: Model, scale: number?): Collider
  function newConvexCollider(self, position: Vec3, model: Model, scale: number?): Collider
  function newConvexCollider(self, x: number?, y: number?, z: number?, mesh: Mesh, scale: number?): Collider
  function newConvexCollider(self, position: Vec3, mesh: Mesh, scale: number?): Collider
  function newConvexCollider(self, x: number?, y: number?, z: number?, template: ConvexShape, scale: number?): Collider
  function newConvexCollider(self, position: Vec3, template: ConvexShape, scale: number?): Collider
  function newCylinderCollider(self, x: number?, y: number?, z: number?, radius: number?, length: number?): Collider
  function newCylinderCollider(self, position: Vec3, radius: number?, length: number?): Collider
  function newMeshCollider(self, vertices: {}, indices: {}): Collider
  function newMeshCollider(self, modelData: ModelData): Collider
  function newMeshCollider(self, model: Model): Collider
  function newMeshCollider(self, mesh: Mesh): Collider
  function newMeshCollider(self, template: MeshShape): Collider
  function newSphereCollider(self, x: number?, y: number?, z: number?, radius: number?): Collider
  function newSphereCollider(self, position: Vec3, radius: number?): Collider
  function newTerrainCollider(self, scale: number): Collider
  function newTerrainCollider(self, scale: number, heightmap: Image, stretch: number?): Collider
  function newTerrainCollider(self, scale: number, callback: (x: number, z: number) -> number, samples: number?): Collider
  function overlapShape(self, shape: Shape, x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number, maxDistance: number?, filter: string?, callback: () -> ()?)
  function overlapShape(self, shape: Shape, position: Vec3, orientation: Quat, maxDistance: number?, filter: string?, callback: () -> ()?)
  function overlapShape(self, shape: Shape, x: number, y: number, z: number, angle: number, ax: number, ay: number, az: number, maxDistance: number?, filter: string?): (Collider, Shape, number, number, number, number, number, number)
  function overlapShape(self, shape: Shape, position: Vec3, orientation: Quat, maxDistance: number?, filter: string?): (Collider, Shape, number, number, number, number, number, number)
  function queryBox(self, x: number, y: number, z: number, width: number, height: number, depth: number, filter: string?, callback: () -> ()?)
  function queryBox(self, position: Vec3, size: Vec3, filter: string?, callback: () -> ()?)
  function queryBox(self, x: number, y: number, z: number, width: number, height: number, depth: number, filter: string?): Collider
  function queryBox(self, position: Vec3, size: Vec3, filter: string?): Collider
  function querySphere(self, x: number, y: number, z: number, radius: number, filter: string?, callback: () -> ()?)
  function querySphere(self, position: Vec3, radius: number, filter: string?, callback: () -> ()?)
  function querySphere(self, x: number, y: number, z: number, radius: number, filter: string?): Collider
  function querySphere(self, position: Vec3, radius: number, filter: string?): Collider
  function raycast(self, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number, filter: string?, callback: (collider: Collider, shape: Shape, x: number, y: number, z: number, nx: number, ny: number, nz: number, triangle: number, fraction: number) -> number??)
  function raycast(self, origin: Vec3, endpoint: Vec3, filter: string?, callback: (collider: Collider, shape: Shape, x: number, y: number, z: number, nx: number, ny: number, nz: number, triangle: number, fraction: number) -> number??)
  function raycast(self, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number, filter: string?): (Collider, Shape, number, number, number, number, number, number, number | nil)
  function raycast(self, origin: Vec3, endpoint: Vec3, filter: string?): (Collider, Shape, number, number, number, number, number, number, number | nil)
  function setAngularDamping(self, damping: number, threshold: number?)
  function setCallbacks(self, callbacks: {})
  function setGravity(self, xg: number, yg: number, zg: number)
  function setGravity(self, gravity: Vec3)
  function setLinearDamping(self, damping: number, threshold: number?)
  function setResponseTime(self, responseTime: number)
  function setSleepingAllowed(self, allowed: boolean)
  function setStepCount(self, steps: number)
  function setTightness(self, tightness: number)
  function shapecast(self, shape: Shape, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number, angle: number, ax: number, ay: number, az: number, filter: string?, callback: (collider: Collider, shape: Shape, x: number, y: number, z: number, nx: number, ny: number, nz: number, triangle: number, fraction: number) -> number?)
  function shapecast(self, shape: Shape, position: Vec3, destination: Vec3, orientation: Quat, filter: string?, callback: (collider: Collider, shape: Shape, x: number, y: number, z: number, nx: number, ny: number, nz: number, triangle: number, fraction: number) -> number?)
  function shapecast(self, shape: Shape, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number, angle: number, ax: number, ay: number, az: number, filter: string?): (Collider, Shape, number, number, number, number, number, number, number, number)
  function shapecast(self, shape: Shape, position: Vec3, destination: Vec3, orientation: Quat, filter: string?): (Collider, Shape, number, number, number, number, number, number, number, number)
  function update(self, dt: number)
end

type PhysicsModule = {
  newBallJoint:
    & ((colliderA: Collider, colliderB: Collider, x: number, y: number, z: number) -> BallJoint)
    & ((colliderA: Collider, colliderB: Collider, anchor: Vec3) -> BallJoint),
  newBoxShape: (width: number?, height: number?, depth: number?) -> BoxShape,
  newCapsuleShape: (radius: number?, length: number?) -> CapsuleShape,
  newConeJoint:
    & ((colliderA: Collider, colliderB: Collider, x: number, y: number, z: number, ax: number, ay: number, az: number) -> ConeJoint)
    & ((colliderA: Collider, colliderB: Collider, anchor: Vec3, axis: Vec3) -> ConeJoint),
  newConvexShape:
    & ((points: {}, scale: number?) -> ConvexShape)
    & ((object: ModelData | Model | Mesh, scale: number?) -> ConvexShape)
    & ((template: ConvexShape, scale: number?) -> ConvexShape),
  newCylinderShape: (radius: number?, length: number?) -> CylinderShape,
  newDistanceJoint:
    & ((colliderA: Collider, colliderB: Collider, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number) -> DistanceJoint)
    & ((colliderA: Collider, colliderB: Collider, first: Vec3, second: Vec3) -> DistanceJoint),
  newHingeJoint:
    & ((colliderA: Collider, colliderB: Collider, x: number, y: number, z: number, ax: number, ay: number, az: number) -> HingeJoint)
    & ((colliderA: Collider, colliderB: Collider, anchor: Vec3, axis: Vec3) -> HingeJoint),
  newMeshShape:
    & ((vertices: {}, indices: {}, scale: number?) -> MeshShape)
    & ((object: ModelData | Model | Mesh, scale: number?) -> MeshShape)
    & ((template: MeshShape, scale: number?) -> MeshShape),
  newSliderJoint:
    & ((colliderA: Collider, colliderB: Collider, ax: number, ay: number, az: number) -> SliderJoint)
    & ((colliderA: Collider, colliderB: Collider, axis: Vec3) -> SliderJoint),
  newSphereShape: (radius: number?) -> SphereShape,
  newTerrainShape:
    & ((scale: number) -> TerrainShape)
    & ((scale: number, heightmap: Image, stretch: number?) -> TerrainShape)
    & ((scale: number, callback: (x: number, z: number) -> (), samples: number?) -> TerrainShape),
  newWeldJoint: (colliderA: Collider, colliderB: Collider) -> WeldJoint,
  newWorld: (settings: {}?) -> World,
}

type Permission =
  | "audiocapture"

type SystemModule = {
  getClipboardText: () -> string | nil,
  getCoreCount: () -> number,
  getMousePosition: () -> (number, number),
  getMouseX: () -> number,
  getMouseY: () -> number,
  getOS: () -> string,
  getWindowDensity: () -> number,
  getWindowDimensions: () -> (number, number),
  getWindowHeight: () -> number,
  getWindowWidth: () -> number,
  hasKeyRepeat: () -> boolean,
  isKeyDown: (...KeyCode) -> boolean,
  isMouseDown: (button: number) -> boolean,
  isWindowFocused: () -> boolean,
  isWindowOpen: () -> boolean,
  isWindowVisible: () -> boolean,
  openWindow: (options: {}) -> (),
  pollEvents: () -> (),
  requestPermission: (permission: Permission) -> (),
  setClipboardText: (text: string) -> (),
  setKeyRepeat: (enable: boolean) -> (),
  wasKeyPressed: (...KeyCode) -> boolean,
  wasKeyReleased: (...KeyCode) -> boolean,
  wasMousePressed: (button: number) -> boolean,
  wasMouseReleased: (button: number) -> boolean,
}

declare class Channel extends Object
  function clear(self)
  function getCount(self): number
  function hasRead(self, id: number): boolean
  function peek(self): (any, boolean)
  function pop(self, wait: number | boolean | nil): any
  function push(self, message: any, wait: number | boolean | nil): (number, boolean)
end

declare class Thread extends Object
  function getError(self): string | nil
  function isRunning(self): boolean
  function start(self, ...: any)
  function wait(self)
end

type ThreadModule = {
  getChannel: (name: string) -> Channel,
  newChannel: () -> Channel,
  newThread:
    & ((code: string) -> Thread)
    & ((file: string | Blob) -> Thread),
}

type TimerModule = {
  getAverageDelta: () -> number,
  getDelta: () -> number,
  getFPS: () -> number,
  getTime: () -> number,
  sleep: (duration: number) -> (),
  step: () -> number,
}

declare lovr: {
  getVersion: () -> (number, number, number, string, string),

  conf: (t: {}) -> (),
  draw: (pass: Pass) -> boolean | nil,
  errhand: (message: string) -> (() -> any),
  filechanged: (path: string, action: FileAction, oldpath: string) -> (),
  focus: (focused: boolean, display: DisplayType) -> (),
  keypressed: (key: KeyCode, scancode: number, isrepeat: boolean) -> (),
  keyreleased: (key: KeyCode, scancode: number) -> (),
  load: (arg: {}) -> (),
  log: (message: string, level: string, tag: string) -> (),
  mirror: (pass: Pass) -> boolean,
  mount: (mounted: boolean) -> (),
  mousemoved: (x: number, y: number, dx: number, dy: number) -> (),
  mousepressed: (x: number, y: number, button: number) -> (),
  mousereleased: (x: number, y: number, button: number) -> (),
  permission: (permission: Permission, granted: boolean) -> (),
  quit: () -> boolean,
  recenter: () -> (),
  resize: (width: number, height: number) -> (),
  restart: () -> any,
  run: () -> (() -> any),
  textinput: (text: string, code: number) -> (),
  threaderror: (thread: Thread, message: string) -> (),
  update: (dt: number) -> (),
  visible: (visible: boolean, display: DisplayType) -> (),
  wheelmoved: (dx: number, dy: number) -> (),

  audio: AudioModule,
  data: DataModule,
  event: EventModule,
  filesystem: FilesystemModule,
  graphics: GraphicsModule,
  headset: HeadsetModule,
  math: MathModule,
  physics: PhysicsModule,
  system: SystemModule,
  thread: ThreadModule,
  timer: TimerModule,
}