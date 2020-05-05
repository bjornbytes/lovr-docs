-- Valve Knuckles Skeleton Indices
Root = 1
Wrist = 2
Thumb0 = 3
Thumb1 = 4
Thumb2 = 5
Thumb3 = 6
IndexFinger0 = 7
IndexFinger1 = 8
IndexFinger2 = 9
IndexFinger3 = 10
IndexFinger4 = 11
MiddleFinger0 = 12
MiddleFinger1 = 13
MiddleFinger2 = 14
MiddleFinger3 = 15
MiddleFinger4 = 16
RingFinger0 = 17
RingFinger1 = 18
RingFinger2 = 19
RingFinger3 = 20
RingFinger4 = 21
PinkyFinger0 = 22
PinkyFinger1 = 23
PinkyFinger2 = 24
PinkyFinger3 = 25
PinkyFinger4 = 26
Aux_Thumb = 27
Aux_IndexFinger = 28
Aux_MiddleFinger = 29
Aux_RingFinger = 30
Aux_PinkyFinger = 31
Count = 32

local knuckles = {}

-- node to right Knuckles Skeleton
knuckles.right_to_index = {
  finger_thumb_r_end=Thumb3,
  finger_thumb_2_r=Thumb2,
  finger_thumb_1_r=Thumb1,
  finger_thumb_0_r=Thumb0,

  finger_index_r_end=IndexFinger4,
  finger_index_2_r=IndexFinger3,
  finger_index_1_r=IndexFinger2,
  finger_index_0_r=IndexFinger1,
  finger_index_meta_r=IndexFinger0,

  finger_middle_r_end=MiddleFinger4,
  finger_middle_2_r=MiddleFinger3,
  finger_middle_1_r=MiddleFinger2,
  finger_middle_0_r=MiddleFinger1,
  finger_middle_meta_r=MiddleFinger0,

  finger_ring_r_end=RingFinger4,
  finger_ring_2_r=RingFinger3,
  finger_ring_1_r=RingFinger2,
  finger_ring_0_r=RingFinger1,
  finger_ring_meta_r=RingFinger0,

  finger_pinky_r_end=PinkyFinger4,
  finger_pinky_2_r=PinkyFinger3,
  finger_pinky_1_r=PinkyFinger2,
  finger_pinky_0_r=PinkyFinger1,
  finger_pinky_meta_r=PinkyFinger0,

  wrist_r=Wrist,

  finger_index_r_aux=Aux_IndexFinger,
  finger_middle_r_aux=Aux_MiddleFinger,
  finger_pinky_r_aux=Aux_PinkyFinger,
  finger_ring_r_aux=Aux_RingFinger,
  finger_thumb_r_aux=Aux_Thumb,

  Root=Root
}

-- node to left Knuckles Skeleton
knuckles.left_to_index = {
  finger_thumb_l_end=Thumb3,
  finger_thumb_2_l=Thumb2,
  finger_thumb_1_l=Thumb1,
  finger_thumb_0_l=Thumb0,

  finger_index_l_end=IndexFinger4,
  finger_index_2_l=IndexFinger3,
  finger_index_1_l=IndexFinger2,
  finger_index_0_l=IndexFinger1,
  finger_index_meta_l=IndexFinger0,

  finger_middle_l_end=MiddleFinger4,
  finger_middle_2_l=MiddleFinger3,
  finger_middle_1_l=MiddleFinger2,
  finger_middle_0_l=MiddleFinger1,
  finger_middle_meta_l=MiddleFinger0,

  finger_ring_l_end=RingFinger4,
  finger_ring_2_l=RingFinger3,
  finger_ring_1_l=RingFinger2,
  finger_ring_0_l=RingFinger1,
  finger_ring_meta_l=RingFinger0,

  finger_pinky_l_end=PinkyFinger4,
  finger_pinky_2_l=PinkyFinger3,
  finger_pinky_1_l=PinkyFinger2,
  finger_pinky_0_l=PinkyFinger1,
  finger_pinky_meta_l=PinkyFinger0,

  wrist_l=Wrist,

  finger_index_l_aux=Aux_IndexFinger,
  finger_middle_l_aux=Aux_MiddleFinger,
  finger_pinky_l_aux=Aux_PinkyFinger,
  finger_ring_l_aux=Aux_RingFinger,
  finger_thumb_l_aux=Aux_Thumb,

  Root=Root
}

knuckles.hand_to_index = {
  right=knuckles.right_to_index,
  left=knuckles.left_to_index
}

return knuckles